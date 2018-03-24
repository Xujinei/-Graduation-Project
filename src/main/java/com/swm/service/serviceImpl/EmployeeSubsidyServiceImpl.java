package com.swm.service.serviceImpl;

import com.swm.entity.Employeesubsidy;
import com.swm.mapper.EmployeesubsidyMapper;
import com.swm.service.EmployeeSubsidyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class EmployeeSubsidyServiceImpl implements EmployeeSubsidyService {

    @Autowired
    private EmployeesubsidyMapper employeesubsidyMapper;

    public int add(Employeesubsidy employeesubsidy) {
        return employeesubsidyMapper.insert(employeesubsidy);
    }

    public List<Employeesubsidy> getAll() {
        return employeesubsidyMapper.selectAll();
    }

    public List<Employeesubsidy> getSubsidyByKey(Employeesubsidy employeesubsidy) {
        return null;
    }
}
