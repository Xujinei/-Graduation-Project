package com.swm.service.serviceImpl;


import com.swm.entity.Workinghours;
import com.swm.service.WorkHoursService;
import com.swm.util.ReadExcel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public class UploadService {

    @Autowired
    private WorkHoursService workHoursService;

    //批量导入工时
    public boolean batchImport(String name, MultipartFile file) {
        boolean b = false;
        //创建处理EXCEL
        ReadExcel readExcel = new ReadExcel();
        //解析excel，获取客户信息集合。
        List<Workinghours> workinghoursList = readExcel.getExcelInfo(name, file);

        if (workinghoursList != null) {
            b = true;
        }
        //迭代添加工时信息（注：实际上这里也可以直接将customerList集合作为参数，在Mybatis的相应映射文件中使用foreach标签进行批量添加。）
        for (Workinghours workinghours : workinghoursList) {
            workHoursService.addWorkHours(workinghours);
        }
        return b;
    }
}
