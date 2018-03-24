package com.swm.controller;

import com.swm.service.SalaryService;
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
    /**
     * 导入当月工时
     */
    public void uploadWorkTime(PrintWriter out, HttpServletRequest request) {

        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
        MultipartFile workTimefile = multipartHttpServletRequest.getFile("workTime");
//        MultipartFile subsidyfile = multipartHttpServletRequest.getFile("subsidy");
        if (workTimefile == null) {
            return;
        }
        String workTimeName = workTimefile.getOriginalFilename();
//        String subSidyName = subsidyfile.getOriginalFilename();
        long workTimesize = workTimefile.getSize();
//        long subSidySize = subsidyfile.getSize();
        if (((workTimeName == null || "".equals(workTimeName)) && workTimesize == 0)) {
            return;
        }
        //批量导入。参数：文件名，文件。,并结算当月工资
        boolean b = uploadService.batchImport(workTimeName, workTimefile);
        if (b) {
            out.write("导入结算当月薪酬成功");
        } else {
            out.write("导入结算当月薪酬失败");
        }
    }
}
