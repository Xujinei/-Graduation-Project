package com.swm.service;

import com.swm.entity.Notice;
import com.swm.util.PageUtil;

import java.util.List;

public interface NoticeService {

    void addNotice(Notice notice);

    int deleteNotice(Integer id);

    PageUtil<Notice> selectByNotice(Integer pageIndex, Integer pageSize, Notice notice);
}
