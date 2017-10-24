<%@page import="java.util.*"%> 
<%@ page contentType="text/html; charset=utf-8"%> 

<% 

request.setCharacterEncoding("euc-kr"); 

%> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%!
String strmaster ="god0631"; 
%>

 <%  
  String id = (String)session.getAttribute("userid");  
   
  if (id == null){%> 
	response.sendRedirect("firstpage.jsp");
      <% 
  }%><% else if (id.equals(strmaster)){%> 
  
  <jsp:include page="managementpage.jsp"></jsp:include>
 
   <%}else if(id != null){%> 
  <jsp:include page="custompage.jsp"></jsp:include>
   <% }%>
       
    <script>
    $(document).ready(function () {
    	  var trigger = $('.hamburger'),
    	      overlay = $('.overlay'),
    	     isClosed = false;

    	    trigger.click(function () {
    	      hamburger_cross();      
    	    });

    	    function hamburger_cross() {

    	      if (isClosed == true) {          
    	        overlay.hide();
    	        trigger.removeClass('is-open');
    	        trigger.addClass('is-closed');
    	        isClosed = false;
    	      } else {   
    	        overlay.show();
    	        trigger.removeClass('is-closed');
    	        trigger.addClass('is-open');
    	        isClosed = true;
    	      }
    	  }
    	  
    	  $('[data-toggle="offcanvas"]').click(function () {
    	        $('#wrapper').toggleClass('toggled');
    	  });  
    	});
    </script>
  
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>