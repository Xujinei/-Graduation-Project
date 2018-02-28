package com.swm.service.serviceImpl;

import com.swm.entity.Department;
import com.swm.mapper.DepartmentMapper;
import com.swm.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
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
}
