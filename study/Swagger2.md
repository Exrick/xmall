# Swagger2安装使用
1. Maven依赖安装
```
<!-- swagger2 -->
<dependency>
    <groupId>io.springfox</groupId>
    <artifactId>springfox-swagger2</artifactId>
    <version>2.6.1</version>
</dependency>
<dependency>
    <groupId>io.springfox</groupId>
    <artifactId>springfox-swagger-ui</artifactId>
    <version>2.6.1</version>
</dependency>
```

2. Swagger的Java配置文件
```
package cn.exrick.swagger;

import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * Created by Exrick on 2017/8/15.
 */
@Configuration  //让Spring来加载该类配置
@EnableWebMvc   //非SpringBoot需启用
@EnableSwagger2 //启用Swagger2
public class Swagger2Config {
    static final Logger log= LoggerFactory.getLogger(Swagger2Config.class);
    @Bean
    public Docket createRestApi() {
        log.info("加载Swagger2");
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo()).select()
                //扫描指定包中的swagger注解
                //.apis(RequestHandlerSelectors.basePackage("cn.exrick.controller"))
                //扫描所有有注解的api，用这种方式更灵活
                .apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class))
                .paths(PathSelectors.any())
                .build();
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("XMall Api Documentation")
                .description("XMall商城API接口文档")
                .termsOfServiceUrl("http://blog.exrick.cn")
                .contact(new Contact("Exrick", "http://blog.exrick.cn", "1012139570@qq.com"))
                .version("1.0.0")
                .build();
    }
}
```

3. Controller中API文档说明注解添加
```
package cn.exrick.controller;

import cn.exrick.common.utils.XMallResult;
import cn.exrick.pojo.DataTablesResult;
import cn.exrick.pojo.TbMember;
import cn.exrick.service.MemberService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


/**
 * Created by Exrick on 2017/8/11.
 */
@RestController
@Api(description= "会员列表信息")
public class MemberController {

    @Autowired
    private MemberService memberService;

    /**
     * 分页搜索查询会员
     * @param draw
     * @param start
     * @param length
     * @param search
     * @return
     */
    @RequestMapping(value = "/member/list",method = RequestMethod.GET)
    @ResponseBody
    @ApiOperation(value = "分页搜索获取会员列表")
    public DataTablesResult getMemberList(int draw, int start, int length, @RequestParam("search[value]") String search){
        DataTablesResult result=memberService.getMemberList(draw,start,length,search);
        return result;
    }
}
```

4. 按常规, 现在访问 http://localhost:8090/swagger-ui.html 应该能看到效果了, 但出现404

- 处理方法：在 GitHub 上[下载 SwaggerUI 项目](https://github.com/swagger-api/swagger-ui
)，建议[下载2.0分支版本](https://github.com/swagger-api/swagger-ui/tree/2.x)，界面清爽点，将dist下所有内容拷贝到本地项目resource/static/swagger下面, 并修改 index.html
```
//url = "http://petstore.swagger.io/v2/swagger.json";        
url = "http://localhost:8888/v2/api-docs";
```
然后访问 http://localhost:8888/static/swagger/index.html

![](http://otabkoy17.bkt.clouddn.com/%E5%BE%AE%E4%BF%A1%E6%88%AA%E5%9B%BE_20170819202037.png)

5. 使用总结

```
@ApiOperation(value = "获取图片资源",response = byte[].class,produces = "application/json;charset=UTF-8")
    @ApiResponses({
            @ApiResponse(code=404,message="没有找到该图片")
    })
    @GetMapping(value = "/files/images/{id}",produces = "image/jpeg;image/png;image/gif")
    public ResponseEntity<String> getImg(@PathVariable("id") long id) {
        return new ResponseEntity<String>(fileService.getFileBydId(id), HttpStatus.OK);
    }
```