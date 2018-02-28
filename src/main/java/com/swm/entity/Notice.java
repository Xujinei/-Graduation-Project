package com.swm.entity;

import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class Notice {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column notice.id
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column notice.recipientId
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    private Integer recipientid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column notice.noticeTime
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    private Date noticetime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column notice.status
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    private Integer status;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column notice.content
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    private String content;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column notice.id
     *
     * @return the value of notice.id
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column notice.id
     *
     * @param id the value for notice.id
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column notice.recipientId
     *
     * @return the value of notice.recipientId
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public Integer getRecipientid() {
        return recipientid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column notice.recipientId
     *
     * @param recipientid the value for notice.recipientId
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public void setRecipientid(Integer recipientid) {
        this.recipientid = recipientid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column notice.noticeTime
     *
     * @return the value of notice.noticeTime
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public Date getNoticetime() {
        return noticetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column notice.noticeTime
     *
     * @param noticetime the value for notice.noticeTime
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public void setNoticetime(Date noticetime) {
        this.noticetime = noticetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column notice.status
     *
     * @return the value of notice.status
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column notice.status
     *
     * @param status the value for notice.status
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column notice.content
     *
     * @return the value of notice.content
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public String getContent() {
        return content;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column notice.content
     *
     * @param content the value for notice.content
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    public void setContent(String content) {
        this.content = content;
    }
}