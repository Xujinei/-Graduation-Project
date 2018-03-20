package com.swm.service.serviceImpl;

import com.swm.entity.Workinghours;
import com.swm.mapper.WorkinghoursMapper;
import com.swm.service.WorkHoursService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkHoursServiceImpl implements WorkHoursService {

    @Autowired
    private WorkinghoursMapper workinghoursMapper;

    public int addWorkHours(Workinghours workinghours) {
        return workinghoursMapper.insert(workinghours);
    }

    public List<Workinghours> getAllWorkHours() {
        return workinghoursMapper.selectAll();
    }

    public List<Workinghours> getWorkHoursById(Integer id) {
        return workinghoursMapper.selectByPrimaryKey(id);
    }
}
