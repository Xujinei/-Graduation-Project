package com.swm.controller;

import com.alibaba.fastjson.JSON;
import com.swm.entity.Department;
import com.swm.entity.Position;
import com.swm.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("/position")
public class PositionController {

    @Autowired
    private PositionService positionService;

    @RequestMapping(value = "/allPosition")
    public void getAllPosition(PrintWriter out, HttpServletResponse response) {

        response.setHeader("Content-type", "text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        List<Position> positionsList = positionService.getAllPosition();
        String positionJson = JSON.toJSONString(positionsList);
        System.out.println(positionJson);
        try {
            response.getWriter().write(positionJson);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
