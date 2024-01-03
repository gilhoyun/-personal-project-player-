package com.koreaIT.demo.service;

import org.springframework.stereotype.Service;

import com.koreaIT.demo.dao.FutsalReservationDao;

@Service
public class FutsalReservationService {

    private final FutsalReservationDao futsalReservationDao;

    public FutsalReservationService(FutsalReservationDao futsalReservationDao) {
        this.futsalReservationDao = futsalReservationDao;
    }

    public boolean reserveFutsal(int futsalGroundId, String reservationTime) {
        
        return true;
    }
}