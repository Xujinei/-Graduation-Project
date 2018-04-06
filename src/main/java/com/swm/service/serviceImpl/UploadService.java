package com.swm.service.serviceImpl;


import com.swm.entity.Employeesubsidy;
import com.swm.entity.Salary;
import com.swm.entity.Workinghours;
import com.swm.service.SalaryService;
import com.swm.service.WorkHoursService;
import com.swm.util.ReadExcel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;

@Service
public class UploadService {

    @Autowired
    private WorkHoursService workHoursService;
    @Autowired
    private SalaryService salaryService;

    //批量导入工时 并结算
    @Transactional
    public boolean batchImport(String name, MultipartFile file) {
        boolean b = false;
        //创建处理EXCEL
        ReadExcel readExcel = new ReadExcel();
        //解析excel，获取工时信息集合。
        List<Workinghours> workinghoursList = readExcel.getExcelInfo(name, file);

        if (workinghoursList != null) {
            b = true;
        }
        //迭代添加工时信息:需判断是否已存在，如果存在则删除
        for (Workinghours workinghours : workinghoursList) {
            List<Workinghours> temp = workHoursService.getByWorkinghours(workinghours);
            for (int i = 0; i < temp.size(); i++) {
                workHoursService.deleteById(temp.get(i).getId());
            }
            workHoursService.addWorkHours(workinghours);
        }
        // 结算当月工资
        if (workinghoursList.size() <= 0) {
            return b;
        }
        Date workDate = workinghoursList.get(0).getWorkdata();
        // 清除历史数据
        salaryService.cleanByDate(workDate);
        // 获得当月工资信息
        List<Salary> salaryList = salaryService.accountMonthSalary(workDate);
        //将当月的工资存入salary表
        for (Salary salary : salaryList) {
            salaryService.add(salary);
        }
        return b;
    }


}
