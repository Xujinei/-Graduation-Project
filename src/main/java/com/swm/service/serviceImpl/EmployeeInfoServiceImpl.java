package com.swm.service.serviceImpl;

import com.swm.entity.Department;
import com.swm.entity.Employeeinfo;
import com.swm.entity.EmployeeinfoEntity;
import com.swm.mapper.EmployeeinfoMapper;
import com.swm.service.EmployeeInfoService;
import com.swm.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.List;

@Service
@Transactional
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

    /**
     * 分页查询所有
     *
     * @param pageIndex
     * @param pageSize
     * @return
     */
    public PageUtil<EmployeeinfoEntity> getPageEmployee(Integer pageIndex, Integer pageSize) {
        PageUtil<EmployeeinfoEntity> employeeinfoPage = new PageUtil<EmployeeinfoEntity>();

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Integer skipSize = pageIndex;
        Integer pageNumber = employeeinfoMapper.countAll();
        Integer pageCount = (int) Math.ceil(pageNumber / (pageSize * 1.0));
        if (pageCount == 0) {
            pageCount = 1;
        }

        List<EmployeeinfoEntity> employeeinfoList = employeeinfoMapper.selectEntityByPage(skipSize, pageSize);

        employeeinfoPage.setList(employeeinfoList);
        employeeinfoPage.setPageCount(pageCount);
        employeeinfoPage.setPageNumber(pageNumber);
        employeeinfoPage.setPageIndex(pageIndex);
        return employeeinfoPage;
    }

    /**
     * 根据条件分页查询
     *
     * @param pageIndex
     * @param pageSize
     * @param employeeinfo
     * @return
     */
    public PageUtil<EmployeeinfoEntity> getPageEmployeeByKey(Integer pageIndex, Integer pageSize, Employeeinfo employeeinfo) {
        PageUtil<EmployeeinfoEntity> employeeinfoPage = new PageUtil<EmployeeinfoEntity>();

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Integer skipSize = pageIndex;
        Integer pageNumber = employeeinfoMapper.countAllByKey(employeeinfo);
        Integer pageCount = (int) Math.ceil(pageNumber / (pageSize * 1.0));
        if (pageCount == 0) {
            pageCount = 1;
        }

        List<EmployeeinfoEntity> employeeinfoList = employeeinfoMapper.selectEntityByPageAndOther(skipSize, pageSize,employeeinfo);
        employeeinfoPage.setList(employeeinfoList);
        employeeinfoPage.setPageCount(pageCount);
        employeeinfoPage.setPageNumber(pageNumber);
        employeeinfoPage.setPageIndex(pageIndex);
        return employeeinfoPage;
    }

    public Employeeinfo getEmployeeDetail(Integer id) {
        return employeeinfoMapper.selectByPrimaryKey(id);
    }

    public EmployeeinfoEntity getEmployeeEntityById(Integer id) {
        return employeeinfoMapper.getEmployeeEntityById(id);
    }

    public int updateInfo(Employeeinfo employeeinfo) {
        return employeeinfoMapper.updateByPrimaryKey(employeeinfo);
    }

    public int deleteInfo(Integer id) {
        return employeeinfoMapper.deleteByPrimaryKey(id);
    }

    public List<Employeeinfo> getEmployeeBySearch(Employeeinfo employeeinfo) {
        return employeeinfoMapper.selectBySearch(employeeinfo);
    }
}
