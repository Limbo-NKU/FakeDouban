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
		<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="all" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/contactstyle.css" type="text/css" media="all" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/faqstyle.css" type="text/css" media="all" />
		<link href="${pageContext.request.contextPath}/css/single.css" rel='stylesheet' type='text/css' />
		<link href="${pageContext.request.contextPath}/css/medile.css" rel='stylesheet' type='text/css' />
		<!-- banner-slider -->
		<link href="${pageContext.request.contextPath}/css/jquery.slidey.min.css" rel="stylesheet">
		<!-- //banner-slider -->
		<!-- pop-up -->
		<link href="${pageContext.request.contextPath}/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
		<!-- //pop-up -->
		<!-- font-awesome icons -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
		<!-- //font-awesome icons -->
		<!-- js -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
		<!-- //js -->
		<!-- banner-bottom-plugin -->
		<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
		<script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>
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
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/move-top.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/easing.js"></script>
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
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/site.css"/>
	</head>

	<body>
		<!-- header -->
		<div class="header">
			<div class="container">
				<div class="w3layouts_logo">
					<a href="index.html">
						<h1>One<span>Movies</span></h1></a>
				</div>
				<div class="w3_search">
					<form action="${pageContext.request.contextPath}/movie/findMovies.do" method="post">
						<input type="text" name="movieName" placeholder="搜索电影" required="">
						<input type="submit" value="搜索">
					</form>
				</div>
				<div class="w3l_sign_in_register">
					<ul>
						<!--æ ¹æ®sessionæ¾ç¤ºç»å½æé®æèç¨æ·å-->
						<!--<li>
							<a href="#" data-toggle="modal" data-target="#myModal">Login</a>
						</li>-->
						<%
							if(session.getAttribute("userSession")==null){
								%>
								<li>
									<a href="${pageContext.request.contextPath}/jsp/login.jsp" data-toggle="modal" data-target="#myModal">登录</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/jsp/register.jsp" data-toggle="modal" data-target="#myModal">注册</a>
								</li>
								<%
							}else{
								%>
								<li>
									欢迎，<strong>${userSession.userName}</strong>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/jsp/usermodify.jsp" data-toggle="modal" data-target="#myModal">修改信息</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/logout.do" data-toggle="modal" data-target="#myModal">登出</a>
								</li>
								<%
							}
						%>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>