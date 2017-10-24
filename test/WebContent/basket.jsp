<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*"%>
<%@ page import="java.text.DecimalFormat"%>
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



	<div class="container">
		<form action="information.jsp" method="post">


			<div class="col-xs-9">
				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active" id="korea">
						<h1>��ٱ���</h1>
						<hr class="one">
						
						<%
						Class.forName("com.mysql.jdbc.Driver");
						String DB_URL = "jdbc:mysql://localhost:3306/book_store?";
						String DB_USER = "root";
						String DB_PASSWORD = "admin";

						Connection conn = null;
						Statement stmt = null;
						ResultSet rs = null;

						try {
							conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
							stmt = conn.createStatement();
							String query = "SELECT * FROM basckt INNER JOIN book ON basckt.isbn = book.isbn;";
							rs = stmt.executeQuery(query);

						} catch (SQLException e) {
							System.out.println("Error Source : getEmp1.jsp : SQLException");
							System.out.println("SQLState : " + e.getSQLState());
							System.out.println("Message : " + e.getMessage());
							System.out.println("Oracle Error Code : " + e.getErrorCode());
						}
					%>
						<table class="table">

		<tr>
			<th>��ǰ ����</th>
			<th>����</th>
			<th>���� �ݾ�</th>
			<th>��ۺ�</th>
			<th>�ֹ� �ݾ�</th>
		</tr>
		<%
		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(3)%></td>
			<td>0</td>
			<td>2500</td>
			<td><%=rs.getString(8)%></td>
			<td><a href="bookinfo.jsp?isbn=<%=rs.getString(1)%>">����</a>&nbsp;&nbsp;<a href="delete_ba.jsp?isbn=<%=rs.getString(1)%>">����</a></td>
		</tr>
		<%
		}
		%>

					</div>


					<div class="clearfix"></div>
				</div>



			</div>
		</form>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
