<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

    <%

	request.setCharacterEncoding("euc-kr");

	Class.forName("com.mysql.jdbc.Driver");
	
	String url = "jdbc:mysql://localhost/book_store?";
	String id = "root";
	String pass = "admin";
	
	String password = "";
	int idx = Integer.parseInt(request.getParameter("idx"));
	String passw = request.getParameter("password");
	
	out.print(passw);
	try{
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();
		String sql = "SELECT PASSWORD FROM board1 WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()){
			password = rs.getString(1); 
		}
		if(password.equals(passw)) {
   			
			sql = "DELETE FROM board1 WHERE NUM=" + idx;	
			stmt.executeUpdate(sql);
		
		%>
		<script language=javascript>
   				self.window.alert("해당 글을 삭제하였습니다.");
   				location.href="list.jsp";
  		</script>
  			
  			<%
		rs.close();
		stmt.close();
		conn.close();
		
		 } else { 
%>
			<script language=javascript>
			 self.window.alert("비밀번호를 틀렸습니다.");
				location.href="javascript:history.back()";
			</script>

		<% 
		 }
	}catch(SQLException e) {
		out.println( e.toString() );
		}


 %>
	
