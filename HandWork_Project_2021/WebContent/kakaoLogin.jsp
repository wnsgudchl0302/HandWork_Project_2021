<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		Kakao.init("47d80a797066ad48e74a8224ca2a7e23");
	
	var id = null;
	var email = null;
	var name = null;
	Kakao.Auth.loginForm({
		success: function(authObj){
			Kakao.API.request({
				url:'/v2/user/me',
				success: function(res){
					console.log(res);
					const kakao_account = res.kakao_account;
		            console.log(kakao_account);
		            var accessToken = Kakao.Auth.getAccessToken();
		            Kakao.Auth.setAccessToken(accessToken);
					id = res.id;
					email = res.kakao_account.email;
					name = res.properties.nickname;
					image = res.properties.profile_image;
					setTimeout(function() {
						  location.href="main.jsp";
						}, 30);
				
					 id, email, name
			      		$.ajax({

			      			url:"login.jsp",    
			      			
			      			dataType:"json",	

			      			Type:"post",

			      			data:{"id":id, "email":email, "name":name},
			                            success : function(data) {alert("완료!")}
			      		});
					}
			});
			console.log(authObj);
			var token = authObj.access_token;
		},
		fail: function(err){
		}
	});
</script>
	
</body>
</html>