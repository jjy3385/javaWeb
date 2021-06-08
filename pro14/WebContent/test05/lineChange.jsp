<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>       
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<%
  request.setCharacterEncoding("utf-8");
%>
 
<html>
<head>
<meta charset="UTF-8">
<title>개행 문자 변환하기</title>
</head>
<body>
	<c:set var="title1" value="안녕하세요. \r\n 쇼핑몰 중심 JSP입니다!" />
	${title1 }<br><br>
	${fn:replace(title1,"\\r\\n","<br>") }	<!-- 웹브라우저의 개행은 <br>태그이므로 개행문자를 <br>태그로 변환해야함 -->
</body>
</html>