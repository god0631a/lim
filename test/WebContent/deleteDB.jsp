<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*"%>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>도서 삭제</title>
</head>
<body>
	<%
	Class.forName("com.mysql.jdbc.Driver");
	String DB_URL = "jdbc:mysql://localhost:3306/book_store?";
	String DB_USER = "root";
	String DB_PASSWORD = "admin";

	String[] allChecked =request.getParameterValues("checkBoxToDelete");
	Connection conn = null;
	Statement stmt = null;

	try {
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		
		for(int i=0;i<allChecked.length;i++){ 
		String a = allChecked[i];
		String query = "DELETE FROM book WHERE isbn="+ a;
		PreparedStatement ps = conn.prepareStatement(query);
		ps.executeUpdate(query);
		
		}
	} catch (SQLException e) {
		System.out.println("Error Source : getEmp1.jsp : SQLException");
		System.out.println("SQLState : " + e.getSQLState());
		System.out.println("Message : " + e.getMessage());
		System.out.println("Oracle Error Code : " + e.getErrorCode());
	}
	%>
	입력하신 책 정보가 삭제되었습니다.
	<button type="button" onclick="location.href='managementpage.jsp' ">홈으로</button>

</body>
</html>