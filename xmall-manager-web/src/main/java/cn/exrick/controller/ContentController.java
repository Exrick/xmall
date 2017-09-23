package cn.exrick.controller;

import cn.exrick.common.pojo.DataTablesResult;
import cn.exrick.common.pojo.Result;
import cn.exrick.common.utils.QiniuUtil;
import cn.exrick.common.utils.ResultUtil;
import cn.exrick.content.service.ContentService;
import cn.exrick.pojo.TbContent;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

@RestController
@Api(description = "内容列表信息")
public class ContentController {

    @Autowired
    private ContentService contentService;

    @RequestMapping(value = "/content/list/{cid}",method = RequestMethod.GET)
    @ApiOperation(value = "通过cid获得内容列表")
    public DataTablesResult getContentByCid(@PathVariable Long cid){

        DataTablesResult result=contentService.getContentListByCid(cid);
        return result;
    }

    @RequestMapping(value = "/content/add",method = RequestMethod.POST)
    @ApiOperation(value = "添加内容")
    public Result<Object> addContent(@ModelAttribute TbContent tbContent){

        contentService.addContent(tbContent);
        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/content/update",method = RequestMethod.POST)
    @ApiOperation(value = "编辑内容")
    public Result<Object> updateContent(@ModelAttribute TbContent tbContent){

        contentService.updateContent(tbContent);
        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/content/del/{id}",method = RequestMethod.DELETE)
    @ApiOperation(value = "删除内容")
    public Result<Object> addContent(@PathVariable Long id){

        contentService.deleteContent(id);
        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/content/imageUpload",method = RequestMethod.POST)
    @ApiOperation(value = "WebUploader图片上传")
    public Result<Object> uploadFile(@RequestParam("file") MultipartFile files,
                                     HttpServletRequest request){

        String imagePath=null;
        // 文件保存路径
        String filePath = request.getSession().getServletContext().getRealPath("/upload")+"\\"
                + QiniuUtil.renamePic(files.getOriginalFilename());
        // 转存文件
        try {
            //保存至服务器
            File file=new File((filePath));
            files.transferTo(file);
            //上传七牛云服务器
            imagePath= QiniuUtil.QiniuUpload(filePath);
            // 路径为文件且不为空则进行删除
            if (file.isFile() && file.exists()) {
                file.delete();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ResultUtil<Object>().setData(imagePath);
    }
}
