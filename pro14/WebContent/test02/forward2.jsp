<%@page import="sec01.ex02.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	MemberBean member = new MemberBean("cp3","3","크리스폴","cp3@p.com");		
	request.setAttribute("member",member);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward2</title>
</head>
<body>
	<jsp:forward page="member2.jsp" />
</body>
</html>