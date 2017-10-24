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
						<h1>도서 검색</h1>
						<h1>&nbsp;</h1>
						
						<form class="form-horizontal"  action="selectDB.jsp" method="post" enctype="multipart/form-data" >
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="isbn">ISBN:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="isbn"
						maxlength="7" placeholder="고유번호입력" required name="isbn" pattern="[0-9]{7}" title="13자리 숫자를 입력해주세요">
					<div class="help-block with-errors"></div>
				</div>
			</div>
							
							<input type="submit" value="검색">
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
