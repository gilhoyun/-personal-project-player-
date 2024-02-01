package com.koreaIT.demo.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.koreaIT.demo.service.FileService;
import com.koreaIT.demo.service.MemberService;
import com.koreaIT.demo.vo.FacilityDetails;
import com.koreaIT.demo.vo.Rq;

@Controller
public class UsrHomeController {
	
	private FileService fileService;
	private MemberService memberService;
	private Rq rq;
	
	public UsrHomeController(FileService fileService, MemberService memberService, Rq rq) {
		this.fileService = fileService;
		this.memberService = memberService;
		this.rq = rq;
	}

	@RequestMapping("/usr/home/main")
	public String showMain(Model model) {
		try {
            StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088");
            urlBuilder.append("/" + URLEncoder.encode("4369524d43676f68343142745a4b74","UTF-8") ); /*인증키
    		(sample사용시에는 호출시 제한됩니다.)*/
    		urlBuilder.append("/" + URLEncoder.encode("json","UTF-8") ); /*요청파일타입
    		(xml,xmlf,xls,json) */
    		urlBuilder.append("/" + URLEncoder.encode("ListPublicReservationSport","UTF-8"));
    		/*서비스명 (대소문자 구분 필수입니다.)*/
    		urlBuilder.append("/" + URLEncoder.encode("1","UTF-8")); /*요청시작위치
    		(sample인증키 사용시 5이내 숫자)*/
    		urlBuilder.append("/" + URLEncoder.encode("5","UTF-8"));
    		/*요청종료위치(sample인증키 사용시 5이상 숫자 선택 안 됨)*/
    		// 상위 5개는 필수적으로 순서바꾸지 않고 호출해야 합니다.
    		// 서비스별 추가 요청 인자이며 자세한 내용은 각 서비스별 '요청인자'부분에
    		urlBuilder.append("/" + URLEncoder.encode("풋살장","UTF-8")); /* 서비스별
    		추가 요청인자들*/

            URL url = new URL(urlBuilder.toString());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-type", "application/json");

            BufferedReader rd;
            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }

            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line);
                
            }
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(sb.toString());


            JsonNode rowArray = jsonNode.path("ListPublicReservationSport").path("row");

            List<FacilityDetails> facilityDetailsList = new ArrayList<>();

            for (JsonNode node : rowArray) {
                FacilityDetails facility = new FacilityDetails();
                facility.setAreaName(node.path("AREANM").asText());
                facility.setPlaceName(node.path("PLACENM").asText());
                facility.setPayatName(node.path("PAYATNM").asText());
                facility.setTelNo(node.path("TELNO").asText());
                facility.setRcptBgndt(node.path("RCPTBGNDT").asText());
                facility.setRcptEnddt(node.path("RCPTENDDT").asText());

                facilityDetailsList.add(facility);
            }

            model.addAttribute("facilityDetailsList", facilityDetailsList);

        } catch (IOException e) {
            e.printStackTrace();
        }
		model.addAttribute("member", memberService.getMemberById(rq.getLoginedMemberId()));
		return "usr/home/main";
	}
	
	@RequestMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}
	
	@RequestMapping("/usr/home/API")
    public String API(Model model) {
        try {
            StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088");
            urlBuilder.append("/" + URLEncoder.encode("4369524d43676f68343142745a4b74","UTF-8") ); /*인증키
    		(sample사용시에는 호출시 제한됩니다.)*/
    		urlBuilder.append("/" + URLEncoder.encode("json","UTF-8") ); /*요청파일타입
    		(xml,xmlf,xls,json) */
    		urlBuilder.append("/" + URLEncoder.encode("ListPublicReservationSport","UTF-8"));
    		/*서비스명 (대소문자 구분 필수입니다.)*/
    		urlBuilder.append("/" + URLEncoder.encode("1","UTF-8")); /*요청시작위치
    		(sample인증키 사용시 5이내 숫자)*/
    		urlBuilder.append("/" + URLEncoder.encode("5","UTF-8"));
    		/*요청종료위치(sample인증키 사용시 5이상 숫자 선택 안 됨)*/
    		// 상위 5개는 필수적으로 순서바꾸지 않고 호출해야 합니다.
    		// 서비스별 추가 요청 인자이며 자세한 내용은 각 서비스별 '요청인자'부분에
    		urlBuilder.append("/" + URLEncoder.encode("풋살장","UTF-8")); /* 서비스별
    		추가 요청인자들*/

            URL url = new URL(urlBuilder.toString());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-type", "application/json");

            BufferedReader rd;
            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }

            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line);
                
            }
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(sb.toString());


            JsonNode rowArray = jsonNode.path("ListPublicReservationSport").path("row");

            List<FacilityDetails> facilityDetailsList = new ArrayList<>();

            for (JsonNode node : rowArray) {
                FacilityDetails facility = new FacilityDetails();
                facility.setAreaName(node.path("AREANM").asText());
                facility.setPlaceName(node.path("PLACENM").asText());
                facility.setPayatName(node.path("PAYATNM").asText());
                facility.setTelNo(node.path("TELNO").asText());
                facility.setRcptBgndt(node.path("RCPTBGNDT").asText());
                facility.setRcptEnddt(node.path("RCPTENDDT").asText());

                facilityDetailsList.add(facility);
            }

            model.addAttribute("facilityDetailsList", facilityDetailsList);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return "usr/home/reserveResult";
    }
}
