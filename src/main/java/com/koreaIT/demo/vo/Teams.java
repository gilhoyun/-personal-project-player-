package com.koreaIT.demo.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Teams {
	private int id; 
	private int captain_id;
	private String regDate ;
	private String updateDate ;
	private String teamName ;
	private String age ;
	private String stadium;
	private String region;
	private String cellphoneNum ;
	private List<TeamMembershipRequest> membershipRequests;
}
