<%@page import="sec01.ex02.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	isELIgnored="false"    
%>
<%
	request.setCharacterEncoding("utf-8");
	List<MemberBean> list = new ArrayList<MemberBean>();
	MemberBean m1 = new MemberBean("cp3","3","크리스폴","cp3@pheonix.com");
	MemberBean m2 = new MemberBean("booker","1","데빈부커","db@pheonix.com");
	list.add(m1);
	list.add(m2);
	
	request.setAttribute("list",list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward3</title>
</head>
<body>
	<jsp:forward page="member3.jsp" />
</body>
</html>