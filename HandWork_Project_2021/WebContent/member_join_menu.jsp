<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<input type="button" value="기본 회원가입"
		onclick="location.href='member_join_form.jsp' ">
	
	<input type="button" value="카카오 회원가입"
		onclick="location.href='kakao_join.jsp'">
<a href="javascript:unlinkWithKakao();">카카오로 계정연결끊기</a>

</body>
</html>