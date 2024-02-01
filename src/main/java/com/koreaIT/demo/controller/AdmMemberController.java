package com.koreaIT.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.util.Util;
import com.koreaIT.demo.vo.Member;
import com.koreaIT.demo.vo.Rq;

@Controller
public class AdmMemberController {

	private MemberService memberService;
	private Rq rq;

	public AdmMemberController(MemberService memberService, Rq rq) {
		this.memberService = memberService;
		this.rq = rq;
	}

	@RequestMapping("/adm/member/list")
	public String showList(Model model, @RequestParam(defaultValue = "0") String authLevel,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "loginId,name,nickname") String searchKeywordType,
			@RequestParam(defaultValue = "") String searchKeyword) {

		if (page <= 0) {
			return rq.jsReturnOnView("페이지번호가 올바르지 않습니다");
		}

		int membersCnt = memberService.getMembersCnt(authLevel, searchKeywordType, searchKeyword);

		int itemsInAPage = 10;

		int limitStart = (page - 1) * itemsInAPage;

		int pagesCnt = (int) Math.ceil((double) membersCnt / itemsInAPage);

		List<Member> members = memberService.getMembers(authLevel, searchKeywordType, searchKeyword, limitStart,
				itemsInAPage);

		Member member = memberService.getMemberById(rq.getLoginedMemberId());
		
		model.addAttribute("searchKeywordType", searchKeywordType);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("member", member);
		model.addAttribute("members", members);
		model.addAttribute("membersCnt", membersCnt);
		model.addAttribute("authLevel", authLevel);
		model.addAttribute("pagesCnt", pagesCnt);
		model.addAttribute("page", page);

		return "adm/member/list";
	}
	
	@RequestMapping("/adm/member/doDeleteMembers")
	@ResponseBody
	public String doDeleteMembers(@RequestParam(name = "ids", required = false) List<String> ids) {
		
		if (ids == null) {
			return Util.jsHistoryBack("선택한 회원이 없습니다");
		}
		
		for (String idStr : ids) {
			if (idStr.equals("1")) {
				return Util.jsHistoryBack("관리자 계정은 삭제할 수 없습니다");
			}
		}
		
		memberService.deleteMembers(ids);
		
		return Util.jsReplace("선택한 회원이 삭제되었습니다", "list");
	}
}
