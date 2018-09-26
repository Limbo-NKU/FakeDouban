<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">

	<head>
		<title>Home</title>
		<!-- for-mobile-apps -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="" />
		<script type="application/x-javascript">
			addEventListener("load", function() {
				setTimeout(hideURLbar, 0);
			}, false);

			function hideURLbar() {
				window.scrollTo(0, 1);
			}
		</script>
		<!-- //for-mobile-apps -->
		<link href="/FakeDouban/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
		<link href="/FakeDouban/css/style.css" rel="stylesheet" type="text/css" media="all" />
		<link rel="stylesheet" href="/FakeDouban/css/contactstyle.css" type="text/css" media="all" />
		<link rel="stylesheet" href="/FakeDouban/css/faqstyle.css" type="text/css" media="all" />
		<link href="/FakeDouban/css/single.css" rel='stylesheet' type='text/css' />
		<link href="/FakeDouban/css/medile.css" rel='stylesheet' type='text/css' />
		<!-- banner-slider -->
		<link href="/FakeDouban/css/jquery.slidey.min.css" rel="stylesheet">
		<!-- //banner-slider -->
		<!-- pop-up -->
		<link href="/FakeDouban/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
		<!-- //pop-up -->
		<!-- font-awesome icons -->
		<link rel="stylesheet" href="/FakeDouban/css/font-awesome.min.css" />
		<!-- //font-awesome icons -->
		<!-- js -->
		<!-- 		<script type="text/javascript" src="/FakeDouban/js/jquery-2.1.4.min.js"></script>
		
		 -->
		<script type="text/javascript" src="/FakeDouban/js/jquery-3.3.1.js"></script>
		
		<!-- //js -->
		<!-- banner-bottom-plugin -->
		<link href="/FakeDouban/css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
		<script src="/FakeDouban/js/owl.carousel.js"></script>
		<script>
			$(document).ready(function() {
				$(".owl-demo").owlCarousel({

					autoPlay: 3000, //Set AutoPlay to 3 seconds

					items: 5,
					itemsDesktop: [640, 4],
					itemsDesktopSmall: [414, 3]

				});

			});
		</script>
		<!-- //banner-bottom-plugin -->
		<!---<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>--->
		<!-- start-smoth-scrolling -->
		<script type="text/javascript" src="/FakeDouban/js/move-top.js"></script>
		<script type="text/javascript" src="/FakeDouban/js/easing.js"></script>
		<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event) {
					event.preventDefault();
					$('html,body').animate({
						scrollTop: $(this.hash).offset().top
					}, 1000);
				});
			});
		</script>
		<!-- start-smoth-scrolling -->
		<link rel="stylesheet" type="text/css" href="/FakeDouban/css/site.css"/>
	</head>

	<body>
		<!-- header -->
		<%
			String info=(String)request.getAttribute("status");
			if(info!=null){
				%>
				<script type="text/javascript">
					alert("<%=info%>");
				</script>
				<%
			}
		%>
		<div class="header">
			<div class="container">
				<div class="w3layouts_logo">
					<a href="/FakeDouban/movie/index">
						<h1>Fake<span>Douban</span></h1></a>
				</div>
				<div class="w3_search">
					<form action="/FakeDouban/movie/findmovies" method="post">
						<input type="text" name="moviename" placeholder="搜索电影......" required="">
						<input type="submit" value="搜索">
					</form>
				</div>
				<div class="w3l_sign_in_register">
					<ul class="user-control">
						<!--æ ¹æ®sessionæ¾ç¤ºç»å½æé®æèç¨æ·å-->
						<!--<li>
							<a href="#" data-toggle="modal" data-target="#myModal">Login</a>
						</li>-->
						<%
							if(session.getAttribute("userSession")==null){
								%>
								<li>
									<a href="/FakeDouban/jsp/login.jsp" >登录</a>
								</li>
								<li>
									<a href="/FakeDouban/jsp/register.jsp" >注册</a>
								</li>
								<%
							}else{
								%>
								<li>
									欢迎,<strong>${userSession.userName}</strong>
								</li>
								<li>
									<a href="#" >修改信息</a>
								</li>
								<li>
									<a href="/FakeDouban/logout" >登出</a>
								</li>
								<%
							}
						%>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>