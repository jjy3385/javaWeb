<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	request.setAttribute("id","jjy3385");
	request.setAttribute("pwd","1234");
	session.setAttribute("name","진주영");
	application.setAttribute("email","jjy3386@gmail.com");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward1.jsp</title>
</head>
<body>
	<jsp:forward page="member1.jsp" />
</body>
</html>