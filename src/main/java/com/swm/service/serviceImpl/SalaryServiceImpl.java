package com.swm.service.serviceImpl;

import com.swm.entity.EmpSalary;
import com.swm.entity.Employeeinfo;
import com.swm.entity.EmployeeinfoEntity;
import com.swm.entity.Salary;
import com.swm.mapper.SalaryMapper;
import com.swm.service.EmployeeInfoService;
import com.swm.service.SalaryService;
import com.swm.util.PageUtil;
import org.apache.poi.hssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class SalaryServiceImpl implements SalaryService {

    @Autowired
    private SalaryMapper salaryMapper;
    @Autowired
    private EmployeeInfoService employeeInfoService;

    public void cleanByDate(Date date) {
        salaryMapper.deleteByPrimaryKey(date);
    }

    public List<Salary> accountMonthSalary(Date date) {
        List<Salary> salaryList = salaryMapper.accountMonthSalary(date);
        /*调整税收和总工资*/
        for (Salary salary : salaryList) {
            double tax = salary.getTax();
            if (tax < 1500 && tax > 0) {
                tax = tax * 0.03;
            } else if (tax >= 1500 && tax < 4500) {
                tax = tax * 0.1 - 105;
            } else if (tax >= 4500 && tax < 9000) {
                tax = tax * 0.2 - 555;
            } else if (tax >= 9000 && tax < 35000) {
                tax = tax * 0.25 - 1005;
            } else if (tax >= 35000 && tax < 55000) {
                tax = tax * 0.3 - 2755;
            } else if (tax >= 55000 && tax < 80000) {
                tax = tax * 0.35 - 5505;
            } else if (tax >= 80000) {
                tax = tax * 0.45 - 13505;
            }
            salary.setTax(tax);
            salary.setTotal(salary.getTotal() - tax);
        }

        return salaryList;
    }

    public void add(Salary salary) {
        salaryMapper.insert(salary);
    }

    /**
     * 按条件分页查询
     *
     * @param pageIndex
     * @param pageSize
     * @param salary
     * @return
     */
    public PageUtil<EmpSalary> selectBySalary(Integer pageIndex, Integer pageSize, Salary salary, Integer upOrDown) {
        PageUtil<EmpSalary> pageSalary = new PageUtil<EmpSalary>();

        Integer skipSize = (pageIndex - 1) * pageSize;
        Integer pageNumber = salaryMapper.countAllByKey(salary);
        Integer pageCount = (int) Math.ceil(pageNumber / (pageSize * 1.0));
        if (pageCount == 0) {
            pageCount = 1;
        }
        List<EmpSalary> salaryList = salaryMapper.selectBySalary(skipSize, pageSize, salary, upOrDown);


        /*完善部门职务信息*/
        for (EmpSalary empSalary : salaryList) {
            if (empSalary != null) {
                Integer empId = empSalary.getEmployeeId();
                EmployeeinfoEntity emp = employeeInfoService.getEmployeeEntityById(empId);
                empSalary.setEmployeeEntity(emp);
                empSalary.setPosition(emp.getPosition());
                empSalary.setDepartment(emp.getDepartment());
            }
        }
        pageSalary.setList(salaryList);
        pageSalary.setPageCount(pageCount);
        pageSalary.setPageNumber(pageNumber);
        pageSalary.setPageIndex(pageIndex);
        return pageSalary;
    }

    public List<EmpSalary> selectDepartmentSalary(Date date, Integer upOrDown) {
        return salaryMapper.selectDepartmentSalary(date, upOrDown);
    }

    public List<EmpSalary> selectPositionSalary(Date date, Integer upOrDown) {
        return salaryMapper.selectPositionSalary(date, upOrDown);
    }

    public List<EmpSalary> selectDepEmpSalaryList(Integer upOrDown, Salary salary) {
        return salaryMapper.selectBySalary(null, null, salary, upOrDown);
    }


    /**
     * 导出报表
     *
     * @param sheetName
     * @param title
     * @param values
     * @param wb
     * @return
     */
    public HSSFWorkbook getHSSFWorkbook(String sheetName, String[] title, String[][] values, HSSFWorkbook wb) {

        // 第一步，创建一个HSSFWorkbook，对应一个Excel文件
        if (wb == null) {
            wb = new HSSFWorkbook();
        }

        // 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet(sheetName);

        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制
        HSSFRow row = sheet.createRow(0);

        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式

        //声明列对象
        HSSFCell cell = null;

        //创建标题
        for (int i = 0; i < title.length; i++) {
            cell = row.createCell(i);
            cell.setCellValue(title[i]);
            cell.setCellStyle(style);
        }

        //创建内容
        for (int i = 0; i < values.length; i++) {
            row = sheet.createRow(i + 1);
            for (int j = 0; j < values[i].length; j++) {
                //将内容按顺序赋给对应的列对象
                row.createCell(j).setCellValue(values[i][j]);
            }
        }
        return wb;
    }
}

