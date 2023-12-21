package com.koreaIT.demo.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.koreaIT.demo.dao.MemberDao;
import com.koreaIT.demo.dao.TeamsDao;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.ResultData;
import com.koreaIT.demo.vo.Team;
import com.koreaIT.demo.vo.TeamMembershipRequest;
import com.koreaIT.demo.vo.Teams;

@Service
public class TeamsService {

    private final TeamsDao teamsDao;

    public TeamsService(TeamsDao teamsDao) {
        this.teamsDao = teamsDao;
    }

    public Member getMemberById(int id) {
        return teamsDao.getMemberById(id);
    }

    public void doRegisterTeam(int captainId, String teamName, String cellphoneNum, String age, String stadium, String region) {
        teamsDao.doRegisterTeam(captainId, teamName, cellphoneNum, age, stadium, region);
    }

	public Teams getTeamsByLoginedMember(int loginedMemberId) {
		return teamsDao.getTeamsByLoginedMember(loginedMemberId);
	}

	public void doDeleteTeam(int loginedMemberId) {
	    teamsDao.doDeleteTeam(loginedMemberId);
	}
	
	public void doUpdateTeam(int teamId, String teamName, String cellphoneNum, String age, String stadium, String region) {
	    teamsDao.doUpdateTeam(teamId, teamName, cellphoneNum, age, stadium, region);
	}
	
	public List<Teams> getAllTeams() {
	    return teamsDao.getAllTeams();
	}
	
	public Teams getTeamById(int teamId) {
	    return teamsDao.getTeamById(teamId);
	}
	
	public void requestToJoinTeam(int memberId, int teamId) {
	    teamsDao.requestToJoinTeam(teamId, memberId);
	}

	public List<TeamMembershipRequest> getPendingMembershipRequests(int loginedMemberId) {
	    Teams userTeam = teamsDao.getTeamsByLoginedMember(loginedMemberId);
	    if (userTeam == null) {
	        return Collections.emptyList();
	    }
	    return teamsDao.getPendingMembershipRequests(userTeam.getId());
	}

	public void updateMembershipRequestStatus(int requestId, String status) {
	    teamsDao.updateMembershipRequestStatus(requestId, status);
	}
	
	public List<Member> getTeamMembersByNickname(int loginedMemberId) {
	    Teams userTeam = teamsDao.getTeamsByLoginedMember(loginedMemberId);
	    if (userTeam == null) {
	        return Collections.emptyList();
	    }
	    return teamsDao.getTeamMembersByTeamId(userTeam.getId());
	}
}

