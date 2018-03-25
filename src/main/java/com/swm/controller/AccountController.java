package com.swm.controller;

import com.alibaba.fastjson.JSON;
import com.swm.entity.Account;
import com.swm.entity.Employeeinfo;
import com.swm.entity.EmployeeinfoEntity;
import com.swm.service.AccountService;
import com.swm.service.EmployeeInfoService;
import com.swm.util.MD5;
import com.swm.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private AccountService accountService;
    @Autowired
    private EmployeeInfoService employeeInfoService;

    /**
     * 获取分页账号
     *
     * @param pageIndex
     * @param pageSize
     * @param out
     * @param accountName
     * @param promission
     * @param department
     * @param status
     */
    @RequestMapping("/getPage")
    public void getPageAccount(Integer pageIndex, Integer pageSize, PrintWriter out,
                               String accountName, String promission, String department, String status) {

        PageUtil<Account> accountPage = new PageUtil<Account>();
        Account account = new Account();
        List<Employeeinfo> employeeinfos = null;
        if (accountName != null && !"".equals(accountName)) {
            account.setUsername(accountName);
        }
        if (promission != null && !"".equals(promission)) {
            account.setPromission(Integer.valueOf(promission));
        }
        if (department != null && !"".equals(department)) {
            Employeeinfo tempEmp = new Employeeinfo();
            tempEmp.setDepartmentid(Integer.valueOf(department));
            employeeinfos = employeeInfoService.getEmployeeBySearch(tempEmp);
        }
        if (status != null && !"".equals(status)) {
            account.setStatus(Integer.valueOf(status));
        }
        accountPage = accountService.getPageAccount(pageIndex, pageSize, account, employeeinfos);
        String accountJSON = JSON.toJSONString(accountPage);
        out.write(accountJSON);
    }

    /**
     * 修改账号信息，只允许修改权限和状态
     */
    @RequestMapping("/update")
    public void updateAccount(HttpServletRequest request, PrintWriter out) {
        Account account = new Account();
        Account oldAccount = new Account();
        String sId = request.getParameter("id");
        if (sId != null && !"".equals(sId)) {
            account.setId(Integer.valueOf(sId));
            oldAccount = accountService.getById(Integer.valueOf(sId));
            account.setPassword(oldAccount.getPassword());
            account.setLastLoginTime(oldAccount.getLastLoginTime());
            account.setUsername(oldAccount.getUsername());
            account.setEmployeeId(oldAccount.getEmployeeId());
            account.setStatus(Integer.valueOf(request.getParameter("status")));
            account.setPromission(Integer.valueOf(request.getParameter("promission")));
            accountService.updateAccount(account);
            out.write("修改成功");
        } else {
            out.write("修改失败");
        }
    }

    /**
     * 初始化密码
     *
     * @param id
     * @param out
     */
    @RequestMapping("/initPassword")
    public void initPassword(Integer id, PrintWriter out) {
        Account oldAccount = null;
        if (id != null) {
            oldAccount = accountService.getById(id);
            oldAccount.setPassword(MD5.toMD5("aaa888"));
            accountService.updateAccount(oldAccount);
            out.write("初始化成功");
        } else {
            out.write("初始化失败");
        }
    }

    /**
     * 删除账号
     *
     * @param id
     * @param out
     */
    @RequestMapping("/delete")
    public void deleteAccount(Integer id, PrintWriter out) {
        if (id != null) {
            accountService.delete(id);
            out.write("删除成功");
        } else {
            out.write("删除失败");
        }
    }

    /**
     * 查找没有账号的员工
     *
     * @param out
     */
    @RequestMapping("/selectNoAccountEmp")
    public void selectEmpNoAccount(PrintWriter out) {
        List<Employeeinfo> employeeinfos = accountService.selectNoAccount();
        String empJson = JSON.toJSONString(employeeinfos);
        out.write(empJson);
    }

    /**
     * 添加账号，并关联员工
     *
     * @param out
     * @param accountName
     * @param promission
     * @param status
     */
    @RequestMapping("/add")
    public void addAccount(PrintWriter out, String accountName, Integer promission, Integer status, Integer empId) {
        Account account = new Account();
        String pw = MD5.toMD5("aaa88");
        account.setPassword(pw);
        account.setEmployeeId(employeeInfoService.getEmployeeDetail(empId));
        account.setUsername(accountName);
        account.setPromission(promission);
        account.setLastLoginTime(null);
        account.setStatus(status);
        int re = accountService.add(account);
        if (re > 0) {
            out.write("添加成功");
        } else {
            out.write("添加失败");
        }

    }
}
