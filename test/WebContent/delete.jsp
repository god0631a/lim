<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*"%>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>전체 도서 목록</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="bootstrap.vertical-tabs.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

</head>
<body>
 <jsp:include page="master/NewFile2.jsp"></jsp:include>
	<div class="container">
		<form action="information.jsp" method="post">


			<div class="col-xs-9">
				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active" id="korea">
						<h1>&nbsp;</h1>
						<h1>도서 삭제</h1>
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
							String query = "SELECT * FROM book_store.book";
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
						<th>선택</th>
						<th>바코드</th>
						<th>책이름</th>
						<th>사진</th>
						<th>가격</th>
					</tr>
							<%
								while (rs.next()) {
							%>
							<tr>
						<td><input type="checkbox" name="checkBoxToDelete"
							value="<%=rs.getString(1)%>"></td>
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getString(2)%></td>
						<td><img src="GetImage?isbn=<%=rs.getString(1)%>" width="150"
							height="200"></td>
						<td><%=rs.getInt(4)%></td>
					</tr>
							<%
								}
							%>
							<input type="submit" value="삭제">
					<button class="btn btn-default" type="button"
						onclick="location.href='managementpage.jsp' ">홈으로</button>
						</table>

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
