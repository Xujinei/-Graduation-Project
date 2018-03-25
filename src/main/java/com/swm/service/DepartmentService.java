package com.swm.service;

import com.swm.entity.Department;
import com.swm.util.PageUtil;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepartmentService {
    List<Department> getAllDepartment();

    int addDepartment(Department department);

    PageUtil<Department> getPageDepartment(Integer pageIndex, Integer pageSize);

    int updateDepart(Department department);

    int deletDepart(Integer id);

}
