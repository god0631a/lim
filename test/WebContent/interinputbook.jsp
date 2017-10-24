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
		<h2>���� ���</h2>

		<form class="form-horizontal"  action="bookinput" method="post" enctype="multipart/form-data" >
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="isbn">ISBN:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="isbn"
						maxlength="7" placeholder="������ȣ�Է�" required name="isbn" pattern="[0-9]{7}" title="13�ڸ� ���ڸ� �Է����ּ���">
					<div class="help-block with-errors"></div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="title">å ����:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" style="ime-mode: active;"
						id="title" placeholder="���� �Է�" name="title">
				</div>
			</div>

			<div class=form-group>
				<label class="control-label col-sm-2" for="image">å ����:</label>
				<div class="col-sm-4">
					<input type="file" class="form-control" id="image"
						name="image">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="price">å����:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" style="ime-mode: active;"
						id="price" placeholder="���� �Է�" name="price">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="publisher">���ǻ� :</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" style="ime-mode: active;"
						id="publisher" placeholder="���ǻ� �Է�" name="publisher">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="day1">���� ��:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control datepicker1" id="datepicker1"
						placeholder="���� �� " name="datepicker1">
				</div>
			</div>


			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-4">
					<button type="submit" 
						class="btn btn-primary glyphicon glyphicon-check"> �� ��</button>
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
    prevText: '���� ��',
    nextText: '���� ��',
    monthNames: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
    monthNamesShort: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
    dayNames: ['��','��','ȭ','��','��','��','��'],
    dayNamesShort: ['��','��','ȭ','��','��','��','��'],
    dayNamesMin: ['��','��','ȭ','��','��','��','��'],
    showMonthAfterYear: true,
    changeMonth: true,
    changeYear: true,
    yearSuffix: '��'
  });
});
</script>


</body>
</html>