<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*"%>
<%@ page import="java.text.DecimalFormat"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
  <% System.out.println("userid"); %>
 <%!
 String strDBAddMessage = "��� ����";
 String struseid;
 String strpassword;
 String test;
 int flag = 0;
 String strFlag;
 DecimalFormat df = new DecimalFormat("###.##");
 %>

 <%
 	struseid = request.getParameter("userid");
	strpassword = request.getParameter("userpassword");
  	ResultSet rs = null;
 	Connection conn = null;
 	
  try {
   Class.forName("com.mysql.jdbc.Driver").newInstance();
  } catch (Exception ex) {
   System.out.println("mysql jdbc ����̹� �ε� ����");
  }
  try {
   conn = DriverManager
     .getConnection("jdbc:mysql://localhost/book_store?" + "user=root&password=admin");

  } catch (SQLException ex) {
   System.out.println("SQLException: " + ex.getMessage());
   System.out.println("SQLState: " + ex.getSQLState());
   System.out.println("VendorError: " + ex.getErrorCode());
  }
 %>
   <% 
   try {
    String insert = "SELECT * FROM membership where userpassword=?";
    PreparedStatement ps = conn.prepareStatement(insert);
    ps.setString(1,strpassword);
    rs=ps.executeQuery();   
    if(rs.next()) {
        strFlag = rs.getString("userid");
        test = rs.getString("userpassword");
        
       }
   } catch (SQLException ex) {
    System.out.println("SQLException: " + ex.getMessage());
   }
 %>
<% 
if(strFlag.equals(struseid) && test.equals(strpassword)){                                                        // �α��� ������
	 session.setAttribute("userid", strFlag);                // ���ǿ� "id" �̸����� id ���
	 response.sendRedirect("mainpage.jsp");    // �α��� ���� ���������� �̵�
}%><% else{%>                                                     

<script>

alert("�α��� ����");

history.go(-1);                                    // ���� �������� �̵�

</script>
<%} %>

</script>
</body>
</html>


















