<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="common/header_min.jsp" %>
		<link rel="stylesheet" type="text/css" href="/FakeDouban/css/login.css"/>
		<div class="main login-box">
			<!--<img class="logo" src="../img/logo.png"/>-->
			<h1 style="font-size: 48;font-weight: 900;">管理员登陆</h1>
			<form action="/FakeDouban/admin/login" method="post">
				<ul id="login-list">
				<li style="color: red;font-size: small;">${requestScope.status }</li>
				<br />
					<li><input type="text" name="username" id="username" placeholder="用户名" value="" /></li>
				<br/>
					<li><input type="password" name="password" id="password" placeholder="密码" value="" /></li>
				<br/>
					<li><input type="submit" class="button" value="登  录" /></li>
				</ul>

			</form>
		</div>
		<footer>

		</footer>
<%@include file="common/footer.jsp"%>
