package com.swm.controller;

import com.swm.service.serviceImpl.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;

@Controller
@RequestMapping("/upload")
public class UploadController {

    @Autowired
    private UploadService uploadService;

    @RequestMapping("/upload")
    public void uploadWorkTime(PrintWriter out, HttpServletRequest request) {

        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
        MultipartFile workTimefile = multipartHttpServletRequest.getFile("workTime");
        if (workTimefile == null) {
            return;
        }
        String workTimeName = workTimefile.getOriginalFilename();
        long workTimesize = workTimefile.getSize();
        if ((workTimeName == null || "".equals(workTimeName)) && workTimesize == 0) {
            return;
        }
        //批量导入。参数：文件名，文件。
        boolean b = uploadService.batchImport(workTimeName, workTimefile);
        if (b) {
            out.write("导入excel成功");
        } else {
            out.write("导入excel失败");
        }


    }
}
