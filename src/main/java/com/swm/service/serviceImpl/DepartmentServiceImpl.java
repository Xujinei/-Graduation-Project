package com.swm.service.serviceImpl;

import com.swm.entity.Department;
import com.swm.mapper.DepartmentMapper;
import com.swm.service.DepartmentService;
import com.swm.util.PageUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
@Transactional
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getAllDepartment() {
        return departmentMapper.selectAll();

    }

    public int addDepartment(Department department) {
        List<Department> list = departmentMapper.selectByName(department.getName());
        if (list.size() >= 1) {
            return -2; // 已存在相同名称的部门
        }
        return departmentMapper.insert(department);
    }

    /**
     * 分页获取部门
     *
     * @param pageIndex
     * @param pageSize
     * @return
     */
    public PageUtil<Department> getPageDepartment(Integer pageIndex, Integer pageSize) {
        PageUtil<Department> departmentPage = new PageUtil<Department>();

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Integer skipSize = (pageIndex - 1) * pageSize;
        Integer pageNumber = departmentMapper.countAllDepartment();
        Integer pageCount = (int) Math.ceil(pageNumber / (pageSize * 1.0));
        if (pageCount == 0) {
            pageCount = 1;
        }

        List<Department> departmentList = departmentMapper.selectByPage(skipSize, pageSize);
        // 日期格式
        for (Department dep : departmentList) {

        }
        departmentPage.setList(departmentList);
        departmentPage.setPageCount(pageCount);
        departmentPage.setPageNumber(pageNumber);
        departmentPage.setPageIndex(pageIndex);
        return departmentPage;
    }

    public int updateDepart(Department department) {
        return departmentMapper.updateByPrimaryKey(department);
    }

    public int deletDepart(Integer id) {
        return departmentMapper.deleteByPrimaryKey(id);
    }
}
