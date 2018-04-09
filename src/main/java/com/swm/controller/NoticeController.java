package com.swm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.swm.entity.Account;
import com.swm.entity.Notice;
import com.swm.service.NoticeService;
import com.swm.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

@Controller
@RequestMapping("/notice")
public class NoticeController {
    @Autowired
    NoticeService noticeService;

    @RequestMapping("/getNotice")
    public void getNotice(HttpSession session, PrintWriter out, Integer pageIndex, Integer pageSize) {
        Account account = (Account) session.getAttribute("account");
        Notice notice = new Notice();
        notice.setStatus(1);
        notice.setRecipientid(account.getEmployeeId().getId());
        PageUtil<Notice> noticePage = noticeService.selectByNotice(pageIndex, pageSize, notice);
        String noticeJson = JSON.toJSONString(noticePage, SerializerFeature.DisableCircularReferenceDetect);
        out.write(noticeJson);
    }
}
