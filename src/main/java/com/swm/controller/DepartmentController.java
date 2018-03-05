package com.swm.controller;

import com.alibaba.fastjson.JSON;
import com.swm.entity.Department;
import com.swm.entity.Position;
import com.swm.service.DepartmentService;
import com.swm.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/department")
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    /**
     * 获得所有部门信息
     *
     * @return
     */
    @RequestMapping("/allDepartment")
    public void getAllDepartment(PrintWriter out, HttpServletRequest request, HttpServletResponse response) {

        response.setContentType("text/html;charset=utf-8");
        List<Department> departmentList = departmentService.getAllDepartment();
        String departmentJson = JSON.toJSONString(departmentList);
        System.out.println(departmentJson);
        out.write(departmentJson);
    }

    /**
     * 添加部门
     *
     * @param out
     */
    @RequestMapping("/addDepartment")
    public void addDepartment(PrintWriter out, HttpServletRequest request) {
        Department department = new Department();
        department.setName(request.getParameter("name"));
        //  department.setLeaderid();
        // 获取领导名对应的id
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date createDate = sdf.parse(request.getParameter("createtime"));
            department.setCreatetime(createDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        department.setIntroduction(request.getParameter("introduction"));
        department.setRemark(request.getParameter("remark"));

        if (department == null) {
            return;
        }
        int result = departmentService.addDepartment(department);
        if (result > 0) {
            out.write("添加成功");
        } else if (result == -2) {
            out.write("已存在相同名称的部门");
        } else {
            out.write("添加失败");
        }
    }

    /**
     * 分页获取部门信息
     *
     * @param pageIndex
     * @param pageSize
     * @return
     */
    @RequestMapping("/pageDepartment")
    public void getPageDepartment(Integer pageIndex, Integer pageSize, PrintWriter out) {
        PageUtil<Department> departmentPage = departmentService.getPageDepartment(pageIndex, pageSize);
        String departmentPageJson = JSON.toJSONString(departmentPage);
        out.write(departmentPageJson);
    }
}
