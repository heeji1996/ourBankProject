<%@ page language="java"
	import="java.util.*,java.sql.*,javax.servlet.http.*"
	contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.text.*"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@page session="false"%>
<%@page import="com.ourbank.app.bean.MeetingBoard_Bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="com.ourbank.app.PageNumberingManager"%>
<html>
<head>

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fonts.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/body.css" >
<meta charset="EUC-KR">
<title>모임게시판 목록</title>
</head>

<c:set var="total_cnt" value="${totalCnt}"/>
<c:set var="searchString" value="${searchStr}"/>
<c:set var="pageForView" value="${pageForView}"/>
<%
	int total_cnt=((Integer)(pageContext.getAttribute("total_cnt"))).intValue();
	String searchStr=(String) pageContext.getAttribute("searchString");
	int rowsPerPage=10;
	int total_pages=PageNumberingManager.getInstance().getTotalPage(total_cnt, rowsPerPage);
	//el로 꺼내쓸 수 있는 방법
	pageContext.setAttribute("t_pages", total_pages);
%>

<!-- *********************** 게시판 글쓰기 폼 ****************************  -->	
<jsp:include page="../../header.jsp"></jsp:include>
<!-- *********************** 사이드 메뉴 ****************************  -->	
	
	<div id="side_menu">
		<h4><a href="#">커뮤니티</a></h4>
		<div id="side_div">
			<ul id="side_submenu">
				<li>- <a href="/app/review_listSpecificPageWork.do?current_page=1"> 리 뷰</a></li>
				<li>- <a href="/app/free_listSpecificPageWork.do?current_page=1"> 자유게시판</a></li>
				<li>- <a href="/app/meeting_listSpecificPageWork.do?current_page=1"> 모임방</a></li>
				<li>- <a href="/app/debate_listSpecificPageWork.do?current_page=1"> 토론방</a></li>
				<li>- <a href="/app/_listSpecificPageWork.do?current_page=1"> 제태크노하우</a></li>
				<li>- <a href="/app/best_listSpecificPageWork.do?current_page=1"> BEST게시물</a></li>
			</ul>
		</div>
	</div>
	
<!-- *********************** 내용 ****************************  -->	
<div id="body_div">
<h2>모임방 게시판</h2>
<div id="board_div">	
	
<table cellspacing="1" width="700" border="0">
	<tr>
		<td>총 게시물:<c:out value="${totalCnt}"/></td>
		<td><p align=right>페이지:<c:out value="${t_pages}"/></p></td>
	</tr>
</table>
<table cellspacing="1" width="700" border="1">
	<tr>
		<td width="50"><p align="center">글번호</td>
		<td width="320"><p align="center">제목</td>
		<td width="100"><p align="center">아이디</td>
		<td width="100"><p align="center">등록일</td>
		<td width="100"><p align="center">조회수</td>
	</tr>
	<c:forEach var="board" items="${searchedList}">
		<tr>
			<td width="50"><p align="center">${board.getIdx_num()}</p></td>
			<td width="320">
				<p align="center">
				<a href="meeting_viewWork.do?idx_num=${board.getIdx_num()}&current_page=${pageForView}&searchStr=${searchStr}" 
				title="${board.getContent()}">${board.getSubject()}</a>
				</p>
			</td>
			<td width="100"><p align="center">${board.getId()}</p></td>
			<td width="100"><p align="center">${board.getCreated_date()}</p></td>
			<td width="100"><p align="center">${board.getHits()}</td>
		</tr>
	</c:forEach>
</table>
<table cellspacing="1" width="700" border="1">
	<tr>
		<td>
		<c:forEach var="i" begin="1" end="${t_pages}">
			<a href="meeting_listSearchedSpecificPageWork.do?
			pageForView=${i}&searchStr=<c:out value="${searchStr}"/>">
			[
			<c:if test="${i==pageForView}"><b></c:if>
			${i}
			<c:if test="${i==pageForView}"><b></c:if>
			]
		</c:forEach>
		</td>
	</tr>
</table>
<table width="700">
	<tr>
		<td><input type="button" value="전체 목록으로 돌아가기"
		onclick="window.location='meeting_listSpecificPageWork.do?current_page=1'"></td>
	
	</tr>
</table>
</div>
</div>

<!-- *********************** 게시판 글쓰기 폼 ****************************  -->	

	<jsp:include page="../../footer.jsp"></jsp:include>

</html>