<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String id =request.getParameter("id");
	System.out.println("id값 : "+id);
	
	String pw =request.getParameter("pw");
	System.out.println("pw값 : "+pw);
	
	String name =request.getParameter("name");
	System.out.println("name값 : "+name);
	
	String email1 = request.getParameter("email1");
	System.out.println("email1값 : "+email1);
	String email2 = request.getParameter("email2");
	System.out.println("email2값 : "+email2);
	
	String email = email1+"@"+email2;
	
	
	
%>
<%
	
	Class.forName("com.mysql.cj.jdbc.Driver");

	String dbURL = "jdbc:mysql://localhost:3306/handwork?serverTimezone=UTC";
	String dbID = "root";
	String dbPassword = "1234";

	try (Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(String.format("select * from h_member where id='%s'",
			id));
		) {
			if (rs.next()) {
%>
	
			<script>
				alert('이미 등록된 아이디입니다.');
				history.back()
			</script>
<%
			}else {
				stmt.executeUpdate(String.format(
					"insert into h_member values(null, '%s', '%s', '%s', '%s')",
					id,
					pw,
					name,
					email
					)
				);
			
%>
		<script>
			alert('가입이 완료되었습니다. 로그인을 해주세요');
			location.href="main.jsp";	
		</script>
<%
			}
		} catch (Exception e) {
			e.printStackTrace();
}
%>
</body>
</html>