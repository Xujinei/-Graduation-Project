package com.swm.mapper;

import com.swm.entity.Position;
import java.util.List;

public interface PositionMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table position
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table position
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    int insert(Position record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table position
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    Position selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table position
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    List<Position> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table position
     *
     * @mbg.generated Thu Jan 18 20:59:16 CST 2018
     */
    int updateByPrimaryKey(Position record);
}