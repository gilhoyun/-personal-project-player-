package com.koreaIT.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.service.TeamsService;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.ResultData;
import com.koreaIT.demo.vo.Rq;
import com.koreaIT.demo.vo.TeamMembershipRequest;
import com.koreaIT.demo.vo.Teams;

import jakarta.servlet.http.HttpSession;

@Controller
public class UsrTeamsController {

    private TeamsService teamsService;
    private MemberService memberService; 
    private Rq rq;

    public UsrTeamsController(TeamsService teamsService, MemberService memberService, Rq rq) {
        this.teamsService = teamsService;
        this.memberService = memberService;
        this.rq = rq;
    }
    
    @RequestMapping("/usr/member/myTeams")
    public String myTeams(Model model) {
        int loginedMemberId = rq.getLoginedMemberId();

        if (loginedMemberId == 0) {
            return "redirect:/usr/member/login";
        }

        Teams team = teamsService.getTeamsByLoginedMember(loginedMemberId);
        model.addAttribute("hasTeamRegistered", team);

        if (team != null) {
            List<String> acceptedMembersNicknames = teamsService.getAcceptedTeamMembersNicknames(team.getId());
            model.addAttribute("acceptedMemberNicknames", acceptedMembersNicknames);
            
            List<String> acceptedMembersPhoneNumbers = teamsService.getAcceptedTeamMembersPhoneNumbers(team.getId());
            model.addAttribute("acceptedMemberPhoneNumbers", acceptedMembersPhoneNumbers);
        }

        return "usr/member/myTeams";
    }

    @RequestMapping("/usr/member/teams")
    public String teams(Model model) {
        int loginedMemberId = rq.getLoginedMemberId();

        if (loginedMemberId == 0) {
            return "redirect:/usr/member/login";
        }

        Member member = teamsService.getMemberById(loginedMemberId);
        model.addAttribute("member", member);
        
        
      
        
        return "usr/member/teams";
    }

    @RequestMapping("/usr/member/teams/doRegisterTeam")
    @ResponseBody
    public String doRegisterTeam(String teamName, String cellphoneNum, String age, String stadium, String region,HttpSession session) {
        int loginedMemberId = rq.getLoginedMemberId();

        if (loginedMemberId == 0) {
            return "redirect:/usr/member/login";
        }

        Member member = memberService.getMemberById(loginedMemberId);
        if (member == null) {
            return Util.jsHistoryBack(Util.f("F-2", "회원 정보를 찾을 수 없습니다."));
        }

        teamsService.doRegisterTeam(loginedMemberId, teamName, cellphoneNum, age, stadium, region);

    
        session.setAttribute("teamRegistrationComplete", true);
        

        return Util.jsReplace(Util.f("%s의 팀 등록이 완료되었습니다", teamName), "/usr/home/main");
    }
    
    @RequestMapping("/usr/member/teams/doDeleteTeam")
    @ResponseBody
    public String doDeleteTeam(HttpSession session) {
        int loginedMemberId = rq.getLoginedMemberId();

        if (loginedMemberId == 0) {
            return "redirect:/usr/member/login";
        }

        teamsService.doDeleteTeam(loginedMemberId);
        
        session.setAttribute("teamDeletionComplete", true);

        return Util.jsReplace("팀 삭제가 완료되었습니다", "/usr/home/main");
    }
    
    @RequestMapping("/usr/member/teams/showUpdateForm")
    public String showUpdateForm(Model model) {
        int loginedMemberId = rq.getLoginedMemberId();

        if (loginedMemberId == 0) {
            return "redirect:/usr/member/login";
        }

        Teams teams = teamsService.getTeamsByLoginedMember(loginedMemberId);
        model.addAttribute("teams", teams);

        return "usr/member/updateTeamForm";
    }

    @RequestMapping("/usr/member/teams/doUpdateTeam")
    @ResponseBody
    public String doUpdateTeam(int teamId, String teamName, String cellphoneNum, String age, String stadium, String region) {
        int loginedMemberId = rq.getLoginedMemberId();

        if (loginedMemberId == 0) {
            return "redirect:/usr/member/login";
        }

        teamsService.doUpdateTeam(teamId, teamName, cellphoneNum, age, stadium, region);

        return Util.jsReplace("팀 정보가 수정되었습니다", "/usr/home/main");
    }
    
    @RequestMapping("/usr/member/allTeams")
    public String viewAllTeams(Model model) {
        List<Teams> allTeams = teamsService.getAllTeams();
        model.addAttribute("allTeams", allTeams);
        return "usr/member/allTeams";
    }
    
    @RequestMapping("/usr/member/teams/viewTeam")
    public String viewTeam(@RequestParam int teamId, Model model) {
        int loginedMemberId = rq.getLoginedMemberId();

        if (loginedMemberId == 0) {
            return "redirect:/usr/member/login";
        }

        Teams team = teamsService.getTeamById(teamId);

        String membershipStatus = teamsService.getMembershipStatus(loginedMemberId, teamId);

        model.addAttribute("team", team);
        model.addAttribute("membershipStatus", membershipStatus);

        return "usr/member/viewTeam";
    }
    
    @RequestMapping("/usr/member/teams/requestToJoinTeam")
    @ResponseBody
    public String requestToJoinTeam(@RequestParam int teamId, HttpSession session) {
        int loginedMemberId = rq.getLoginedMemberId();

        if (loginedMemberId == 0) {
            return "redirect:/usr/member/login";
        }

        teamsService.requestToJoinTeam(loginedMemberId, teamId);

        session.setAttribute("teamJoinRequestComplete", true);

        return Util.jsReplace("팀 가입 신청이 완료되었습니다", "/usr/home/main");
    }

    @RequestMapping("/usr/member/myTeams/viewTeamMembershipRequests")
    public String viewTeamMembershipRequests(Model model) {
        int loginedMemberId = rq.getLoginedMemberId();

        if (loginedMemberId == 0) {
            return "redirect:/usr/member/login";
        }

        List<TeamMembershipRequest> membershipRequests = teamsService.getPendingMembershipRequests(loginedMemberId);
        model.addAttribute("membershipRequests", membershipRequests);

        return "usr/member/viewTeamMembershipRequests";
    }

    @RequestMapping("/usr/member/myTeams/doUpdateMembershipRequestStatus")
    @ResponseBody
    public String doUpdateMembershipRequestStatus(@RequestParam int requestId, @RequestParam String status) {
        int loginedMemberId = rq.getLoginedMemberId();

        if (loginedMemberId == 0) {
            return "redirect:/usr/member/login";
        }

        teamsService.updateMembershipRequestStatus(requestId, status);

        return Util.jsReplace("팀 멤버쉽 요청이 처리되었습니다", "/usr/home/main");
    }
    
    @RequestMapping("/usr/member/teams/viewAcceptedTeam")
    public String viewAcceptedTeam(Model model) {
        int loginedMemberId = rq.getLoginedMemberId();

        if (loginedMemberId == 0) {
            return "redirect:/usr/member/login";
        }

        List<Teams> acceptedTeams = teamsService.getAcceptedTeamsByMemberId(loginedMemberId);
        model.addAttribute("acceptedTeams", acceptedTeams);

        if (acceptedTeams.isEmpty()) {
            model.addAttribute("noTeamsMessage", "가입한 팀이 없습니다. 팀에 가입 후 이용해주세요.");
        }

        return "usr/member/viewAcceptedTeam";
    }
    
    @RequestMapping("/usr/member/teams/doLeaveTeam")
    @ResponseBody
    public String doLeaveTeam(@RequestParam int teamId, HttpSession session) {
        int loginedMemberId = rq.getLoginedMemberId();

        if (loginedMemberId == 0) {
            return "redirect:/usr/member/login";
        }

        teamsService.leaveTeam(loginedMemberId, teamId);

        session.setAttribute("teamLeaveComplete", true);

        return Util.jsReplace("팀 탈퇴가 완료되었습니다", "/usr/home/main");
    }
    
    @RequestMapping("/usr/member/teams/doRecordResult")
    @ResponseBody
    public String doRecordResult(@RequestParam int teamId, @RequestParam int wins, @RequestParam int losses) {
        int loginedMemberId = rq.getLoginedMemberId();

        if (loginedMemberId == 0) {
            return "redirect:/usr/member/login";
        }

        teamsService.updateTeamRecord(teamId, wins, losses);

        return Util.jsReplace("팀 기록이 업데이트되었습니다", "/usr/home/main");
    }
    
    @RequestMapping("/usr/member/teams/beginnerTeams")
    public String showBeginnerTeams(Model model) {
        List<Teams> beginnerTeams = teamsService.getBeginnerTeams();
        model.addAttribute("beginnerLeagueTeams", beginnerTeams);
        return "usr/member/beginnerTeams";
    }
    
    @RequestMapping("/usr/member/teams/thirdLeagueTeams")
    public String showThirdLeagueTeams(Model model) {
        List<Teams> thirdLeagueTeams = teamsService.getTeamsWithScoreBetween21And40();
        model.addAttribute("thirdLeagueTeams", thirdLeagueTeams);
        return "usr/member/thirdLeagueTeams";
    }
    
    @RequestMapping("/usr/member/teams/secondLeagueTeams")
    public String showSecondLeagueTeams(Model model) {
        List<Teams> secondLeagueTeams = teamsService.getTeamsWithScoreBetween41And60();
        model.addAttribute("secondLeagueTeams", secondLeagueTeams);
        return "usr/member/secondLeagueTeams";
    }
    
    @RequestMapping("/usr/member/teams/firstLeagueTeams")
    public String showFirstLeagueTeams(Model model) {
        List<Teams> firstLeagueTeams = teamsService.getTeamsWithScoreBetween61And80();
        model.addAttribute("firstLeagueTeams", firstLeagueTeams);
        return "usr/member/firstLeagueTeams";
    }
}

