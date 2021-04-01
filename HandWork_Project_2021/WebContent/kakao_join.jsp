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
    //var gender = null;    
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
                  //gender = res.kakao_account.gender;
                  name = res.properties.nickname;
                  setTimeout(function() {
                	  alert("회원가입 완료 \n로그인을 해주세요")
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
                  //$('body').append(html);
                }
              })
              
              var token = authObj.access_token;
              
             	

      		return;
           
            }/*,
            fail: function(error) {
            console.log(error);
        }*/

       
          });
          
          
         
        
        
      
    		
    		
    		/*
    	
        function kakaoLogout(){
        Kakao.Auth.logout(
        		function(obj) {
        		if(obj==true){}else{}
        		// location.href='https://developers.kakao.com/logout';
        		 location.href='http://localhost:8080/HandWork_Project_2021/kakao_login.jsp';
        		 }
        		);
        }
        function logoutWithKakao() {
            if (!Kakao.Auth.getAccessToken()) {
                console.log('Not logged in.');
                alert("Not logged in.");
                return;
            }
            console.log(Kakao.Auth.getAccessToken()); //before Logout
            Kakao.Auth.logout(function() {
                console.log(Kakao.Auth.getAccessToken()); //after Logout
                alert("LogOut Success");
                //★ 추가 할 것 : 로그아웃 성공 후 처리 
            });
        }      
        function unlinkWithKakao() {
            Kakao.API.request({
                url: '/v1/user/unlink',
                success: function(response) {
                    console.log(response);
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }               */
        
    </script>
 
    
  </head>
<body>
	<!--<a href="javascript:kakaoLogin();">카카오로 로그인</a>
	  <a href="https://developers.kakao.com/logout">로그아웃</a>
	<a href="javascript:logoutWithKakao();">카카오로 로그아웃</a>
	<a href="javascript:unlinkWithKakao();">카카오로 계정연결끊기</a>
	<form action="logout.jsp" method="post">
		<input type="submit" value="로그아웃">
	</form>
	<button onclick="ajaxJS()">값 자바로 전송</button>
	<input type="text" name="id" id=ids>

	<button onclick="ajaxJS()">전송</button>  -->
</body>
</html>