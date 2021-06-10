<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<title>JSON ajax 실습</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#checkJson").click(function(){
			var _jsonInfo = '{"name":"박지성","age":"25","gender":"남자","nickname":"산소탱크"}';
			$.ajax({
				type:"post",
				async:false,
				url:"${contextPath}/json",
				data:{jsonInfo: _jsonInfo},
				success:function(data,textStatus){
					
				},
				error:function(data,textStatus){
					alert("에러가 발생했습니다.");
				},
				complete:function(data,textStatus){
					
				}
			});	//end ajax
		});
	});
	

</script>	
<meta charset="UTF-8">
<title>JSON 테스트</title>
</head>
<body>
    <a id="checkJson" style="cursor:pointer">전송</a><br><br>
    <div id="output"></div>
</body>
</html>