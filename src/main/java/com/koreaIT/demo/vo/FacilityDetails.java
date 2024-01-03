package com.koreaIT.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FacilityDetails {
	private String areaName;
    private String placeName;
    private String payatName;
    private String telNo;
    private String rcptBgndt;
    private String rcptEnddt;
}
