package com.lex.controller.web;

import com.fh.controller.base.BaseController;
import com.fh.util.*;
import com.lex.Service.company.CompanyManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by Administrator on 2016/9/27.
 */

@Controller
@RequestMapping(value = "/web/updown")
public class LexUpDown_webController extends BaseController {

    @Autowired
    private CompanyManager companyManager;

    //文件上传 并保存到数据库
    @RequestMapping(value = "/up", method = RequestMethod.POST)
    @ResponseBody
    public Object upFile(@RequestParam(required = false) MultipartFile file) throws Exception {
        String ffile = DateUtil.getDays(), fileName = "", UUID = "";
        PageData pd = this.getUserInfo();
        if (null != file && !file.isEmpty()) {
            String filePath = PathUtil.getClasspath() + Const.WEBFILE + ffile;        //文件上传路径
            UUID = this.get32UUID();
            fileName = FileUpload.fileUp(file, filePath, UUID);                //执行上传
            companyManager.saveFile(file.getOriginalFilename(), filePath + "/" + fileName,/*(int)pd.get("id")*/2);
        } else {
            return setResultMessage(null, Const.APP_RESULT_CODE_FAIL, "上传文件为空");
        }
        return setResultMessage(null, Const.APP_RESULT_CODE_SUCCESS,"文件上传成功");
    }

    //根据id下载文件     前台 传输  文件url  文件名
    @RequestMapping(value = "/down",method = RequestMethod.GET)
    public void downloadFile(HttpServletResponse response, HttpServletRequest request) throws Exception {
        PageData pd = this.getPageData();
        PageData fileinfo = companyManager.findFileById(pd);

      // FileDownload.fileDownload(response,request,"E:/.Trashes/FHADMINM/out/artifacts/FHADMINM_war_exploded/WEB-INF/classes/../../uploadFiles/webFile/20160928/cfda9aff8dcb4949909bcf9889f1c2d9.png","前世情人.png");
       FileDownload.fileDownload(response, fileinfo.getString("fileUrl"), fileinfo.getString("fileName"));
    }

    //显示文件列表
    @RequestMapping(value = "/list")
    public String list(Model model) throws Exception {
        List<PageData> lists = companyManager.getFileLisst();
        model.addAttribute("lists", lists);
        return "lex/web/FileList";
    }


}
