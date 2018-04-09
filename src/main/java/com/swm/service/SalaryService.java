package com.swm.service;

import com.swm.entity.EmpSalary;
import com.swm.entity.Salary;
import com.swm.util.PageUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.util.Date;
import java.util.List;

public interface SalaryService {

    void cleanByDate(Date date);

    List<Salary> accountMonthSalary(Date date);

    void add(Salary salary);

    PageUtil<EmpSalary> selectBySalary(Integer pageIndex, Integer pageSize, Salary salary, Integer upOrDown);

    List<EmpSalary> selectDepartmentSalary(Date date, Integer upOrDown);

    List<EmpSalary> selectPositionSalary(Date date, Integer upOrDown);

    List<EmpSalary> selectDepEmpSalaryList(Integer upOrDown, Salary salary);

    void updateEmpSalary(EmpSalary empSalary);

    HSSFWorkbook getHSSFWorkbook(String sheetName, String[] title, String[][] values, HSSFWorkbook wb);

}
