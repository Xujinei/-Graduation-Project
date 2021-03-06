package com.swm.entity;

import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class Account {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column account.id
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column account.username
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    private String username;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column account.password
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    private String password;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column account.employeeId
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    private Employeeinfo employeeId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column account.lastLoginTime
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    private Date lastLoginTime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column account.status
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    private Integer status;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column account.promission
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    private Integer promission;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column account.id
     *
     * @return the value of account.id
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column account.id
     *
     * @param id the value for account.id
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column account.username
     *
     * @return the value of account.username
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public String getUsername() {
        return username;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column account.username
     *
     * @param username the value for account.username
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column account.password
     *
     * @return the value of account.password
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public String getPassword() {
        return password;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column account.password
     *
     * @param password the value for account.password
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column account.employeeId
     *
     * @return the value of account.employeeId
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public Employeeinfo getEmployeeId() {
        return employeeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column account.employeeId
     *
     * @param employeeId the value for account.employeeId
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public void setEmployeeId(Employeeinfo employeeId) {
        this.employeeId = employeeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column account.lastLoginTime
     *
     * @return the value of account.lastLoginTime
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column account.lastLoginTime
     *
     * @param lastLoginTime the value for account.lastLoginTime
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column account.status
     *
     * @return the value of account.status
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column account.status
     *
     * @param status the value for account.status
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column account.promission
     *
     * @return the value of account.promission
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public Integer getPromission() {
        return promission;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column account.promission
     *
     * @param promission the value for account.promission
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public void setPromission(Integer promission) {
        this.promission = promission;
    }
}