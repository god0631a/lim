<%@page import="java.util.*"%> 

<%@ page contentType="text/html; charset=utf-8"%> 

<% 

request.setCharacterEncoding("euc-kr"); 

%> 
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*"%>
<%@ page import="java.text.DecimalFormat"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="master/NewFile.jsp"></jsp:include>
<h1>&nbsp;</h1>


<%
	request.setCharacterEncoding("euc-kr"); //받아오는 값들을 한글로 인코딩합니다.
	  
	
	Class.forName("com.mysql.jdbc.Driver");
	
	String url = "jdbc:mysql://localhost/book_store?";
	String id = "root";
	String pass = "admin";

	 String ids = (String)session.getAttribute("userid"); 
	 String isbn = request.getParameter("isbn"); //write.jsp에서 name에 입력한 데이터값
	int count =1;
	try {	
		Connection conn = DriverManager.getConnection(url,id,pass);
		
		String sql = "INSERT INTO basckt(isbn, userid, basckcount) VALUES(?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, isbn);
		pstmt.setString(2, ids);
		pstmt.setInt(3, count);
		
		pstmt.execute();
		pstmt.close();
		
		conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
	}

%>
<script>
alert("장바구니에 담겼습니다");
location.href="menu.jsp";
</script>

</body>
</html>