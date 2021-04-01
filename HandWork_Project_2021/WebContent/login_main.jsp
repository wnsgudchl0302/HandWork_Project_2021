<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	Kakao.init("47d80a797066ad48e74a8224ca2a7e23");
	Kakao.isInitialized();
	function unlinkWithKakao() {
		Kakao.API.request({
			url : '/v1/user/unlink',
			success : function(response) {
				console.log(response);
			},
			fail : function(error) {
				console.log(error);
			}
		});
	}
</script>

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
	<form action="login.jsp" method="post">
		아이디 : <input type="text" name="id"> &nbsp; &nbsp; <br>
		비밀번호 : <input type="password" name="pw"> <input type="submit"
			value="로그인"> <input type="button" value="회원가입"
			onclick="location.href='member_join_menu.jsp'">
	</form>
	<form action="kakaoLogin.jsp" method="post">
		<input type="submit" value="카카오로 로그인">
	</form>
	<a href="javascript:unlinkWithKakao();">카카오로 계정연결끊기</a>
	<%
		}
	%>
</body>
</html>