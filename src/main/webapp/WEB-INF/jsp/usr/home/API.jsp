<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="jsonResponse" value="${apiResult}" />
<c:set var="parsedJson" value="${jsonResponse}" />

<c:if test="${not empty parsedJson}">
    <c:set var="areanm" value="${parsedJson.AREANM}" />
    <!-- Displaying AREANM value -->
    <p>AREANM: ${areanm}</p>
</c:if>