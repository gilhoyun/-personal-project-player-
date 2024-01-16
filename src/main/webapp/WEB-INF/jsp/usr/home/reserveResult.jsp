<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <c:set var="pageTitle" value="API" />
        <%@ include file="../common/head.jsp" %>

            <div class="side">
                <c:if test="${not empty facilityDetailsList}">
                    <ul class="reserveResult">
                        <c:forEach items="${facilityDetailsList}" var="facility" varStatus="loop">
                            <li
                                style="border: 1px solid #D9E0E6; border-radius: 10px; padding: 25px; display: block; width: 70%;">
                                <span style="font-size: 21px;">
                                    <div>

                                        <c:out value="${facility.getAreaName()}" /><br>
                                        -<a href="https://www.eshare.go.kr/UserPortal/adv/resources/AdvEsSearchResourcesMainView.do?rsrcClsCd=010505&sido=11" class="hover:underline"><c:out value="${facility.getPlaceName()}" /></a><br>
                                        -결제여부:
                                        <c:out value="${facility.getPayatName()}" /><br>
                                        -전화번호:
                                        <c:out value="${facility.getTelNo()}" /><br>
                                        -접수시작:
                                        <c:out value="${facility.getRcptBgndt()}" /><br>
                                        -접수종료:
                                        <c:out value="${facility.getRcptEnddt()}" /><br>
                                        -예약분류: 외부예약
                                    </div>
                                </span>
                            </li>
                        </c:forEach>
                    </ul>
                </c:if>
            </div>
            <%@ include file="../common/foot.jsp" %>