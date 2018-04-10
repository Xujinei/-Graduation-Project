package com.swm.service.serviceImpl;

import com.swm.entity.Department;
import com.swm.entity.Notice;
import com.swm.mapper.NoticeMapper;
import com.swm.service.NoticeService;
import com.swm.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    private NoticeMapper noticeMapper;

    public void addNotice(Notice notice) {
        noticeMapper.insert(notice);
    }

    public int deleteNotice(Integer id) {
        return 0;
    }

    public int hasNotice(Notice notice) {
        return noticeMapper.selectByKey(null, null, notice).size();
    }

    public PageUtil<Notice> selectByNotice(Integer pageIndex, Integer pageSize, Notice notice) {
        PageUtil<Notice> noticePage = new PageUtil<Notice>();


        Integer skipSize = pageIndex;
        Integer pageNumber = noticeMapper.countAll();
        Integer pageCount = (int) Math.ceil(pageNumber / (pageSize * 1.0));
        if (pageCount == 0) {
            pageCount = 1;
        }

        List<Notice> notices = noticeMapper.selectByKey(skipSize, pageSize, notice);

        noticePage.setList(notices);
        noticePage.setPageCount(pageCount);
        noticePage.setPageNumber(pageNumber);
        noticePage.setPageIndex(pageIndex);
        return noticePage;
    }

}
