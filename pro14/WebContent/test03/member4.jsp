<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%>  

<c:set var="id" value="jjy3385" scope="page" />
<c:set var="pwd" value="1234" scope="page" />
<c:set var="name" value="진주영" scope="page" />
<c:set var="age" value="${32 }" scope="page" />
<c:set var="height" value="${168 }" scope="page" />

<html>
<head>
  <meta charset=”UTF-8">
  <title>회원 정보 출력창</title>
</head>
<body>
	<c:if test="${true }">
		<h1>항상 참입니다</h1>
	</c:if>
	<c:if test="${(id =='jjy3385') && (pwd =='1234') }">
		<h1>ID: ${id} , PWD: ${pwd }</h1>
	</c:if>	
	
</table>