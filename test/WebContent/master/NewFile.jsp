<%@page import="java.util.*"%> 

<%@ page contentType="text/html; charset=utf-8"%> 

<% 

request.setCharacterEncoding("euc-kr"); 

%> 

<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%
Class.forName("com.mysql.jdbc.Driver");
String DB_URL = "jdbc:mysql://localhost:3306/book_store?";
String DB_USER = "root";
String DB_PASSWORD = "admin";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
int total=0;
try {
	conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	stmt = conn.createStatement();
	String query = "SELECT COUNT(*) FROM basckt";
	rs = stmt.executeQuery(query);
	if(rs.next()){
		total = rs.getInt(1);
	}

} catch (SQLException e) {
	System.out.println("Error Source : getEmp1.jsp : SQLException");
	System.out.println("SQLState : " + e.getSQLState());
	System.out.println("Message : " + e.getMessage());
	System.out.println("Oracle Error Code : " + e.getErrorCode());
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

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

<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link href="home.css" rel="stylesheet" type="text/css">

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>

</head>

<body id="page-top" name="page-top" class="active">

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">

    <!-- Navigation -->

     <nav class="navbar navbar-inverse navbar-fixed-top">

   <div class="container-fluid">

    <!-- Brand and toggle get grouped for better mobile display -->

    <div class="navbar-header">

     <a class="nav-btn btn-dark btn-lg accordion-toggle pull-left" title="Follow Us" role="tab" id="social-collapse" data-toggle="collapse" data-parent="#accordion" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>

     <a id="menu-toggle" href="#" class="nav-btn btn-dark btn-lg toggle">

      <i class="fa fa-bars" style="color:#fff;"></i>

     </a>

     <a id="to-top" class="btn btn-lg btn-inverse" href="#top">

      <span class="sr-only">Toggle to Top Navigation</span>

      <i class="fa fa-chevron-up"></i>

     </a>

    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->

                <div class="collapse navbar-collapse js-navbar-collapse">

                  <ul class="nav navbar-nav navbar-left">

                   <a class="navbar-brand" href="custompage.jsp">

                      <img height="20" width="20" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/rhtAAAB+0lEQVR4AcyYg5LkUBhG+1X2PdZGaW3btm3btm3bHttWrPomd1r/2Jn/VJ02TpxcH4CQ/dsuazWgzbIdrm9dZVd4pBz4zx2igTaFHrhvjneVXNHCSqIlFEjiwMyyyOBilRgGSqLNF1jnwNQdIvAt48C3IlBmHCiLQHC2zoHDu6zG1iXn6+y62ScxY9AODO6w0pvAqf23oSE4joOfH6OxfMoRnoGUm+de8wykbFt6wZtA07QwtNOqKh3ZbS3Wzz2F+1c/QJY0UCJ/J3kXWJfv7VhxCRRV1jGw7XI+gcO7rEFFRvdYxydwcPsVsC0bQdKScngt4iUTD4Fy/8p7PoHzRu1DclwmgmiqgUXjD3oTKHbAt869qdJ7l98jNTEblPTkXMwetpvnftA0LLHb4X8kiY9Kx6Q+W7wJtG0HR7fdrtYz+x7iya0vkEtUULIzCjC21wY+W/GYXusRH5kGytWTLxgEEhePPwhKYb7EK3BQuxWwTBuUkd3X8goUn6fMHLyTT+DCsQdAEXNzSMeVPAJHdF2DmH8poCREp3uwm7HsGq9J9q69iuunX6EgrwQVObjpBt8z6rdPfvE8kiiyhsvHnomrQx6BxYUyYiNS8f75H1w4/ISepDZLoDhNJ9cdNUquhRsv+6EP9oNH7Iff2A9g8h8CLt1gH0Qf9NMQAFnO60BJFQe0AAAAAElFTkSuQmCC" class="img-responsive pull-left" alt="Responsive image">book store</a>

                   <li class="dropdown mega-dropdown">

                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">도서 <span class="caret"></span></a>    

                    <ul class="dropdown-menu mega-dropdown-menu">

                     <li class="col-sm-3">

                      <ul>

                       <li class="dropdown-header">Men Collection</li>                            

                                            <div id="menCollection" class="carousel slide" data-ride="carousel">

                                              <div class="carousel-inner">

                                                <div class="item active">

                                                    <a href="#"><img src="http://placehold.it/254x150/ff3546/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 1"></a>

                                                    <h4><small>Summer dress floral prints</small></h4>                                        

                                                    <button class="btn btn-primary" type="button">70,69 €</button> <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Wishlist</button>       

                                                </div><!-- End Item -->

                                                <div class="item">

                                                    <a href="#"><img src="http://placehold.it/254x150/3498db/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 2"></a>

                                                    <h4><small>Gold sandals with shiny touch</small></h4>                                        

                                                    <button class="btn btn-primary" type="button">9,26 €</button> <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Wishlist</button>        

                                                </div><!-- End Item -->

                                                <div class="item">

                                                    <a href="#"><img src="http://placehold.it/254x150/2ecc71/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 3"></a>

                                                    <h4><small>Denin jacket stamped</small></h4>                                        

                                                    <button class="btn btn-primary" type="button">45,22 €</button> <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Wishlist</button>      

                                                </div><!-- End Item -->                                

                                              </div><!-- End Carousel Inner -->

                                              <!-- Controls -->

                                              <a class="left carousel-control" href="#menCollection" role="button" data-slide="prev">

                                                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>

                                                <span class="sr-only">Previous</span>

                                              </a>

                                              <a class="right carousel-control" href="#menCollection" role="button" data-slide="next">

                                                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>

                                                <span class="sr-only">Next</span>

                                              </a>

                                            </div><!-- /.carousel -->

                                            <li class="divider"></li>

                                            <li><a href="#">View all Collection <span class="glyphicon glyphicon-chevron-right pull-right"></span></a></li>

                      </ul>

                     </li>

                     <li class="col-sm-3">

                      <ul>

                       <li class="dropdown-header">국내 도서</li>

                       <li><a href="menu.jsp">소설책</a></li>

                       <li><a href="#">개발 중 입니다.</a></li>

                       <li><a href="#">개발 중 입니다.</a></li>

                       <li><a href="#">개발 중 입니다.</a></li>

                       <li class="divider"></li>

                       <li class="dropdown-header">외국 도서</li>

                       <li><a href="#">개발 중 입니다.</a></li>

                       <li><a href="#">개발 중 입니다.</a></li>

                      </ul>

                     </li>

                     <li class="col-sm-3">

                      <ul>

                       <li class="dropdown-header">유아 도서</li>

                       <li><a href="#">개발 중 입니다.</a></li>

                       <li><a href="#">개발 중 입니다.</a></li>

                       <li><a href="#">개발 중 입니다.</a></li>                            

                      </ul>

                     </li>

                     <li class="col-sm-3">

                      <ul>

                       <li class="dropdown-header">기타 서적</li>

                       <li><a href="#">개발 중 입니다.</a></li>

                       <li><a href="#">개발 중 입니다.</a></li>

                       <li><a href="#">개발 중 입니다.</a></li>

                       <li><a href="#">개발 중 입니다.</a></li>                         

                      </ul>

                     </li>

                    </ul>    

                   </li>

                            <li class="dropdown mega-dropdown">

                       <a href="#" class="dropdown-toggle" data-toggle="dropdown">마이 페이지 <span class="caret"></span></a>    

                    <ul class="dropdown-menu mega-dropdown-menu">

                     <li class="col-sm-3">

                         <ul>

                        <li class="dropdown-header">개인 정보</li>

                       <li><a href="list.jsp">고객 센터</a></li>

                       <li><a href="basket.jsp">장바구니</a></li>

                       <li><a href="view.jsp">나의 글 관리</a></li>

                       <li class="divider"></li>

                       <li class="dropdown-header">이벤트</li>

                       <li><a href="#">쿠폰 현황</a></li>

                       <li><a href="#">실시간 이벤트</a></li>

                      </ul>

                     </li>

                     <li class="col-sm-3">

                      <ul>

                       <li class="dropdown-header">등급</li>

                       <li><a href="#">나의 실적</a></li>

                       <li><a href="#">나의 등급확인</a></li>


                      </ul>

                     </li>

                     <li class="col-sm-3">

                      <ul>

                       <li class="dropdown-header">Gold member</li>

                       <li><a href="#">회사 소개</a></li>

                       <li><a href="#">제휴 안내</a></li>

                       <li><a href="#">채용 정보</a></li>

                       <li><a href="#">찾아 오시는 길</a></li>                         

                      </ul>

                     </li>

                                    <li class="col-sm-3">

                         <ul>

                       <li class="dropdown-header">Women Collection</li>                            

                                            <div id="womenCollection" class="carousel slide" data-ride="carousel">

                                              <div class="carousel-inner">

                                                <div class="item active">

                                                    <a href="#"><img src="http://placehold.it/254x150/3498db/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 1"></a>

                                                    <h4><small>Summer dress floral prints</small></h4>                                        

                                                    <button class="btn btn-primary" type="button">49,99 €</button> <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Wishlist</button>       

                                                </div><!-- End Item -->

                                                <div class="item">

                                                    <a href="#"><img src="http://placehold.it/254x150/ff3546/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 2"></a>

                                                    <h4><small>Gold sandals with shiny touch</small></h4>                                        

                                                    <button class="btn btn-primary" type="button">9,99 €</button> <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Wishlist</button>        

                                                </div><!-- End Item -->

                                                <div class="item">

                                                    <a href="#"><img src="http://placehold.it/254x150/2ecc71/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 3"></a>

                                                    <h4><small>Denin jacket stamped</small></h4>                                        

                                                    <button class="btn btn-primary" type="button">49,99 €</button> <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Wishlist</button>      

                                                </div><!-- End Item -->                                

                                              </div><!-- End Carousel Inner -->

                                              <!-- Controls -->

                                              <a class="left carousel-control" href="#womenCollection" role="button" data-slide="prev">

                                                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>

                                                <span class="sr-only">Previous</span>

                                              </a>

                                              <a class="right carousel-control" href="#womenCollection" role="button" data-slide="next">

                                                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>

                                                <span class="sr-only">Next</span>

                                              </a>

                                            </div><!-- /.carousel -->

                                            <li class="divider"></li>

                                            <li><a href="#">View all Collection <span class="glyphicon glyphicon-chevron-right pull-right"></span></a></li>

                      </ul>

                     </li>

                    </ul>    

                   </li>

                            <li><a href="#">Store locator</a></li>

                  </ul>

                        <ul class="nav navbar-nav navbar-right">

                        <li class="dropdown">

                          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">My account <span class="caret"></span></a>

                          <ul class="dropdown-menu" role="menu">

                            <li><a href="#">Action</a></li>

                            <li><a href="#">Another action</a></li>

                            <li><a href="#">Something else here</a></li>

                            <li class="divider"></li>

                            <li><a href="firstpage.jsp">Log out</a></li>

                          </ul>

                        </li>

                        <li><a href="basket.jsp">My cart (<%=total%>) items</a></li>

                      </ul>

                 </div><!-- /.nav-collapse -->

   </div><!-- /.container-fluid -->

  </nav>

  <nav id="sidebar-wrapper">

   <ul class="sidebar-nav">

    <a id="menu-close" href="#" class="btn btn-danger pull-right hidden-md hidden-lg toggle"><i class="fa fa-times"></i></a>

    <li class="sidebar-brand">

     <a href="#top">Soldier-up <strong>Designs</strong></a>

    </li>

    <li>

     <a href="/" title="Go to Top">Home</a>

    </li>

    <li>

     <a href="/about" title="Go to About Us section">About</a>

    </li>

    <li>

     <a href="/resume" title="Navigate to Jonathan Adcox IT Resume">Resume</a>

    </li>

    <li>

     <a href="/portfolio" title="Navigate to 'Our Services' section">Portfolio</a>

    </li>

    <li>

     <a href="/blog" title="Our Blog">Blog</a>

    </li>

    <li>

     <a data-toggle="modal" data-href="#loginModal" data-target="#loginModal" style="cursor:pointer;"> Hosting</a>

    </li>

   </ul>

  </nav>

  <div class="container">

   <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModal" aria-hidden="true">

    <div class="modal-dialog modal-default">

     <div class="modal-content">

      <div class="modal-header">

       <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

       <h3>Login to Hosting Portal - Control Panel</h3>

      </div>

      <div class="modal-body">

       <article class="container-form center-block">

        <!-- Form Content HERE! -->

        <form method="post" accept-charset="utf-8" autocomplete="off" role="form" class="form-horizontal" action="https://secure.yourwebhosting.com/secureLogin" enctype="application/x-www-form-urlencoded">

         <fieldset>

          <input type='hidden' name='__token_timestamp__' value='1426572610'>

          <input type='hidden' name='__token_val__' value='4d96cad055fac46518825357fcb49390'>

          <input type="hidden" name="destination" value="http://www.yourwebhosting.com/controlpanel/index.bml">

          <!-- Name input-->

          <div class="form-group">

           <label class="sr-only" for="credential_0">Username: </label>

           <div class="col-xs-12">

            <input id="credential_0" name="credential_0" type="text" placeholder="Your Username" class="form-control">

           </div>

          </div>

          <!-- Email input-->

          <div class="form-group">

           <label class="sr-only" for="credential_1">Password: </label>

           <div class="col-xs-12">

            <input id="email" type="password" name="credential_1" value="" placeholder="Your Password" class="form-control">

           </div>

          </div>

          <!-- Form actions -->

          <div class="form-group pull-right">

           <div class="col-md-12 text-right">

            <button type="submit" name="submit" value="Sign In" class="btn btn-lg">Submit</button>

           </div>

          </div>

         </fieldset>

        </form>

       </article>

      </div>

      <div class="modal-footer">

       Login Problems?

       <button type="submit" class="btn btn-dark" data-dismiss="modal" data-href="#collapseTwo" data-toggle="collapse" data-target="#collapseTwo" style="cursor:pointer;">Contact Me</button>

      </div>

     </div>

    </div>

   </div>

  </div>

  <aside id="accordion" class="social text-vertical-center">

   <div class="accordion-social">

    <ul class="panel-collapse collapse in nav nav-stacked" role="tabpanel" aria-labelledby="social-collapse" id="collapseOne">

     <li><a href="https://www.facebook.com/soldierupdesigns" target="_blank"><i class="fa fa-lg fa-facebook"></i></a></li>

     <li><a href="https://twitter.com/soldierupdesign" target="_blank"><i class="fa fa-lg fa-twitter"></i></a></li>

     <li><a href="https://www.plus.google.com/+soldierupdesigns" target="_blank"><i class="fa fa-lg fa-google-plus"></i></a></li>

     <li><a href="https://github.com/blayderunner123" target="_blank"><i class="fa fa-lg fa-github"></i></a></li>

     <li><a href="https://linkedin.com/in/blayderunner123" target="_blank"><i class="fa fa-lg fa-linkedin"></i></a></li>

     <li><a href="skype:live:soldierupdesigns?call"><i class="fa fa-lg fa-skype" target="_blank"></i></a></li>

     <li><a href="http://stackexchange.com/users/4992378/blayderunner123" target="_blank"><i class="fa fa-lg fa-stack-exchange"></i></a></li>

    </ul>

   </div>

  </aside>

        

        
        <script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>

        <script>

      $(document).ready(function(){

    $("[rel='tooltip']").tooltip();

   });

  </script>

  

  

  <script>

  $(document).ready(function()

  {

      /* smooth scrolling for scroll to top */

   $('#to-top').bind('click', function()

   {

    $('body,html').animate({

     scrollTop: 0}, 

     2500);

   });

   //Easing Scroll replace Anchor name in URL and Offset Position

   $(function(){

    $('a[href*=#]:not([href=#])').click(function()

    {

     if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {

      var target = $(this.hash);

      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');

      if (target.length) {

       $('html,body').animate({

        scrollTop: target.offset().top -420

       }, 3500, 'easeOutBounce');

       return false;

      }

     }

    });

   });

  });

  $(document).ready(function(){

      $(".dropdown").hover(            

          function() {

              $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideDown("400");

              $(this).toggleClass('open');        

          },

          function() {

              $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideUp("400");

              $(this).toggleClass('open');       

          }

      );

  });

  /*!

      * Sidebar.js - Bootstrap Sidebar Hover Event toggle attribute

   * onHover

   

   * Version: v2.5.8

   * LGPL v3 LICENSE INFO

   * This file is part of a Sidebar Bootstrap Element. Copyright

   * 2015 Soldier-up Designs - Website Development Company.

   * sidebar.js is a free software: you can redistribute it and/or modify

   * it under the terms of the GNU Lesser General Public License as published by

   * the Free Software Foundation, either version 3 of the License, or

   * (at your option) any later version.

   * sidebar.js is distributed as a free tool that can help you

   * add a few extra dynamics to your Web Design code. However,

   * this code and any associated code "IS" "WITHOUT ANY WARRANTY";

   * without even the implied warranty of "MERCHANTABILITY" or

   * "FITNESS FOR A PARTICULAR PURPOSE".  See the GNU Lesser

   * General Public License for more details.

  */

  /*! 

   ======================= Notes ===============================

   * Used to close Sidebar on jQuery Element "Mouseleave" Event 

   * This was a pain in the Ass to create 

   * and to not break the rest of the jQuery 

   * and Bootstrap API Script ()Did that once or twice in

   - Development)

   ========== END Crude Vocabulary (...and notes) ==============

  */

  /*! 

   ================= ^ Ranting Stops Here ^ ====================

   ==================== Code Starts Below ======================

  */

  $(document).ready(function()

  {

   

   // Closes the sidebar menu on menu-close button click event

   $("#menu-close").click(function(e)       //declare the element event ...'(e)' = event (shorthand)

   {

                  // - will not work otherwise")

    $("#sidebar-wrapper").toggleClass("active");   //instead on click event toggle active CSS element

    e.preventDefault();          //prevent the default action ("Do not remove as the code

    

    /*!

    ======================= Notes ===============================

    * see: .sidebar-wrapper.active in: style.css

    ==================== END Notes ==============================

    */

   });               //Close 'function()'

   // Open the Sidebar-wrapper on Hover

   $("#menu-toggle").hover(function(e)       //declare the element event ...'(e)' = event (shorthand)

   {

    $("#sidebar-wrapper").toggleClass("active",true);  //instead on click event toggle active CSS element

    e.preventDefault();          //prevent the default action ("Do not remove as the code

   });

   $("#menu-toggle").bind('click',function(e)     //declare the element event ...'(e)' = event (shorthand)

   {

    $("#sidebar-wrapper").toggleClass("active",true);  //instead on click event toggle active CSS element

    e.preventDefault();          //prevent the default action ("Do not remove as the code

   });               //Close 'function()'

   $('#sidebar-wrapper').mouseleave(function(e)    //declare the jQuery: mouseleave() event 

                  // - see: ('//api.jquery.com/mouseleave/' for details)

   {

    /*! .toggleClass( className, state ) */

    $('#sidebar-wrapper').toggleClass('active',false);  /* toggleClass: Add or remove one or more classes from each element

                  in the set of matched elements, depending on either the class's

                  presence or the value of the state argument */

    e.stopPropagation();         //Prevents the event from bubbling up the DOM tree

                  // - see: ('//api.jquery.com/event.stopPropagation/' for details)

                  

    e.preventDefault();          // Prevent the default action of the event will not be triggered

                  // - see: ('//api.jquery.com/event.preventDefault/' for details)

   });

  });

  // Closes the sidebar menu on menu-close button click event

  $("#menu-close").click(function(e)       //declare the element event ...'(e)' = event (shorthand)

  {

                 // - will not work otherwise")

   $("#sidebar-wrapper").toggleClass("active");   //instead on click event toggle active CSS element

   e.preventDefault();          //prevent the default action ("Do not remove as the code

   

   /*!

   ======================= Notes ===============================

   * see: .sidebar-wrapper.active in: style.css

   ==================== END Notes ==============================

   */

  });  

  </script>

</body>

</html> 
