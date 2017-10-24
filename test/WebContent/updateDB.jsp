<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
       <%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*"%>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%!String strIsbn;
	String strTitle;
	String nPrice;
	String strDBAddMessage = "등록 실패";
	DecimalFormat df = new DecimalFormat("###.##");
%>
	<%
		request.setCharacterEncoding("EUC-KR");
		
		strIsbn = request.getParameter("isbn");
		strTitle = request.getParameter("title");
		nPrice = request.getParameter("price");
	
		Connection conn = null;

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_store?" + "user=root&password=admin");
		} catch (Exception ex) {
			System.out.println("mysql jdbc 드라이버 로드 에러");
		}

		try {
			String strInsert = "UPDATE book SET title=?, price=? WHERE isbn=?";
			PreparedStatement ps = conn.prepareStatement(strInsert);
			ps.setString(1, strTitle);
			ps.setString(2, nPrice);
			ps.setString(3, strIsbn);
			
			ps.executeUpdate();
			
			response.sendRedirect("managementpage.jsp");
			
		} catch (SQLException ex) {
			System.out.println("SQLException: " + ex.getMessage());
		}
	%>


</body>
</html>