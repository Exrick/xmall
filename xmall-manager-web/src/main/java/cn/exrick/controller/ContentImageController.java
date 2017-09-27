package cn.exrick.controller;

import cn.exrick.common.pojo.DataTablesResult;
import cn.exrick.common.pojo.Result;
import cn.exrick.common.utils.QiniuUtil;
import cn.exrick.common.utils.ResultUtil;
import cn.exrick.content.service.ContentImageService;
import cn.exrick.pojo.TbImage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

@RestController
@Api(description = "图片列表信息")
public class ContentImageController {

    @Autowired
    private ContentImageService contentImageService;

    @RequestMapping(value = "/image/list",method = RequestMethod.GET)
    @ApiOperation(value = "通过获得图片列表")
    public DataTablesResult getContentImage(){

        DataTablesResult result=contentImageService.getContentImage();
        return result;
    }

    @RequestMapping(value = "/image/update",method = RequestMethod.POST)
    @ApiOperation(value = "编辑图片")
    public Result<Object> updateContentImage(@ModelAttribute TbImage tbImage){

        contentImageService.updateContentImage(tbImage);
        return new ResultUtil<Object>().setData(null);
    }

    @RequestMapping(value = "/image/imageUpload",method = RequestMethod.POST)
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
