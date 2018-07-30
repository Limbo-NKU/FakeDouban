<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="common/header_min.jsp"%>
<%@page import="cn.edu.nku.cc.FakeDouban.domain.po.User"%>

<link rel="stylesheet" type="text/css" href="/FakeDouban/css/login.css" />
<div class="main modify-box">
	<!--<img class="logo" src="../img/logo.png"/>-->
	<h1 style="font-size: 48;font-weight: 900;">用  户  信  息  修  改</h1>
	<form action="/user/modify" method="post">
		<ul>
			<li>
				<label for="userid">用户id：</label>
				<h4 id="userid">${sessionScope.userSession.id}</h4>
			</li>
			<li>
				<label for="username">用户名：</label>
				<h4 id="username">${sessionScope.userSession.userName}</h4>
			</li>
			<li>
				<label for="age">年龄：</label>
				<input type="number" name="age" id="age" value="${sessionScope.userSession.age}" />
			</li>
			<li>
				<label for="gender">性别：</label>
				<select name="gender" id="gender">
					<option value="保密" selected="selected">保密</option>
					<option value="男">男</option>
					<option value="女">女</option>
				</select>
			</li>
			<li>
				<label for="city">所在地：</label>
				<select name="city">
					<option value="保密" selected="selected">保密</option>
					<option value="天津市内">天津市内</option>
					<option value="中国国内">中国国内</option>
					<option value="地球上">地球上</option>
				</select>
			</li>
			<br />
			<li>
				<label for "job">工作种类：</label>
				<select name="job">
					<option value="保密" selected="selected">保密</option>
					<option value="无业">无业</option>
					<option value="学生">学生</option>
					<option value="稳定工作">稳定工作</option>
				</select>
			</li>
			<br />
			<li>
				<label>自我介绍：</label>
				<input type="text" name="description" value="${sessionScope.userSession.description}" />
			</li>
		</ul>

	</form>
</div>

<%@include file="common/footer.jsp"%>