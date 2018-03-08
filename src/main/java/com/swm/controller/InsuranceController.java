package com.swm.controller;

import com.alibaba.fastjson.JSON;
import com.swm.entity.Insurancestandard;
import com.swm.entity.Position;
import com.swm.service.InsuranceService;
import com.swm.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;

@Controller
@RequestMapping("/insurance")
public class InsuranceController {

    @Autowired
    private InsuranceService insuranceService;

    /**
     * 分页获取数据
     *
     * @param pageIndex
     * @param pageSize
     * @param out
     */
    @RequestMapping("/pageInsurance")
    public void getPageInsurance(Integer pageIndex, Integer pageSize, PrintWriter out) {
        PageUtil<Insurancestandard> insurancestandardPage = insuranceService.getPageInsurance(pageIndex, pageSize);
        String PageJson = JSON.toJSONString(insurancestandardPage);
        out.write(PageJson);
    }

    /**
     * 添加
     *
     * @param out
     * @param request
     */
    @RequestMapping("/addIns")
    public void addInsurance(PrintWriter out, HttpServletRequest request) {

        Insurancestandard insurancestandard = new Insurancestandard();
        String name = request.getParameter("name");
        String pension = request.getParameter("pension");
        String medical = request.getParameter("medical");
        String unemployment = request.getParameter("unemployment");
        String injury = request.getParameter("injury");
        String maternity = request.getParameter("maternity");
        String housing = request.getParameter("housing");

        insurancestandard.setName(name);
        insurancestandard.setPension(Integer.valueOf(pension));
        insurancestandard.setMaternity(Integer.valueOf(maternity));
        insurancestandard.setMedical(Integer.valueOf(medical));
        insurancestandard.setUnemployment(Integer.valueOf(unemployment));
        insurancestandard.setInjury(Integer.valueOf(injury));
        insurancestandard.setHousing(Integer.valueOf(housing));
        int re = insuranceService.addInsurance(insurancestandard);
        if (re > 0) {
            out.write("添加成功");
        } else {
            out.write("添加失败");
        }
    }

    /**
     * 删除
     *
     * @param out
     * @param request
     */
    @RequestMapping("/delet")
    public void deletIns(PrintWriter out, HttpServletRequest request) {
        Integer id = Integer.valueOf(request.getParameter("id"));
        int re = insuranceService.deletInsurance(id);
        if (re > 0) {
            out.write("删除成功");
        } else {
            out.write("删除失败");
        }


    }
}
