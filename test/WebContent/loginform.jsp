<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
 String id;
 if(session.getAttribute("id")!=null){
  id = "���ǰ� ����";
 }else{
  id = "���ǰ� ����";
 }
%>
<h1>�α���</h1>
<form action="logindb.jsp" method="post">
���̵�: <input type="text" name="id"><br>
�н�����: <input type="password" name="passwd"><br>
<input type="submit" value="�α���">
<input type="button" value="�α׾ƿ�" onclick="location.href='3.jsp'">
<input type="button" value="������" onclick="location.href='management.jsp'">
</form>
<%=id %>
</body>
</html>