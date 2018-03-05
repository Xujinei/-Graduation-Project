package com.swm.service.serviceImpl;

import com.swm.entity.Position;
import com.swm.mapper.PositionMapper;
import com.swm.service.PositionService;
import com.swm.util.PageUtil;
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

    public PageUtil<Position> getPagePosition(Integer pageIndex, Integer pageSize) {
        PageUtil<Position> positionPage = new PageUtil<Position>();
        Integer skipSize = (pageIndex - 1) * pageSize;
        Integer pageNumber = positionMapper.countAllPosition();
        Integer pageCount = (int) Math.ceil(pageNumber / (pageSize * 1.0));
        if (pageCount == 0) {
            pageCount = 1;
        }

        List<Position> positionList = positionMapper.selectByPage(skipSize, pageSize);

        positionPage.setList(positionList);
        positionPage.setPageCount(pageCount);
        positionPage.setPageNumber(pageNumber);
        positionPage.setPageIndex(pageIndex);
        return positionPage;
    }

    public int addPosition(Position position) {
        List<Position> positions = positionMapper.selectByName(position.getName());
        if (positions.size() > 0) {
            return -2;
        }
        return positionMapper.insert(position);
    }

    public int updatePostion(Position position) {
        return positionMapper.updateByPrimaryKey(position);
    }

    public int deletePosition(Integer id) {
        return positionMapper.deleteByPrimaryKey(id);
    }

}
