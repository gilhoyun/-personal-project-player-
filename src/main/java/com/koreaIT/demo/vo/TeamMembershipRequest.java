package com.koreaIT.demo.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TeamMembershipRequest {
	private int id;
    private int teamId;
    private int memberId;
    private String status;
    private LocalDateTime regDate;
    private LocalDateTime updateDate;
    private Member member;
    private String nickname;
    private String acceptedMemberNickname; 
}
