<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cn.edu.nku.cc.FakeDouban.domain.po.*"%>
<%@page import="java.util.*"%>
<!doctype html>
<html lang="ch">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="description" content="">
		<meta name="keywords" content=" ">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<title>非豆瓣——管理后台</title>
		<script src="/FakeDouban/js/AD-jquery.min.js"></script>
		<script src="/FakeDouban/js/AD-bootstrap.min.js"></script>
		<script type="text/javascript">
			var moviecollection = [
				["国内", "国外"],
				["Action", "Adventure", "Animation", "Children's", "Comedy",
					"Crime", "Documentary", "Drama", "Fantasy", "Film-Noir",
					"Horror", "Musical", "Mystery", "Romance", "Sci-Fi",
					"Thriller", "War", "Western"
				]
			]

			function changeSelect() {
				var movietypesel = document.getElementById("movietype");
				var moviecollectionsel = document.getElementById("moviecollection");
				clearSelect(moviecollectionsel);

				var index = movietypesel.selectedIndex;
				for(var i = 0; i < moviecollection[index].length; i++) {
					moviecollectionsel.options[i] = new Option(
						moviecollection[index][i]);
					moviecollectionsel.options[i].value = i + 1;
				}
			}

			function clearSelect(select) { //清空列表框中的信息
				while(select.length > 0) {
					select.options[0] = null; //将列表框中的第一项删除
				}
			}
		</script>
		<script type="text/javascript">
			var usercollection = [
				["男", "女"],
				["0-10", "10-20", "20-30", "30-40", "40-50", "50以上"],
				["南方", "北方"],
				["学生", "稳定收入者", "待业"]
			]

			function changeSelect1() {
				var usertypesel = document.getElementById("usertype1");
				var usercollectionsel = document.getElementById("usercollection1");
				clearSelect(usercollectionsel);

				var index = usertypesel.selectedIndex;
				for(var i = 0; i < usercollection[index].length; i++) {
					usercollectionsel.options[i] = new Option(usercollection[index][i]);
					usercollectionsel.options[i].value = i + 1;
				}
			}

			function clearSelect(select) { //清空列表框中的信息
				while(select.length > 0) {
					select.options[0] = null; //将列表框中的第一项删除
				}
			}
		</script>
		<script type="text/javascript" src="/FakeDouban/js/jquery-3.3.1.js"></script>
		<%
			String info=(String)request.getAttribute("status");
			if(info!=null){
				%>
				<script type="text/javascript">
					alert("<%=info%>");
				</script>
				<%
			}
			if(request.getAttribute("users")==null||request.getAttribute("movies")==null){
				%>
				<script type="text/javascript">
					$().ready(function(){
					window.location.href="/FakeDouban/admin";
					});
				</script>
				<%
			}
		%>
		<style>
			.changestyle {
				color: red;
				font-weight: 600;
			}
		</style>
		<script type="text/javascript">
			function txtSerach() {
				//遍历移除b标签，防止第二次搜索bug
				$(".changestyle").each(function() {
					var xx = $(this).html();
					$(this).replaceWith(xx);
				});
				var str = $("#tablebodyid").html();
				var txt = $("#inputN").val();
				if($.trim(txt) != "") {
					var re = "<b class='changestyle'>" + txt + "</b>";
					//替换搜索相关的所有内容
					var nn = str.replace(new RegExp(txt, "gm"), re);
					$("#tablebodyid").html(nn);
					//显示搜索内容相关的div
					$("#rowId").hide().filter(":contains('" + txt + "')").show();
				} else {
					$("#rowId").show();
					alert("cuowu");
				}
			}
		</script>
		<script>
			$(function() {
				$(".meun-item").click(function() {
					$(".meun-item").removeClass("meun-item-active");
					$(this).addClass("meun-item-active");
					var itmeObj = $(".meun-item").find("img");
					itmeObj.each(function() {
						var items = $(this).attr("src");
						items = items.replace("_grey.png", ".png");
						items = items.replace(".png", "_grey.png")
						$(this).attr("src", items);
					});
					var attrObj = $(this).find("img").attr("src");;
					attrObj = attrObj.replace("_grey.png", ".png");
					$(this).find("img").attr("src", attrObj);
				});
				$("#topAD").click(function() {
					$("#topA").toggleClass(" glyphicon-triangle-right");
					$("#topA").toggleClass(" glyphicon-triangle-bottom");
				});
				$("#topBD").click(function() {
					$("#topB").toggleClass(" glyphicon-triangle-right");
					$("#topB").toggleClass(" glyphicon-triangle-bottom");
				});
				$("#topCD").click(function() {
					$("#topC").toggleClass(" glyphicon-triangle-right");
					$("#topC").toggleClass(" glyphicon-triangle-bottom");
				});
				$(".toggle-btn").click(function() {
					$("#leftMeun").toggleClass("show");
					$("#rightContent").toggleClass("pd0px");
				})
			})
		</script>
		<!--[if lt IE 9]>
  <script src="/FakeDouban/js/html5shiv.min.js"></script>
  <script src="/FakeDouban/js/respond.min.js"></script>
<![endif]-->
		<link href="/FakeDouban/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="/FakeDouban/css/common.css" />
		<link rel="stylesheet" type="text/css" href="/FakeDouban/css/slide.css" />
		<link rel="stylesheet" type="text/css" href="/FakeDouban/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/FakeDouban/css/flat-ui.min.css" />
		<link rel="stylesheet" type="text/css" href="/FakeDouban/css/jquery.nouislider.css">
	</head>

	<body>
		<div id="wrap">
			<!-- 左侧菜单栏目块 -->
			<div class="leftMeun" id="leftMeun">
				<div id="logoDiv">
					<p id="logoP">
						<img id="logo" alt="左右结构项目" src="/FakeDouban/images/logo.png"><span>后台管理系统</span>
					</p>
				</div>
				<div id="personInfor">
				<%if(session.getAttribute("adminSession")==null)
					response.sendRedirect("/FakeDouban/admin");
					%>
				
					<p id="userName">${sessionScope.adminSession.adminName}</p>
					<!--                    <p><span>yangxp@qq.com</span> More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>-->
					<p>
						<a href="/FakeDouban/admin/logout">退出登录</a>
					</p>
				</div>
				<div class="meun-title">账号管理</div>
				<!--<div class="meun-item" href="#movie" aria-controls="movie" role="tab" data-toggle="tab"><img src="/FakeDouban/images/icon_change_grey.png">电影管理</div>-->
				<!--<div class="meun-item" href="#char" aria-controls="char" role="tab"
				data-toggle="tab">
				<img src="/FakeDouban/images/icon_chara_grey.png">权限管理
			</div>  -->

				<div class="meun-item" href="#user" aria-controls="user" role="tab" data-toggle="tab">
					<img src="/FakeDouban/images/icon_user_grey.png">用户管理
				</div>
				<div class="meun-item" href="#chan" aria-controls="chan" role="tab" data-toggle="tab">
					<img src="/FakeDouban/images/icon_change_grey.png">修改密码
				</div>
				<div class="meun-title">电影管理</div>
				<div class="meun-item" href="#movie" aria-controls="movie" role="tab" data-toggle="tab">
					<img src="/FakeDouban/images/icon_change_grey.png">电影管理
				</div>
				<div class="meun-item" href="#advice" aria-controls="advice" role="tab" data-toggle="tab">
					<img src="/FakeDouban/images/icon_change_grey.png">首页推荐
				</div>
				<div class="meun-item" href="#movieInsert" aria-controls="movieInsert" role="tab" data-toggle="tab">
					<img src="/FakeDouban/images/icon_change_grey.png">新增电影
				</div>
				<div class="meun-title">数据统计</div>
				<div class="meun-item" href="#getuser" aria-controls="getuser" role="tab" data-toggle="tab">
					<img src="/FakeDouban/images/icon_chara_grey.png">用户统计
				</div>
				<div class="meun-item" href="#getmovie" aria-controls="getmovie" role="tab" data-toggle="tab">
					<img src="/FakeDouban/images/icon_user_grey.png">电影统计
				</div>
			</div>
			<!-- 右侧具体内容栏目 -->
			<div id="rightContent">
				<a class="toggle-btn" id="nimei"> <i class="glyphicon glyphicon-align-justify"></i>
				</a>
				<!-- Tab panes -->
				<div class="tab-content">
					<!-- 资源管理模块 -->
					<div role="tabpanel" class="tab-pane active" id="sour"></div>

					<!--
                    	作者：offline
                    	时间：2018-08-02
                    	描述：电影插入模块
                    -->
					<div role="tabpanel" class="tab-pane" id="movieInsert" style="background-color:;">
						<div class="check-div form-inline" style="background-color:;">
						</div>
						<div class="data-div" style="padding: 50px; margin-top: 50px; background-color: #fff; width: 600px; margin: 50px auto;">
							<h4>插入新电影</h4>
							<hr />
							<form action="/FakeDouban/movie/insertmovie" method="post" id="movieInsert" name="movieInsert">
								<!--<form action="javascript:alert($("#updateDate"));">-->
								电影名称：<input type="text" name="movieName" id="movieName" style="margin-bottom: 30px;" />
								<br /> 电影类型：
								<input type="text" name="movieType" id="movieType" style="margin-bottom: 30px;" />
								<br /> 电影地区：
								<!--<input type="text" name="movieRegion" id="movieRegion" style="margin-bottom: 30px;" />-->
								<select name="movieRegion" id="movieRegion" style="margin-bottom: 30px;">
									<option value="国内">国内</option>
									<option value="国外">国外</option>
								</select>
								<br /> 电影票房：
								<input type="text" name="moviePrice" id="moviePrice" style="margin-bottom: 30px;" />万
								<br /> 电影标签：
								<!--<input type="text" name="tags" id="tags" style="margin-bottom: 30px;" />-->
								<label><input type="checkbox" name="tags" value="1" />Action</label>
								<label><input type="checkbox" name="tags" value="2" />Adventure</label>
								<label><input type="checkbox" name="tags" value="3" />Animation</label>
								<label><input type="checkbox" name="tags" value="4" />Children's</label>
								<label><input type="checkbox" name="tags" value="5" />Comedy</label>
								<label><input type="checkbox" name="tags" value="6" />Crime</label>
								<label><input type="checkbox" name="tags" value="7" />Documentary</label>
								<label><input type="checkbox" name="tags" value="8" />Drama</label>
								<label><input type="checkbox" name="tags" value="9" />Fantasy</label>
								<label><input type="checkbox" name="tags" value="10" />Film-Noir</label>
								<label><input type="checkbox" name="tags" value="11" />Horror</label>
								<label><input type="checkbox" name="tags" value="12" />Musical</label>
								<label><input type="checkbox" name="tags" value="13" />Mystery</label>
								<label><input type="checkbox" name="tags" value="14" />Romance</label>
								<label><input type="checkbox" name="tags" value="15" />Sci-Fi</label>
								<label><input type="checkbox" name="tags" value="16" />Thriller</label>
								<label><input type="checkbox" name="tags" value="17" />War</label>
								<label><input type="checkbox" name="tags" value="18" />Western</label>
								<br /> 上映时间：
								<input type="date" name="updateDate" id="updateDate" style="margin-bottom: 30px;" />
								<br />
								<input type="submit" name="submit" value="点击插入" style="margin-left: 40px;" />
								<input type="reset" name="reset" value="点击重置" style="margin-left: 40px;" />
							</form>
						</div>
					</div>
					<!--首页推荐 -->
					<div role="tabpanel" class="tab-pane" id="advice">
						<div class="check-div form-inline"></div>
						<div class="data-div" style="padding: 50px; margin-top: 50px; background-color: #fff; width: 600px; margin: 50px auto;">
							<h4>设置首页推荐</h4>
							<hr />
							<form action="/FakeDouban/movie/recmovie/insert" method="post" id="advice" name="advice">
								电影编号：<input type="text" name="movieid" id="movieid" style="margin-bottom: 30px;" />
								<br />
								 推荐类型：
								 <!--<input type="text" name="recommendtype" id="recommendtype" style="margin-bottom: 30px;" />-->
								 <select name="recommendtype" id="recommendtype" style="margin-bottom: 30px;">
								 	<option value="1">热门电影</option>
								 	<option value="2">最新电影</option>
								 </select>
								 <br /> 
								 <span style="float: left;">推荐理由：</span>
								<textarea id="reason" name="reason" style="height: 50px; margin-bottom: 30px; vertical-align: bottom;"> 
								</textarea>
								<br /> 
								<input type="submit" name="submit" value="提交" style="margin-left: 40px;" /> 
								<input type="reset" name="reset" value="重置" style="margin-left: 40px;" />
							</form>
						</div>
					</div>
					<!-- 电影统计模块 -->
					<div role="tabpanel" class="tab-pane" id="getmovie">
						<div class="check-div form-inline"></div>
						<div class="index" style="height: 200px; margin-left: 18%; margin-right: 18%; margin-top: 5%;" id="mainleft1">
							<span style="font-size: 18px; margin-bottom: 20px;">请选择相关变量</span>
							<span></span>
							<form action="">
								用户分类依据：
								<select id="usertype1" onchange="changeSelect1();refreshECharts1();" style="margin-bottom: 20px;">
									<option value="1">性别</option>
									<option value="2">年龄</option>
									<option value="3">所在地</option>
									<option value="4">职业</option>
								</select><br /> 用户分类:
								<select id="usercollection1" onchange="refreshECharts1();" style="margin-bottom: 20px;">
									<option value="1">男</option>
									<option value="2">女</option>
								</select><br /> 电影分类依据：
								<select id="movietype1" onchange="refreshECharts1();" style="margin-bottom: 20px;">
									<option value="2">地区</option>
									<option value="1">标签</option>
								</select><br />
							</form>
						</div>
						<div class="data-div" style="margin-left: auto; margin-right: auto; height: 500px; width: 800px;" id="main11"></div>
					</div>
					<script type="text/javascript" src="/FakeDouban/js/echarts.js"></script>

					<script type="text/javascript">
						function refreshECharts1() {
							var myChart = echarts.init(document
								.getElementById('main11'));
							//alert("进来了");
							//图表显示提示信息
							//myChart.showLoading();
							//定义图表options
							var options = {
								color: ['#3398DB'],

								tooltip: {
									trigger: 'axis'
								},
								legend: {
									data: [{
										name: '观影人数'
									}]
								},
								toolbox: {
									show: true,
									feature: {
										mark: false
									}
								},
								calculable: true,
								xAxis: [{
									//type: 'category',
									data: []
								}],
								yAxis: [{
									//type: 'value',
									splitArea: {
										show: true
									}
								}],
								series: [{
									barWidth: '50%',
									name: '观影人数',
									type: 'bar',
									data: []
								}]
							};
							//alert($("#usertype1 option:selected").val());
							//通过Ajax获取数据
							$
								.ajax({
									type: "post",
									async: true, //同步执行
									url: "/FakeDouban/echarts/getmovie",
									data: {
										usertype: $("#usertype1 option:selected").val(),
										usercollection: $("#usercollection1 option:selected").val(),
										movietype: $("#movietype1 option:selected").val(),
									},
									dataType: "json", //返回数据形式为json

									success: function(result) {
										//var obj = JSON.parse('');
										//将返回的category和series对象赋值给options对象内的category和series
										//因为xAxis是一个数组 这里需要是xAxis[i]的形式\
										//alert("jinlaile");
										//根据地区 
										options.xAxis[0].data = [];
										for(var i = 0; i < result.length; i++) {

											if(result[i].movieType == 2) {
												//alert("jinlaile");
												options.xAxis[0].data[0] = "国内";
												options.xAxis[0].data[1] = "国外";
												if(result[i].movieCollection == 1) {
													options.series[0].data[0] = result[i].count;
												} else
													options.series[0].data[1] = result[i].count;
												//					myChart.hideLoading();
												//					myChart.setOption(options);
											}
											//根据标签
											if(result[i].movieType == 1) {
												//alert("jinlaile");
												options.xAxis[0].data[0] = "Action";
												options.xAxis[0].data[1] = "Adventure";
												options.xAxis[0].data[2] = "Animation";
												options.xAxis[0].data[3] = "Children's";
												options.xAxis[0].data[4] = "Comedy";
												options.xAxis[0].data[5] = "Crime";
												options.xAxis[0].data[6] = "Documentary";
												options.xAxis[0].data[7] = "Drama";
												options.xAxis[0].data[8] = "Fantasy";
												options.xAxis[0].data[9] = "Film-Noir";
												options.xAxis[0].data[10] = "Horror";
												options.xAxis[0].data[11] = "Musical";
												options.xAxis[0].data[12] = "Mystery";
												options.xAxis[0].data[13] = "Romance";
												options.xAxis[0].data[14] = "Sci-Fi";
												options.xAxis[0].data[15] = "Thriller";
												options.xAxis[0].data[16] = "War";
												options.xAxis[0].data[17] = "Western";
												if(result[i].movieCollection == 1) {
													options.series[0].data[0] = result[i].count;
												}
												if(result[i].movieCollection == 2) {
													options.series[0].data[1] = result[i].count;
												}
												if(result[i].movieCollection == 3) {
													options.series[0].data[2] = result[i].count;
												}
												if(result[i].movieCollection == 4) {
													options.series[0].data[3] = result[i].count;
												}
												if(result[i].movieCollection == 5) {
													options.series[0].data[4] = result[i].count;
												}
												if(result[i].movieCollection == 6) {
													options.series[0].data[5] = result[i].count;
												}
												if(result[i].movieCollection == 7) {
													options.series[0].data[6] = result[i].count;
												}
												if(result[i].movieCollection == 8) {
													options.series[0].data[7] = result[i].count;
												}
												if(result[i].movieCollection == 9) {
													options.series[0].data[8] = result[i].count;
												}
												if(result[i].movieCollection == 10) {
													options.series[0].data[9] = result[i].count;
												}
												if(result[i].movieCollection == 11) {
													options.series[0].data[10] = result[i].count;
												}
												if(result[i].movieCollection == 12) {
													options.series[0].data[11] = result[i].count;
												}
												if(result[i].movieCollection == 13) {
													options.series[0].data[12] = result[i].count;
												}
												if(result[i].movieCollection == 14) {
													options.series[0].data[13] = result[i].count;
												}
												if(result[i].movieCollection == 15) {
													options.series[0].data[14] = result[i].count;
												}
												if(result[i].movieCollection == 16) {
													options.series[0].data[15] = result[i].count;
												}
												if(result[i].movieCollection == 17) {
													options.series[0].data[16] = result[i].count;
												}
												if(result[i].movieCollection == 18) {
													options.series[0].data[17] = result[i].count;
												}
												//					myChart.hideLoading();
												//					myChart.setOption(options);
											}
										}
										myChart.hideLoading();
										myChart
											.setOption(options);
									},
									error: function(errorMsg) {
										alert("图表请求数据失败啦!");
									}
								});
						}
						$()
							.ready(function() {
								refreshECharts1();
							});
					</script>
					<!-- 用户统计模块 -->
					<div role="tabpanel" class="tab-pane" id="getuser">
						<div class="check-div form-inline"></div>
						<div class="index" style="height: 200px; margin-left: 18%; margin-right: 18%; margin-top: 5%">
							<span style="font-size: 18px; margin-bottom: 20px;">请选择相关变量</span>
							<span></span>
							<form action="">
								电影分类依据：
								<select id="movietype" onchange="changeSelect();refreshEChart()" style="margin-bottom: 20px;">
									<!--<option selected="selected">请选择不同的电影类型</option>-->
									<option value="2">地区</option>
									<option value="1">标签</option>
								</select><br /> 电影分类：
								<select id="moviecollection" onchange="refreshEChart();" style="margin-bottom: 20px;">
									<!--<option selected="selected">请选择不同的观影地区</option>-->
									<option value="1">国内</option>
									<option value="2">国外</option>
								</select><br /> 用户分类依据：
								<select id="usertype" onchange="refreshEChart();" style="margin-bottom: 20px;">
									<option value="1">性别</option>
									<option value="2">年龄</option>
									<option value="3">所在地</option>
									<option value="4">职业</option>
								</select><br />
							</form>
						</div>
						<div class="data-div" style="margin-left: auto; margin-right: auto; height: 500px; width: 800px;" id="user-count"></div>
					</div>
					<script type="text/javascript">
						function refreshEChart() {
							var myChart = echarts.init(document
								.getElementById('user-count'));
							var options = {
								color: ['#3398DB'],

								tooltip: {
									trigger: 'axis'
								},
								legend: {
									data: [{
										name: '观影数量'
									}]
								},
								toolbox: {
									show: true,
									feature: {
										mark: false
									}
								},
								calculable: true,
								xAxis: [{
									//type: 'category',
									data: []
								}],
								yAxis: [{
									//type: 'value',
									splitArea: {
										show: true
									}
								}],
								series: [{
									barWidth: '50%',
									name: '观影数量',
									type: 'bar',
									data: []
								}]
							};
							var movieType = $("#movietype option:selected").val()
							var movieCollection = $("#moviecollection option:selected").val()
							var userType = $("#usertype option:selected").val();
							$.ajax({
								type: "post",
								async: true, //同步执行
								url: "/FakeDouban/echarts/getuser",
								data: {
									movietype: movieType,
									moviecollection: movieCollection,
									usertype: userType
								},
								dataType: "json", //返回数据形式为json
								success: function(result) {
									//var obj = JSON.parse('');
									//将返回的category和series对象赋值给options对象内的category和series
									//因为xAxis是一个数组 这里需要是xAxis[i]的形式\
									//alert("jinlaile");
									//根据性别 -->
									options.xAxis[0].data = [];
									for(var i = 0; i < result.length; i++) {
										if(result[i].userType == 1) {
											//alert("jinlaile");

											options.xAxis[0].data[0] = "男";
											//alert("nh");
											options.xAxis[0].data[1] = "女";
											//alert("dx");
											if(result[i].userCollection == 1) {
												options.series[0].data[0] = result[i].count;
											} else
												options.series[0].data[1] = result[i].count;
											myChart
												.hideLoading();
											myChart
												.setOption(options);
										}
										//<!--根据年龄 -->
										else if(result[i].userType == 2) {
											//alert("jinlaile");
											options.xAxis[0].data[0] = "0-10";
											options.xAxis[0].data[1] = "10-20";
											options.xAxis[0].data[2] = "20-30";
											options.xAxis[0].data[3] = "30-40";
											options.xAxis[0].data[4] = "40-50";
											options.xAxis[0].data[5] = "50以上";
											if(result[i].userCollection == 1) {
												options.series[0].data[0] = result[i].count;
											}
											if(result[i].userCollection == 2) {
												options.series[0].data[1] = result[i].count;
											}
											if(result[i].userCollection == 3) {
												options.series[0].data[2] = result[i].count;
											}
											if(result[i].userCollection == 4) {
												options.series[0].data[3] = result[i].count;
											}
											if(result[i].userCollection == 5) {
												options.series[0].data[4] = result[i].count;
											}
											if(result[i].userCollection == 6) {
												options.series[0].data[5] = result[i].count;
											}
											myChart
												.hideLoading();
											myChart
												.setOption(options);
										}
										//<!--根据城市 -->
										else if(result[i].userType == 3) {
											//alert("jinlaile");
											options.xAxis[0].data[0] = "南方";
											//alert("nh");
											options.xAxis[0].data[1] = "北方";
											//alert("dx");
											if(result[i].userCollection == 1) {
												options.series[0].data[0] = result[i].count;
											} else
												options.series[0].data[1] = result[i].count;
											myChart
												.hideLoading();
											myChart
												.setOption(options);
										}
										//<!--根据职业 -->
										else if(result[i].userType == 4) {
											//alert("jinlaile");
											options.xAxis[0].data[0] = "学生";
											options.xAxis[0].data[1] = "稳定收入者";
											options.xAxis[0].data[2] = "待业";
											if(result[i].userCollection == 1) {
												options.series[0].data[0] = result[i].count;
											}
											if(result[i].userCollection == 2) {
												options.series[0].data[1] = result[i].count;
											}
											if(result[i].userCollection == 3) {
												options.series[0].data[2] = result[i].count;
											}
											myChart
												.hideLoading();
											myChart
												.setOption(options);
										}
									}

								},
								error: function(errorMsg) {
									alert("图表请求数据失败啦!");
								}
							});
						}
						$()
							.ready(
								function() {

									//通过Ajax获取数据
									refreshEChart();
								});
					</script>

					<!--
                    	作者：offline
                    	时间：2018-08-02
                    	描述：电影管理模块
                    -->
					<div role="tabpanel" class="tab-pane" id="movie">
						<div class="check-div form-inline">
							<!--<div class="col-xs-5">
								<input type="text" id="inputN" class=" form-control input-sm" placeholder="输入文字搜索" style="height: 40px !important;">
								<button class="btn btn-white btn-xs " onclick="txtSerach()">查
								询</button>
							</div>-->
						</div>
						
						<div class="data-div">
							<div class="row tableHeader">
								<div class="col-xs-1 ">电影编号</div>
								<div class="col-xs-2">电影名称</div>
								<div class="col-xs-2">电影地区</div>
								<div class="col-xs-2">上映时间</div>
								<div class="col-xs-2">电影票房</div>
								<div class="col-xs-2">评分</div>
								<div class="col-xs-1">评分人数</div>
								<!--<div class="col-xs-5">操作</div>-->
							</div>
							<div class="tablebody" id="tablebodyid">
							<%
						 		ArrayList<Movie> movies=(ArrayList)request.getAttribute("movies");
								if(movies!=null){
									//response.sendRedirect("/FakeDouban/admin");
								for(Movie movie : movies){
						
							%>
								<div class="row" id="rowId">
									<div class="col-xs-1" id="movieid-<%=movie.getId()%>"><%=movie.getId()%></div>
									<div class="col-xs-2" id="moviename-<%=movie.getId()%>"><%=movie.getMovieName()%></div>
									<div class="col-xs-2" id="movieregion-<%=movie.getId()%>"><%=movie.getMovieRegion()%></div>
									<div class="col-xs-2" id="movieupdatedate-<%=movie.getId()%>"><%=movie.getUpdateDate()%></div>
									<div class="col-xs-2" id="movieprice-<%=movie.getId()%>"><%=movie.getMoviePrice()%>万</div>
									<div class="col-xs-2" id="movieranking-<%=movie.getId()%>"><%=movie.getRanking()%></div>
									<div class="col-xs-1" id="movierankcount-<%=movie.getId()%>"><%=movie.getRankCount()%></div>
									<!--<div class="col-xs-5">
										<button class="btn btn-success btn-xs" data-toggle="modal" data-target="#changeChar1">修改</button>
									</div>-->
								</div>
								<%}}%>
							</div>
							<!--<footer class="footer">
								<ul class="pagination">
									<li><select>
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
											<option>6</option>
											<option>7</option>
											<option>8</option>
											<option>9</option>
											<option>10</option>
									</select> 页</li>
									<li class="gray">共10页</li>
									<li><i class="glyphicon glyphicon-menu-left"> </i></li>
									<li><i class="glyphicon glyphicon-menu-right"></i></li>
								</ul>
							</footer>  -->

							
							<!--弹出删除电影信息警告窗口-->
							<div class="modal fade" id="deleteChar1" role="dialog" aria-labelledby="gridSystemModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
											<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
										</div>
										<div class="modal-body">
											<div class="container-fluid">确定要删除该信息？删除后不可恢复！</div>
										</div>
										<div class="modal-footer">
											<!--<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>-->
											<!--<button type="button" class="btn  btn-xs btn-danger">保 存</button>-->
											<form action="/FakeDouban/movie/recommend/delete" method="post">
												<input type="text" name="movieid" id="movieid" class="" placeholder="请输入电影名称" />
												<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
												<input type="submit" name="movieDelete" id="movieDelete" class="btn  btn-xs btn-danger" />
											</form>
										</div>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>
							<!-- /.modal -->

						</div>
					</div>
					<!--用户管理模块-->
					<div role="tabpanel" class="tab-pane" id="user">
						<div class="check-div form-inline">
							<div class="col-xs-3">
								<button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addUser">添加用户</button>
							</div>
							<!--<div class="col-xs-4">
								<input type="text" class="form-control input-sm" placeholder="输入文字搜索">
								<button class="btn btn-white btn-xs ">查 询</button>
							</div>-->
							<div class="col-lg-3 col-lg-offset-2 col-xs-4" style="padding-right: 40px; text-align: right;">
								<!--<label for="paixu">排序:&nbsp;</label>
								<select class=" form-control">
									<option>地区</option>
									<option>地区</option>
									<option>班期</option>
									<option>性别</option>
									<option>年龄</option>
									<option>份数</option>
								</select>-->
							</div>
						</div>
						<div class="data-div">
							<div class="row tableHeader">
								<div class="col-xs-1 ">id</div>
								<div class="col-xs-2 ">用户名</div>
								<div class="col-xs-1">年龄</div>
								<div class="col-xs-1">性别</div>
								<div class="col-xs-1">城市</div>
								<div class="col-xs-1">工作</div>
								<div class="col-xs-3">个人描述</div>
								<div class="col-xs-2">操作</div>
							</div>
							<div class="tablebody">
								<%
								ArrayList<User> users=(ArrayList<User>) request.getAttribute("users");
								if(users!=null){
									//response.sendRedirect("/FakeDouban/admin");
								for (User user : users) {
							%>
								<div class="row">
									<div class="col-xs-1" id="userid-<%=user.getId()%>"><%=user.getId()%></div>
									<div class="col-xs-2 " id="username-<%=user.getId()%>"><%=user.getUserName()%></div>
									<div class="col-xs-1" id="userage-<%=user.getId()%>"><%=user.getAge()%></div>
									<div class="col-xs-1" id="usergender-<%=user.getId()%>"><%=user.getGender()%></div>
									<div class="col-xs-1" id="usercity-<%=user.getId()%>"><%=user.getCity()%></div>
									<div class="col-xs-1" id="userjob-<%=user.getId()%>"><%=user.getJob()%></div>
									<div class="col-xs-3" id="userdescription-<%=user.getId()%>"><%=user.getDescription()%></div>
									<div class="col-xs-2">
										<button class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseUser" onclick="changeuser(<%=user.getId()%>)">修改</button>
										<button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteUser">删除</button>
									</div>
								</div>
								<%
								}
								}
							%>
							</div>
							<!--页码块-->
							<!-- <footer class="footer">
						<ul class="pagination">
							<li><select>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
									<option>7</option>
									<option>8</option>
									<option>9</option>
									<option>10</option>
							</select> 页</li>
							<li class="gray">共20页</li>
							<li><i class="glyphicon glyphicon-menu-left"> </i></li>
							<li><i class="glyphicon glyphicon-menu-right"> </i></li>
						</ul>
					</footer> -->

							<!--弹出添加用户窗口-->
							<div class="modal fade" id="addUser" role="dialog" aria-labelledby="gridSystemModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
											<h4 class="modal-title" id="gridSystemModalLabel">添加用户</h4>
										</div>
										<div class="modal-body">
											<div class="container-fluid">
												<form class="form-horizontal" action="/FakeDouban/user/insert" method="post">
													<div class="form-group ">
														<label for="sName" class="col-xs-3 control-label">用户名：</label>
														<div class="col-xs-8 ">
															<input type="text" class="form-control input-sm duiqi" name="username" id="sName" placeholder="">
														</div>
													</div>
													<div class="form-group">
														<label for="sPassword" class="col-xs-3 control-label">密码：</label>
														<div class="col-xs-8 ">
															<input type="text" class="form-control input-sm duiqi" name="password" id="sPassword" placeholder="">
														</div>
													</div>
													<div class="form-group">
														<label for="sGender" class="col-xs-3 control-label">性别：</label>
														<div class="col-xs-8">
															<!--<input type="" class="form-control input-sm duiqi" id="sGender" placeholder="">-->
															<select class="form-control select-duiqi" name="gender" id="sGender">
																<option value="保密">保密</option>
																<option value="男">男</option>
																<option value="女">女</option>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label for="sAge" class="col-xs-3 control-label">年龄：</label>
														<div class="col-xs-8">
															<input type="number" class="form-control input-sm duiqi" name="age" min="0" id="sAge" placeholder="">
														</div>
													</div>
													<div class="form-group">
														<label for="sJob" class="col-xs-3 control-label">工作：</label>
														<div class="col-xs-8">
															<select class=" form-control select-duiqi" id="sJob" name="job">
																<option value="学生">学生</option>
																<option value="稳定收入者">稳定收入者</option>
																<option value="待业">待业</option>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label for="sCity" class="col-xs-3 control-label">所在地：</label>
														<div class="col-xs-8">
															<select class=" form-control select-duiqi" id="sCity" name="city">
																<option value="南方">南方</option>
																<option value="北方">北方</option>
																<!--<option value="">游客</option>-->
															</select>
														</div>
													</div>
													<div class="form-group">
													<p style="margin-left: 30px;">
														//个人简介将自动初始化为
														<br />
														//（该用户很懒，没有填写个人简介。。。）
													</p>
														
													
														
														<input type="hidden" id="sDesc" name="description" value="该用户很懒，没有填写个人简介。。。" />
													</div>
													<div class="form-group">
														<label for="situation" class="col-xs-4 control-label">评论员用户：</label>
														<div class="col-xs-7">
															<label class="control-label" for="anniu"> 
															<input
															type="radio" name="level" id="normal" value="1" checked="checked">是
														</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
														<label class="control-label" for="meun"> <input
															type="radio" name="level" id="forbid" value="0"> 否
														</label>
														</div>
													</div>
													<div class="modal-footer">
														<input type="submit" class="btn btn-xs btn-green" value="提交" />
														<input type="reset" class="btn btn-xs btn-white" data-dismiss="modal" value="重置" />
													</div>
												</form>
											</div>
										</div>
										<!--<div class="modal-footer">
											<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
											<button type="button" class="btn btn-xs btn-green">保
											存</button>
										</div>-->
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>
							<!-- /.modal -->

							<!--弹出修改用户窗口-->
							<script type="text/javascript">
								function changeuser(i) {
//									alert("#userid-" + i);
									var str = $("#userid-" + i).text();
//									alert(str);
									//$("#userid").attr("value",str); 
									$("#userid2").val($("#userid-" + i).text());
									$("#username2").val($("#username-" + i).text());
									$("#userage2").val($("#userage-" + i).text());
									$("#usergender2").val($("#usergender-" + i).text());
									$("#usercity2").val($("#usercity-" + i).text());
									$("#userjob2").val($("#userjob-" + i).text());
									$("#userdescription2").val($("#userdescription-" + i).text());
								}
							</script>
							<div class="modal fade" id="reviseUser" role="dialog" aria-labelledby="gridSystemModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
											<h4 class="modal-title" id="gridSystemModalLabel">修改用户</h4>
										</div>
										<div class="modal-body">
											<div class="container-fluid">
												<form class="form-horizontal" action="/FakeDouban/user/admin/modify" method="post">
													<div class="form-group ">
														<div class="col-xs-8 ">
															<input type="hidden" class="form-control input-sm duiqi" id="userid2" placeholder="" name="userid">
														</div>
													</div>
													<div class="form-group ">
														<label for="sName" class="col-xs-3 control-label">用户名：</label>
														<div class="col-xs-8 ">
															<input type="text" class="form-control input-sm duiqi" id="username2" placeholder="" name="username">
														</div>
													</div>
													<div class="form-group">
														<label for="sLink" class="col-xs-3 control-label">年龄：</label>
														<div class="col-xs-8 ">
															<input type="number" class="form-control input-sm duiqi" id="userage2" placeholder="" name="age">
														</div>
													</div>
													<div class="form-group">
														<label for="sOrd" class="col-xs-3 control-label">性别：</label>
														<div class="col-xs-8">
															<select name="gender" class="form-control input-sm duiqi" id="usergender2">
																<option value="男">男</option>
																<option value="女">女</option>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label for="sKnot" class="col-xs-3 control-label">所在地：</label>
														<div class="col-xs-8">
															<input type="text" class="form-control input-sm duiqi" id="usercity2" name="city" placeholder="">
														</div>
													</div>
													<div class="form-group">
														<label for="sKnot" class="col-xs-3 control-label">工作：</label>
														<div class="col-xs-8">
															<input type="text" class="form-control input-sm duiqi" id="userjob2" name="job" placeholder="">
														</div>
													</div>
													<div class="form-group">
														<label for="sKnot" class="col-xs-3 control-label">描述：</label>
														<div class="col-xs-8">
															<input type="text" class="form-control input-sm duiqi" id="userdescription2" name="description" placeholder="">
														</div>
													</div>
													
													<div class="modal-footer">
														<input type="reset" class="btn btn-xs btn-white" data-dismiss="modal" /> 
														<input type="submit" value="提交" class="btn btn-xs btn-green" id="button7" />
														<!--btn btn-xs btn-green-->
													</div>
												</form>
											</div>
										</div>

									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->

								<!--弹出删除用户警告窗口-->
								<div class="modal fade" id="deleteUser" role="dialog" aria-labelledby="gridSystemModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
												<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
											</div>
											<div class="modal-body">
												<div class="container-fluid">确定要删除该用户？删除后不可恢复！</div>
											</div>
											<div class="modal-footer">
												<!--<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
										<button type="button" class="btn  btn-xs btn-danger">保 存</button>-->
												<form action="/FakeDouban//user/delete" method="post">
													<input type="text" name="userid" id="movieid" class="" placeholder="请输入用户编号" />
													<button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
													<input type="submit" name="movieDelete" id="movieDelete" class="btn  btn-xs btn-danger" value="保存" />
												</form>
											</div>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
								</div>
								<!-- /.modal -->

							</div>
						</div>
					</div>
					<!-- 修改密码模块 -->
					<div role="tabpanel" class="tab-pane" id="chan">
						<div class="check-div">原始密码为12312313</div>
						<div style="padding: 50px 0; margin-top: 50px; background-color: #fff; text-align: right; width: 420px; margin: 50px auto;">
							<form class="form-horizontal">
								<div class="form-group">
									<label for="sKnot" class="col-xs-4 control-label">原密码：</label>
									<div class="col-xs-5">
										<input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="" style="margin-top: 7px;">
									</div>
								</div>
								<div class="form-group">
									<label for="sKnot" class="col-xs-4 control-label">新密码：</label>
									<div class="col-xs-5">
										<input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="" style="margin-top: 7px;">
									</div>
								</div>
								<div class="form-group">
									<label for="sKnot" class="col-xs-4 control-label">重复密码：</label>
									<div class="col-xs-5">
										<input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="" style="margin-top: 7px;">
									</div>
								</div>
								<div class="form-group text-right">
									<div class="col-xs-offset-4 col-xs-5" style="margin-left: 169px;">
										<button type="reset" class="btn btn-xs btn-white">取 消</button>
										<button type="submit" class="btn btn-xs btn-green">保存</button>
									</div>
								</div>
							</form>
						</div>

					</div>

					<!--页码块-->
					<!--<footer class="footer">
						<ul class="pagination">
							<li><select>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
									<option>7</option>
									<option>8</option>
									<option>9</option>
									<option>10</option>
							</select> 页</li>
							<li class="gray">共20页</li>
							<li><i class="glyphicon glyphicon-menu-left"> </i></li>
							<li><i class="glyphicon glyphicon-menu-right"> </i></li>
						</ul>
					</footer>  -->

				</div>
			</div>

			<!-- 滑块js -->
			<!--	<script type="text/javascript">
        scale = function(btn, bar, title, unit) {
                this.btn = document.getElementById(btn);
                this.bar = document.getElementById(bar);
                this.title = document.getElementById(title);
                this.step = this.bar.getElementsByTagName("div")[0];
                this.unit = unit;
                this.init();
        };
        scale.prototype = {
                init: function() {
                        var f = this,
                                g = document,
                                b = window,
                                m = Math;
                        f.btn.onmousedown = function(e) {
                                var x = (e || b.event).clientX;
                                var l = this.offsetLeft;
//						var max = f.bar.offsetWidth - this.offsetWidth;
                                var max = f.bar.offsetWidth-20 ;
                                g.onmousemove = function(e) {
                                        var thisX = (e || b.event).clientX;
                                        var to = m.min(max, m.max(-2, l + (thisX - x)));
                                        f.btn.style.left = to+ 'px';
                                        f.ondrag(m.round(m.max(0, to / max) * 100), to);
                                        b.getSelection ? b.getSelection().removeAllRanges() : g.selection.empty();
                                };
                                g.onmouseup = new Function('this.onmousemove=null');
                        };
                },
                ondrag: function(pos, x) {
                        this.step.style.width = Math.max(0, x) +2+ 'px';
                        this.title.innerHTML = pos / 10 + this.unit + "";
                }
        }
        new scale('btn0', 'bar0', 'title0', "分钟");
        new scale('btn1', 'bar1', 'title1', "分钟");
        new scale('btn2', 'bar2', 'title2', "天");
        new scale('btn3', 'bar3', 'title3', "次");
</script>
-->

			<!-- this page specific inline scripts -->

		</div>
	</body>

</html>