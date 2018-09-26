var userCode = null;
var userPassword = null;
var ruserPassword = null;
var submitBtn = null;

function submitForm(){
	$("#registerForm").submit();
}

$(function () {
	userCode = $("#username");
	userPassword = $("#password");
	ruserPassword = $("#rpassword");
	submitBtn = $("#submitbtn");
	//初始化的时候，要把所有的提示信息变为：* 以提示必填项，更灵活，不要写在页面上
	userCode.next().html("*");
	userPassword.next().html("*");
	ruserPassword.next().html("*");





	/*
	 * 验证
	 * 失焦\获焦
	 * jquery的方法传递
	 */
	userCode.bind("blur", function () {
		//ajax后台验证--userCode是否已存在
		//user.do?method=ucexist&userCode=**
		$.ajax({
			type: "GET",//请求类型
			url:  "/FakeDouban/user/checkuser",//请求的url
			data: { username: userCode.val() },//请求参数
			dataType: "json",//ajax接口（请求url）返回的数据类型
			success: function (data) {//data：返回数据（json对象）
				$.remove("#username h4");
				if (data.status == "exist") {//账号已存在，错误提示
//					validateTip(userCode.next(), { "color": "red" }, imgNo + " 该用户账号已存在", false);
					userCode.append("<h4 >该用户已存在，请重试</h4>")
				} else {//账号可用，正确提示
//					validateTip(userCode.next(), { "color": "green" }, imgYes + " 该账号可以使用", true);
					userCode.append("<h4 >该用户名可用</h4>")
				}
			},
			error: function (data) {//当访问时候，404，500 等非200的错误状态码
//				validateTip(userCode.next(), { "color": "red" }, imgNo + " 您访问的页面不存在", false);
				$.remove("#username h4");
				userCode.append("<h4 >请求出错，请重试</h4>")
			}
		});


		userPassword.bind("focus", function () {
			validateTip(userPassword.next(), { "color": "#666666" }, "* 密码长度必须是大于6小于20", false);
		}).bind("blur", function () {
			$.remove("#username h4");
			if (userPassword.val() != null && userPassword.val().length > 6
				&& userPassword.val().length < 20) {
				
			} else {
				userPassword.append("<h4>密码长度必须是大于6小于20</h4>")
			}
		});

		ruserPassword.bind("focus", function () {
			validateTip(ruserPassword.next(), { "color": "#666666" }, "* 请输入与上面一只的密码", false);
		}).bind("blur", function () {
			if (ruserPassword.val() != null && ruserPassword.val().length > 6
				&& ruserPassword.val().length < 20 && userPassword.val() == ruserPassword.val()) {
				validateTip(ruserPassword.next(), { "color": "green" }, imgYes, true);
			} else {
				validateTip(ruserPassword.next(), { "color": "red" }, imgNo + " 两次密码输入不一致，请重新输入", false);
			}
		});


		submitBtn.bind("click", function () {
			if (userCode.attr("validateStatus") != "true") {
				userCode.blur();

			} else if (userPassword.attr("validateStatus") != "true") {
				userPassword.blur();
			} else if (ruserPassword.attr("validateStatus") != "true") {
				ruserPassword.blur();

			} else {
				if (confirm("是否确认提交数据")) {
					$("#registerForm").submit();
				}
			}
		});
	})
})	
