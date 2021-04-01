<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
    Kakao.init("47d80a797066ad48e74a8224ca2a7e23");
    var id = null;
    var email = null;
    var name = null;
    var strArry = null;

          Kakao.Auth.loginForm({
            scope: 'profile, account_email, gender',
            success: function(authObj){
              console.log(authObj);
              Kakao.API.request({
                url:'/v2/user/me',
                success: res => {
                  const kakao_account = res.kakao_account;
                  console.log(kakao_account);
             
                  id = res.id;
                  email = res.kakao_account.email;
                  emailres = email.split('@');
                  name = res.properties.nickname;
                  setTimeout(function() {
                	  alert("회원가입 완료! \n로그인을 해주세요")
					  location.href="main.jsp";
					}, 10);
                  id, email, name
          		$.ajax({

          			url:"member_join.jsp",     //jap2로 id값 전송

          			dataType:"json",	

          			Type:"post",

          			data:{"id":id,"email1":emailres[0],"email2":emailres[1],"name":name},
                                success : function(data) {alert("완료!")}
          			});
                }
              })           
              	var token = authObj.access_token;
				return;
            },
            fail: function(error) {
            console.log(error);
        }
});
	</script>
</head>
<body>
</body>
</html>