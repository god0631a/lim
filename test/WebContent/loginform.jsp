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
  id = "세션값 있음";
 }else{
  id = "세션값 없음";
 }
%>
<h1>로그인</h1>
<form action="logindb.jsp" method="post">
아이디: <input type="text" name="id"><br>
패스워드: <input type="password" name="passwd"><br>
<input type="submit" value="로그인">
<input type="button" value="로그아웃" onclick="location.href='3.jsp'">
<input type="button" value="관리자" onclick="location.href='management.jsp'">
</form>
<%=id %>
</body>
</html>