package com.swm.entity;

import java.util.Date;

public class Workinghours {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column workinghours.id
     *
     * @mbg.generated Mon Dec 04 16:14:32 CST 2017
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column workinghours.workData
     *
     * @mbg.generated Mon Dec 04 16:14:32 CST 2017
     */
    private Date workdata;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column workinghours.workHours
     *
     * @mbg.generated Mon Dec 04 16:14:32 CST 2017
     */
    private Integer workhours;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column workinghours.overTime
     *
     * @mbg.generated Mon Dec 04 16:14:32 CST 2017
     */
    private Integer overtime;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column workinghours.id
     *
     * @return the value of workinghours.id
     *
     * @mbg.generated Mon Dec 04 16:14:32 CST 2017
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column workinghours.id
     *
     * @param id the value for workinghours.id
     *
     * @mbg.generated Mon Dec 04 16:14:32 CST 2017
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column workinghours.workData
     *
     * @return the value of workinghours.workData
     *
     * @mbg.generated Mon Dec 04 16:14:32 CST 2017
     */
    public Date getWorkdata() {
        return workdata;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column workinghours.workData
     *
     * @param workdata the value for workinghours.workData
     *
     * @mbg.generated Mon Dec 04 16:14:32 CST 2017
     */
    public void setWorkdata(Date workdata) {
        this.workdata = workdata;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column workinghours.workHours
     *
     * @return the value of workinghours.workHours
     *
     * @mbg.generated Mon Dec 04 16:14:32 CST 2017
     */
    public Integer getWorkhours() {
        return workhours;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column workinghours.workHours
     *
     * @param workhours the value for workinghours.workHours
     *
     * @mbg.generated Mon Dec 04 16:14:32 CST 2017
     */
    public void setWorkhours(Integer workhours) {
        this.workhours = workhours;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column workinghours.overTime
     *
     * @return the value of workinghours.overTime
     *
     * @mbg.generated Mon Dec 04 16:14:32 CST 2017
     */
    public Integer getOvertime() {
        return overtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column workinghours.overTime
     *
     * @param overtime the value for workinghours.overTime
     *
     * @mbg.generated Mon Dec 04 16:14:32 CST 2017
     */
    public void setOvertime(Integer overtime) {
        this.overtime = overtime;
    }
}