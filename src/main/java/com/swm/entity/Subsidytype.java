package com.swm.entity;

import java.util.Date;

public class Subsidytype {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column subsidytype.id
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column subsidytype.name
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    private String name;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column subsidytype.remark
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    private String remark;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column subsidytype.addTime
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    private Date addtime;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column subsidytype.id
     *
     * @return the value of subsidytype.id
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column subsidytype.id
     *
     * @param id the value for subsidytype.id
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column subsidytype.name
     *
     * @return the value of subsidytype.name
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column subsidytype.name
     *
     * @param name the value for subsidytype.name
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column subsidytype.remark
     *
     * @return the value of subsidytype.remark
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public String getRemark() {
        return remark;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column subsidytype.remark
     *
     * @param remark the value for subsidytype.remark
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column subsidytype.addTime
     *
     * @return the value of subsidytype.addTime
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public Date getAddtime() {
        return addtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column subsidytype.addTime
     *
     * @param addtime the value for subsidytype.addTime
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}