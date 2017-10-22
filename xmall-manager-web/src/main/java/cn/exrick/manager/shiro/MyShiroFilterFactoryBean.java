package cn.exrick.manager.shiro;

import cn.exrick.manager.pojo.TbShiroFilter;
import cn.exrick.manager.service.SystemService;
import org.apache.shiro.config.Ini;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.util.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author Exrickx
 */
public class MyShiroFilterFactoryBean extends ShiroFilterFactoryBean {

    private static final Logger log= LoggerFactory.getLogger(MyShiroFilterFactoryBean.class);

    /**
     * 配置中的过滤链
     */
    public static String definitions;

    //权限service
    @Autowired
    private SystemService systemService;

    /**
     * 从数据库动态读取权限
     */
    @Override
    public void setFilterChainDefinitions(String definitions) {

        MyShiroFilterFactoryBean.definitions = definitions;

        //数据库动态权限
        List<TbShiroFilter> list = systemService.getShiroFilter();
        for(TbShiroFilter tbShiroFilter : list){
            //字符串拼接权限
            definitions = definitions+tbShiroFilter.getName() + " = "+tbShiroFilter.getPerms()+"\n";
        }

        log.info(definitions);

        //从配置文件加载权限配置
        Ini ini = new Ini();
        ini.load(definitions);
        Ini.Section section = ini.getSection("urls");
        if (CollectionUtils.isEmpty(section)) {
            section = ini.getSection("");
        }

        this.setFilterChainDefinitionMap(section);
    }
}
