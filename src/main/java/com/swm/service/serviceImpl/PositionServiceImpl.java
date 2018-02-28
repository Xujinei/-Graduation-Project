package com.swm.service.serviceImpl;

import com.swm.entity.Position;
import com.swm.mapper.PositionMapper;
import com.swm.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PositionServiceImpl implements PositionService {

    @Autowired
    private PositionMapper positionMapper;

    public List<Position> getAllPosition() {
        return positionMapper.selectAll();
    }
}
