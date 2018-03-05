package com.swm.service;

import com.swm.entity.Position;
import com.swm.util.PageUtil;

import java.util.List;

public interface PositionService {
    List<Position> getAllPosition();

    PageUtil<Position> getPagePosition(Integer pageIndex, Integer pageSize);

    int addPosition(Position position);

    int updatePostion(Position position);

    int deletePosition(Integer id);

}
