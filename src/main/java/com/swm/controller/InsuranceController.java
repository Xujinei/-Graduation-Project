package com.swm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
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
import java.util.List;

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
        String PageJson = JSON.toJSONString(insurancestandardPage, SerializerFeature.DisableCircularReferenceDetect);
        out.write(PageJson);
    }

    @RequestMapping("/getAll")
    public void getAllInsurance(PrintWriter out) {
        List<Insurancestandard> insurancestandardList = insuranceService.getAllInsu();
        String insJson = JSON.toJSONString(insurancestandardList, SerializerFeature.DisableCircularReferenceDetect);
        out.write(insJson);
    }

    /**
     * 添加
     *
     * @param out
     * @param request
     */
    @RequestMapping("/addIns")
    public void addInsurance(PrintWriter out, HttpServletRequest request) {

        Insurancestandard insurancestandard = initIns(request);
        if (insurancestandard == null) {
            out.write("添加失败");
            return;
        }
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


    /**
     * 修改职位信息
     *
     * @param out
     * @param request
     */
    @RequestMapping("/updateIns")
    public void updateIns(PrintWriter out, HttpServletRequest request) {
        String sid = request.getParameter("id");
        if (sid == null && sid == "") {
            out.write("修改失败");
            return;
        }

        Insurancestandard insurancestandard = initIns(request);
        insurancestandard.setId(Integer.valueOf(sid));
        if (insurancestandard == null) {
            out.write("修改失败");
            return;
        }
        insuranceService.updateInsurance(insurancestandard);
        out.write("修改成功");
    }


    /**
     * 从前后获取值初始化对象
     *
     * @param request
     * @return
     */
    public Insurancestandard initIns(HttpServletRequest request) {
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
        return insurancestandard;
    }


}
