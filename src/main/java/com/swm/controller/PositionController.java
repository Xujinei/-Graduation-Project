package com.swm.controller;

import com.alibaba.fastjson.JSON;

import com.alibaba.fastjson.serializer.SerializerFeature;
import com.swm.entity.Position;
import com.swm.service.PositionService;
import com.swm.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/position")
public class PositionController {

    @Autowired
    private PositionService positionService;

    /**
     * 获得所有职务信息
     *
     * @param out
     * @param response
     */
    @RequestMapping(value = "/allPosition")
    public void getAllPosition(PrintWriter out, HttpServletResponse response) {
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        List<Position> positionsList = positionService.getAllPosition();
        String positionJson = JSON.toJSONString(positionsList, SerializerFeature.DisableCircularReferenceDetect);
        try {
            response.getWriter().write(positionJson);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @RequestMapping("/addPosition")
    public void addPosition(PrintWriter out, HttpServletRequest request) {
        Position position = new Position();
        position.setName(request.getParameter("name"));
        position.setDuty(request.getParameter("duty"));
        position.setRemark(request.getParameter("remark"));
        position.setRequired(request.getParameter("required"));

        if (position == null) {
            return;
        }
        int result = positionService.addPosition(position);
        if (result > 0) {
            out.write("添加成功");
        } else if (result == -2) {
            out.write("已存在相同名称的职务");
        } else {
            out.write("添加失败");
        }

    }

    /**
     * 分页获取职务信息
     *
     * @param pageIndex
     * @param pageSize
     * @return
     */
    @RequestMapping("/pagePosition")
    public void getPagePosition(Integer pageIndex, Integer pageSize, PrintWriter out, HttpServletRequest request) {
        PageUtil<Position> departmentPage = positionService.getPagePosition(pageIndex, pageSize);
        String departmentPageJson = JSON.toJSONString(departmentPage, SerializerFeature.DisableCircularReferenceDetect);

        request.setAttribute("pageCount", departmentPage.getPageCount());
        out.write(departmentPageJson);

    }


    /**
     * 修改职位信息
     *
     * @param out
     * @param request
     */
    @RequestMapping("/updatePosition")
    public void updatePosition(PrintWriter out, HttpServletRequest request) {
        String sid = request.getParameter("id");
        if (sid == null && sid == "") {
            out.write("修改失败");
            return;
        }
        Position position = new Position();
        position.setId(Integer.valueOf(sid));
        position.setName(request.getParameter("name"));
        position.setDuty(request.getParameter("duty"));
        position.setRemark(request.getParameter("remark"));
        position.setRequired(request.getParameter("required"));

        positionService.updatePostion(position);
        out.write("修改成功");
    }


    /**
     * 删除职务
     *
     * @param out
     * @param request
     */
    @RequestMapping("deletPostion")
    public void deletPosition(PrintWriter out, HttpServletRequest request) {
        String sid = request.getParameter("id");
        if (sid == null && sid == "") {
            out.write("删除失败");
            return;
        }
        Integer id = Integer.valueOf(sid);
        int n = positionService.deletePosition(id);
        if (n > 0) {
            out.write("删除成功");
        }

    }
}
