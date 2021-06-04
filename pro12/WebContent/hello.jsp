<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
	String name = "진주영";
	public String getName(){return name;}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언문 실습</title>
</head>
<body>
	<h1>안녕하세요 <%= getName() %>입니다.</h1>
</body>
</html>