<%@page import="sec01.ex01.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="m1" class="sec01.ex01.MemberBean" />
<jsp:setProperty name="m1" property="*" />

<jsp:useBean id="membersList" class="java.util.ArrayList" />
<jsp:useBean id="membersMap" class="java.util.HashMap" />

<%
	membersMap.put("id","lebron");
	membersMap.put("pwd","6");
	membersMap.put("name","릅형");
	membersMap.put("email","lebron@lakers.com");
	
	MemberBean m2 = new MemberBean("curry","30","커리","curry@gs.com");
	membersList.add(m1);
	membersList.add(m2);
	membersMap.put("membersList",membersList);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 출력창</title>
</head>
<body>
	<table border="1" align="center">
		<tr align="center" bgcolor="#99ccff">
			<td width="20%"><b>아이디</b></td>
			<td width="20%"><b>비밀번호</b></td>
			<td width="20%"><b>이름</b></td>
			<td width="20%"><b>이메일</b></td>
		</tr>
		<tr align="center">
			<td>${membersMap.id }</td>
			<td>${membersMap.pwd }</td>
			<td>${membersMap.name }</td>
			<td>${membersMap.email }</td>
		</tr>
		<tr align="center">
			<td>${membersMap.membersList[0].id }</td>
			<td>${membersMap.membersList[0].pwd }</td>
			<td>${membersMap.membersList[0].name }</td>
			<td>${membersMap.membersList[0].email }</td>
		</tr>
		<tr align="center">
			<td>${membersMap.membersList[1].id }</td>
			<td>${membersMap.membersList[1].pwd }</td>
			<td>${membersMap.membersList[1].name }</td>
			<td>${membersMap.membersList[1].email }</td>
		</tr>		
	</table>
</body>
</html>
