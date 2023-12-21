package com.koreaIT.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.Team;
import com.koreaIT.demo.vo.TeamMembershipRequest;
import com.koreaIT.demo.vo.Teams;

@Mapper
public interface TeamsDao {


	@Insert("INSERT INTO team (member_id, team_name) VALUES (#{memberId}, #{teamName})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void registerTeam(@Param("memberId") int memberId, @Param("teamName") String teamName);
	
	@Insert("""
	        INSERT INTO teams 
	        (captain_id, regDate, updateDate, teamName, cellphoneNum, age, stadium, region)
	        VALUES 
	        (#{captainId}, NOW(), NOW(), #{teamName}, #{cellphoneNum}, #{age}, #{stadium}, #{region})
	        """)
	public void doRegisterTeam(@Param("captainId") int captainId, @Param("teamName") String teamName, @Param("cellphoneNum") String cellphoneNum, @Param("age") String age, @Param("stadium") String stadium, @Param("region") String region);
	
	@Select("""
			SELECT * 
				FROM `member`
				WHERE id = #{id}
			""")
	public Member getMemberById(int id);

	@Select("SELECT LAST_INSERT_ID()")
	public int getLastInsertId();

	@Select("""
			SELECT *
				FROM `member`
				WHERE loginId = #{loginId}
			""")
	public Member getMemberByLoginId(String loginId);

	
	@Select("""
	        SELECT * FROM teams
	        WHERE captain_id = #{loginedMemberId}
	        LIMIT 1
	        """)
	Teams getTeamsByLoginedMember(int loginedMemberId);
	
	@Delete("""
	        DELETE FROM teams 
	        WHERE captain_id = #{loginedMemberId}
	        """)
	void doDeleteTeam(int loginedMemberId);
	
	@Update("""
	        UPDATE teams 
	        SET teamName = #{teamName}, cellphoneNum = #{cellphoneNum}, age = #{age}, updateDate = NOW(), stadium = #{stadium}, region = #{region}
	        WHERE captain_id = #{teamId}
	        """)
	void doUpdateTeam(@Param("teamId") int teamId, @Param("teamName") String teamName,
	                   @Param("cellphoneNum") String cellphoneNum, @Param("age") String age, @Param("stadium") String stadium, @Param("region") String region);
	
	@Select("SELECT * FROM teams ORDER BY id DESC")
	List<Teams> getAllTeams();
	
	@Select("SELECT * FROM teams WHERE captain_id = #{teamId}")
	Teams getTeamById(int teamId);
	
	 @Insert("""
	            INSERT INTO team_membership_request 
	            (team_id, member_id, status, regDate)
	            VALUES 
	            (#{teamId}, #{memberId}, 'REQUEST', NOW())
	            """)
	    void requestToJoinTeam(@Param("teamId") int teamId, @Param("memberId") int memberId);

	    @Update("""
	            UPDATE team_membership_request 
	            SET status = #{status}, updateDate = NOW()
	            WHERE id = #{requestId}
	            """)
	    void updateMembershipRequestStatus(@Param("requestId") int requestId, @Param("status") String status);

	    @Select("""
	    	    SELECT tmr.*, m.nickname
	    	    FROM team_membership_request AS tmr
	    	    JOIN member AS m ON tmr.member_id = m.id
	    	    WHERE team_id = #{teamId} AND status = 'REQUEST'
	    	""")
	    	List<TeamMembershipRequest> getPendingMembershipRequests(int teamId);
	    
	    @Select("""
	    		SELECT m.* 
	    		FROM team_member AS tm 
	    		JOIN `member` AS m ON tm.member_id = m.id 
	    		WHERE tm.team_id = #{teamId}
	    		""")
	    List<Member> getTeamMembersByTeamId(int teamId);
}
