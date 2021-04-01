<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = null;

		if ((String) session.getAttribute("id") != null) {
	%>
	<form action="logout.jsp" method="post">
		<%=(String) session.getAttribute("name")%>님 로그인 <input type="submit"
			value="로그아웃">
	</form>
	<%
		} else {
	%>
	<input type="button" value="로그인"
		onclick="location.href='login_main.jsp'">
	<input type="button" value="회원가입"
		onclick="location.href='member_join_menu.jsp'">
	<%
		}
	%>
</body>
</html>