package com.koreaIT.demo.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface FutsalReservationDao {

	 @Select("SELECT * FROM futsal_ground WHERE location LIKE '%서울%'")
    void reserveFutsal(@Param("futsalGroundId") int futsalGroundId, @Param("reservationTime") String reservationTime);
}