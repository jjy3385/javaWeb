<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("name","진주영");
	request.setAttribute("address","서울 양천구");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첫번째 JSP</title>
</head>
<body>
<%
	RequestDispatcher dispatcher = request.getRequestDispatcher("request2.jsp");
	dispatcher.forward(request,response);
%>
</body>
</html>