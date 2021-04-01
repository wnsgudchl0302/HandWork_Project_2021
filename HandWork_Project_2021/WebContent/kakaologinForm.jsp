<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="kakaoLogin.jsp">다른계정으로 로그인</a><br>
<a id = "kakao-login-btn"></a><br>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	Kakao.init("47d80a797066ad48e74a8224ca2a7e23");
	
	Kakao.Auth.createLoginButton({
		container: '#kakao-login-btn',
		success: function(authObj){
			Kakao.API.request({
				url:'/v2/user/me',
				success: function(res){
					console.log(res);
					var id = res.id;
					var email = res.kakao_account.email;
					var name = res.properties.nickname;
					var image = res.properties.profile_image;
					var html = '<br>' + email + '<br>' + name;
					
					html +='<br><img src= ""'+image + '">';
					$('body').append(html);
					history.back();
					
					
					

					
				}
			})
			console.log(authObj);
			var token = authObj.access_token;
		},
		fail: function(err){
			alert(JSON.stringify(err));
		}
	});
	</script>

</body>
</html>