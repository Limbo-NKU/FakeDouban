<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/header_min.jsp"%>
<link rel="stylesheet" type="text/css" href="../css/login.css" />
<script src="../js/register.js" type="text/javascript" charset="utf-8"></script>
<div class="register-box">
		<br />
		<h1 style="font-size: 48;font-weight: 900; text-align: center;">用  户  注  册</h1>

		<ul>
			<form id="registerForm" action="">
			<li>
				<label for="username">用户名：</label>
				<input id="username" type="text" name="username" />
			</li>
			<br />
			<li>
				<label for="password">密码：</label>
				<input id="password" type="password" name="password" />
			</li>
			<br />
			<li>
				<label for="rpassword">确认密码：</label>
				<input id="rpassword" type="password" name="rpassword" />
			</li>
			<br />
			<li>
				<label for="gender">性别：</label>
				<select name="gender">
					<option value="保密" selected="selected">保密</option>
					<option value="男">男</option>
					<option value="女">女</option>
				</select>
			</li>
			<br />
			<li>
				<label for="age">年龄：</label>
				<input type="number" name="age" value="0" />
			</li>
			<br />
			
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
				<input type="text" name="description" />
			</li>
			<br />
					<!--<input type="submit" class="button" value="提交" />-->
					<button class="button" id="submitbtn">提交</button>
					<button class="button" onclick="javascript:history.go(-1)" >后退</button>

			<!--<ul clas="button-list">
				<li>
					<input type="submit" class="button" value="提交" />
				</li>
			</form>
				<br />
				<li>
					<button class="button" onclick="javascript:history.go(-1)" >后退</button>
				</li>

			</ul>-->
			
		</ul>
</div>

<%@include file="common/footer.jsp" %>