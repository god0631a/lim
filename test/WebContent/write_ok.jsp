<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat, javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ü ���� ���</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="bootstrap.vertical-tabs.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

</head>
<body>
 <jsp:include page="master/NewFile.jsp"></jsp:include>
 <h1>&nbsp;</h1>
 
<%
	request.setCharacterEncoding("euc-kr"); //�޾ƿ��� ������ �ѱ۷� ���ڵ��մϴ�.

	Class.forName("com.mysql.jdbc.Driver");
	
	String url = "jdbc:mysql://localhost/book_store?";
	String id = "root";
	String pass = "admin";

	Date dt = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
	String today = formatter.format(new java.util.Date());
	
	
	String name = request.getParameter("name"); //write.jsp���� name�� �Է��� �����Ͱ�
	String password = request.getParameter("password");//write.jsp���� password�� �Է��� �����Ͱ�
	String title = request.getParameter("title"); //write.jsp���� title�� �Է��� �����Ͱ�
	String memo = request.getParameter("memo"); //write.jsp���� memo�� �Է��� �����Ͱ�
	
	try {	
		Connection conn = DriverManager.getConnection(url,id,pass);
		
		String sql = "INSERT INTO board1(USERNAME,PASSWORD,TITLE,MEMO,TIME) VALUES(?,?,?,?,NOW())";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, memo);

		
		pstmt.execute();
		pstmt.close();
		
		conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
	} 

%>

 <script language=javascript>
   self.window.alert("�Է��� ���� �����Ͽ����ϴ�.");
   location.href="list.jsp"; 
   </script>
 
</body>
</html>