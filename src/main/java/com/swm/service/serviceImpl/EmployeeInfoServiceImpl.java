package com.swm.service.serviceImpl;

import com.swm.entity.Department;
import com.swm.entity.Employeeinfo;
import com.swm.mapper.EmployeeinfoMapper;
import com.swm.service.EmployeeInfoService;
import com.swm.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class EmployeeInfoServiceImpl implements EmployeeInfoService {

    @Autowired
    private EmployeeinfoMapper employeeinfoMapper;

    /**
     * 添加员工信息
     *
     * @param employeeinfo
     * @return
     */
    public int addEmployee(Employeeinfo employeeinfo) {
        return employeeinfoMapper.insert(employeeinfo);
    }

    public PageUtil<Employeeinfo> getPageEmployee(Integer pageIndex, Integer pageSize) {
        PageUtil<Employeeinfo> employeeinfoPage = new PageUtil<Employeeinfo>();

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Integer skipSize = (pageIndex - 1) * pageSize;
        Integer pageNumber = employeeinfoMapper.countAll();
        Integer pageCount = (int) Math.ceil(pageNumber / (pageSize * 1.0));
        if (pageCount == 0) {
            pageCount = 1;
        }

        List<Employeeinfo> employeeinfoList = employeeinfoMapper.selectByPage(skipSize, pageSize);
        // 日期格式
        for (Employeeinfo dep : employeeinfoList) {

        }
        employeeinfoPage.setList(employeeinfoList);
        employeeinfoPage.setPageCount(pageCount);
        employeeinfoPage.setPageNumber(pageNumber);
        employeeinfoPage.setPageIndex(pageIndex);
        return employeeinfoPage;
    }

    public Employeeinfo getEmployeeDetail(Integer id) {
        return employeeinfoMapper.selectByPrimaryKey(id);
    }

    public int updateInfo(Employeeinfo employeeinfo) {
        return employeeinfoMapper.updateByPrimaryKey(employeeinfo);
    }

    public int deleteInfo(Integer id) {
        return employeeinfoMapper.deleteByPrimaryKey(id);
    }
}
