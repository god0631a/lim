<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*"%>
<%@ page import="java.text.DecimalFormat"%>
<script>
$(function(){ 
  $('.glyphicon glyphicon-plus').click(function(){ 
    var n = $('.glyphicon glyphicon-plus').index(this);
    var num = $(".num:eq("+n+")").val();
    num = $(".num:eq("+n+")").val(num*1+1); 
  });
  $('.glyphicon glyphicon-minus').click(function(){ 
    var n = $('.glyphicon glyphicon-minus').index(this);
    var num = $(".num:eq("+n+")").val();
    num = $(".num:eq("+n+")").val(num*1-1); 
  });
}) 
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
</head>
<body>
<jsp:include page="master/NewFile.jsp"></jsp:include>
<h1>&nbsp;</h1>
	<%
	
	Class.forName("com.mysql.jdbc.Driver");
	String DB_URL = "jdbc:mysql://localhost:3306/book_store?";
	String DB_USER = "root";
	String DB_PASSWORD = "admin";
	
	String strIsbn = request.getParameter("isbn");

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	try {
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		stmt = conn.createStatement();
		String query = "SELECT * FROM book_store.book WHERE isbn="+strIsbn;
		rs = stmt.executeQuery(query);
		
		while (rs.next()) {
			%>
			<div class="container" id="product-section">
				<div class="row">
					<div class="col-md-5">
					
						<img src="GetImage?isbn=<%=rs.getString(1)%>"
							class="image-responsive" width="300" height="400">
					</div>
					<div class="col-md-7">
						<div class="row">
							<div class="col-md-12">
								<h1><%=rs.getString(2)%></h1>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<span class="label label-primary"><%=rs.getString(9)%></span> 
								<span class="monospaced"><%=rs.getString(1)%></span>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<p class="description">
									<%=rs.getString(8)%>
								</p>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-3">
								<span class="sr-only">Four out of Five Stars</span> <span
									class="glyphicon glyphicon-star" aria-hidden="true"></span> <span
									class="glyphicon glyphicon-star" aria-hidden="true"></span> <span
									class="glyphicon glyphicon-star" aria-hidden="true"></span> <span
									class="glyphicon glyphicon-star" aria-hidden="true"></span> <span
									class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
								<span class="label label-success">61</span>
							</div>
							<div class="col-md-3">
								<span class="monospaced">저자 : <%=rs.getString(5)%></span>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12 bottom-rule">
								<h2 class="product-price"><%=rs.getString(4)%> 원 </h2>
							</div>
						</div>
			
						<div class="row add-to-cart">
					<div class="col-md-7 product-qty">
						<span class="btn btn-default btn-lg btn-qty" value='+'
							onClick='fncAdd("num1",+1);'><span
							class="glyphicon glyphicon-plus" aria-hidden="true"></span> </span> <input
							class="btn btn-default btn-lg btn-qty" id='num1' name='num1'
							value='1' /> <span class="btn btn-default btn-lg btn-qty"
							value='-' onClick='fncAdd("num1",-1);'> <span
							class="glyphicon glyphicon-minus" aria-hidden="true"></span>
						</span>
					</div>
							<div class="col-md-4">
							<input type="button" class="btn btn-lg btn-brand btn-full-width" value="Add to cart" onClick="location.href='basketinput.jsp?isbn=<%=rs.getString(1)%>';">
								
							</div>
						</div>

					</div>
			
		<% 
					}
				
	} catch (SQLException e) {
		System.out.println("Error Source : getEmp1.jsp : SQLException");
		System.out.println("SQLState : " + e.getSQLState());
		System.out.println("Message : " + e.getMessage());
		System.out.println("Oracle Error Code : " + e.getErrorCode());
	}

	%>


			<script src="https://code.jquery.com/jquery-2.2.2.min.js"
				integrity="sha256-36cp2Co+/62rEAAYHLmRCPIych47CvdM+uTBJwSzWjI="
				crossorigin="anonymous"></script>
			<script
				src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
				integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
				crossorigin="anonymous"></script>


</body>
</html>

<script type='text/javascript'>
	//<![CDATA[

	function fncAdd(id, add) {
		var tgt = document.getElementById(id);
		var num = Number(tgt.value) + add;
		if (num > Number(tgt.maxval))
			num = tgt.maxval;
		else if (num < Number(tgt.minval))
			num = tgt.minval;
		tgt.value = num;
	}

	//]]>
</script>