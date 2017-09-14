package cn.exrick.common.utils;

import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.HashMap;

public class QiniuUtil {

    private final static Logger log= LoggerFactory.getLogger(QiniuUtil.class);

    public static String QiniuUpload(String filePath){

        //构造一个带指定Zone对象的配置类 zone2华南
        Configuration cfg = new Configuration(Zone.zone2());

        UploadManager uploadManager = new UploadManager(cfg);

        //生成上传凭证，然后准备上传
        String accessKey = "foqF1A__-aTEg_8EWj5yb5oi4CFrcWnQluwEN1qV";
        String secretKey = "pnm8kAw-kjdaRYPuwpuBOU-5eXc6KXNc4clHIoZg";
        String bucket = "xmall";
        String url="http://ow2h3ee9w.bkt.clouddn.com/";

        String localFilePath = filePath;
        //默认不指定key的情况下，以文件内容的hash值作为文件名
        String key = null;
        Auth auth = Auth.create(accessKey, secretKey);
        String upToken = auth.uploadToken(bucket);

        try {
            Response response = uploadManager.put(localFilePath, key, upToken);
            //解析上传成功的结果
            DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
            return url+putRet.key;
        }catch(QiniuException ex){
            Response r = ex.response;
            log.warn(r.toString());
            try {
                log.warn(r.bodyString());
                return r.bodyString();
            } catch (QiniuException ex2) {
                //ignore
            }
        }
        return null;
    }

    /**
     * 以时间戳重命名
     * @param fileName
     * @return
     */
    public static String renamePic(String fileName){
        String extName = fileName.substring(fileName.lastIndexOf("."));
        return System.currentTimeMillis()+extName;
    }

    public static String isValidImage(HttpServletRequest request, MultipartFile file){
        //最大文件大小
        long maxSize = 5242880;
        //定义允许上传的文件扩展名
        HashMap<String, String> extMap = new HashMap<String, String>();
        extMap.put("image", "gif,jpg,jpeg,png,bmp");

        if(!ServletFileUpload.isMultipartContent(request)){
            return "请选择文件";
        }

        if(file.getSize() > maxSize){
            return "上传文件大小超过5MB限制";
        }
        //检查扩展名
        String fileName=file.getOriginalFilename();
        String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
        if(!Arrays.<String>asList(extMap.get("image").split(",")).contains(fileExt)){
            return "上传文件扩展名是不允许的扩展名\n只允许" + extMap.get("image") + "格式";
        }

        return "valid";
    }

    public static String checkExt(String fileName,String dirName){
        //定义允许上传的文件扩展名
        HashMap<String, String> extMap = new HashMap<String, String>();
        extMap.put("image", "gif,jpg,jpeg,png,bmp");
        extMap.put("flash", "swf,flv");
        extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");

        //检查扩展名
        String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
        if(!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)){
            return "上传文件扩展名是不允许的扩展名\n只允许" + extMap.get(dirName) + "格式";
        }
        return "valid";
    }

    public static void main(String[] args){
        //System.out.println(renamePic("2.jpg"));
    }
}
