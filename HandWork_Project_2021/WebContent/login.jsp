<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%

request.setCharacterEncoding("utf-8");

	Class.forName("com.mysql.cj.jdbc.Driver");

String dbURL = "jdbc:mysql://localhost:3306/handwork?serverTimezone=UTC";
String dbID = "root";
String dbPassword = "1234";

try (Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(String.format("select * from h_member where id='%s' and pw='%s'",
		request.getParameter("id"), request.getParameter("pw")));) {
	if (rs.next()) {
		session.setAttribute("id", rs.getString("id"));
		session.setAttribute("name", rs.getString("name"));
		
		response.sendRedirect("main.jsp");
		return;
		
		
	}

} catch (Exception e) {
	e.printStackTrace();
}




%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert('아이디 또는 비밀번호가 틀립니다!');
		history.back();
	</script>
</body>
</html>