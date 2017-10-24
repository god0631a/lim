<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
</head>
<body>

<jsp:include page="master/NewFile2.jsp"></jsp:include>
<h1>&nbsp;</h1>
<%String id = (String)session.getAttribute("userid"); %>
	<div class="container">
		<h2>도서 등록</h2>

		<form class="form-horizontal"  action="bookinput" method="post" enctype="multipart/form-data" >
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="isbn">ISBN:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="isbn"
						maxlength="7" placeholder="고유번호입력" required name="isbn" pattern="[0-9]{7}" title="13자리 숫자를 입력해주세요">
					<div class="help-block with-errors"></div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="title">책 제목:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" style="ime-mode: active;"
						id="title" placeholder="제목 입력" name="title">
				</div>
			</div>

			<div class=form-group>
				<label class="control-label col-sm-2" for="image">책 사진:</label>
				<div class="col-sm-4">
					<input type="file" class="form-control" id="image"
						name="image">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="price">책가격:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" style="ime-mode: active;"
						id="price" placeholder="가격 입력" name="price">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="publisher">출판사 :</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" style="ime-mode: active;"
						id="publisher" placeholder="출판사 입력" name="publisher">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="day1">출판 일:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control datepicker1" id="datepicker1"
						placeholder="출판 일 " name="datepicker1">
				</div>
			</div>


			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-4">
					<button type="submit" 
						class="btn btn-primary glyphicon glyphicon-check"> 등 록</button>
				</div>
			</div>
			
		</form>
	</div>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
$(function() {
  $( "#datepicker1" ).datepicker({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    showMonthAfterYear: true,
    changeMonth: true,
    changeYear: true,
    yearSuffix: '년'
  });
});
</script>


</body>
</html>