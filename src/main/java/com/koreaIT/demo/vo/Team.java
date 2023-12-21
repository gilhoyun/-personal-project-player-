package com.koreaIT.demo.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Team {
	private int id;
    private int captainId;
    private LocalDateTime regDate;
    private LocalDateTime updateDate;
    private String teamName;
    private String cellphoneNum;
    private String age ;
	private String stadium;
	private String region;
}
