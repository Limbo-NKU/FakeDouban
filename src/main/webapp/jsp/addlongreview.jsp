<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="common/header.jsp"%>
<%@page import="cn.edu.nku.cc.FakeDouban.domain.po.*" %>
<% if(session.getAttribute("userSession")==null){
	response.sendRedirect("/FakeDouban/error.html");
}else if(((User)session.getAttribute("userSession")).getLevel()==null){
	response.sendRedirect("/FakeDouban/error.html");
}else if(request.getAttribute("movie")==null){
	response.sendRedirect("/FakeDouban/error.html");
	
}
%>
<link rel="stylesheet" type="text/css" href="/FakeDouban/css/single.css" />
<div class="container">
	<div class="single-page-agile-info">
	<!-- /movie-browse-agile -->
	<div class="show-top-grids-w3lagile">
		<div class="col-sm-8">
			<div class="song">
				<div class="song-info">
					<h3>${requestScope.movie.movieName }</h3>
				</div>
				<div class="video-grid-single-page-agileits">
					<img src="/FakeDouban/images/5.jpg" alt="" class="img-responsive" />
				</div>
				<div class="clear" style="height: 15px;"></div>

			</div>

			<div class="clearfix"></div>
			<div class="all-comments">
				<h2>新建长评</h2>
				<hr />
				<form class="form-horizontal" action="/FakeDouban/movie/longreview" method="post">
					<div class="form-group col-xs-4">
						<label for="rank" class="control-label">评分：</label>
					<input class="form-control " type="number" name="rank" id="rank" min="0" max="100" value="" placeholder="评分（满分100）" />
										</div>
					<!--<br />-->
					<input type="hidden" name="movieid" id="movieid" value="${requestScope.movie.id}" />
					<div class="form-group col-xs-6 col-xs-offset-1 ">
						<label for="title" class="control-label">长评标题：</label>
					<input class="form-control " type="text" name="title" id="title" value="" placeholder="长评标题" />
					
					</div>
					<!--<div class="col-xs-1">
						 
					</div>-->
					<div class="form-group col-xs-2 ">
						<label class="control-label"> </label>
						<input class="button" type="submit" value="提交" />
					</div>
					<!--<br />-->
					<div class="form-group col-xs-12">
						<label for="content" class="control-label">长评内容：</label>
					<textarea class="form-control input-sm" name="content" id="content" style="height: 200px;"></textarea>
					
					</div>
					<!--<br />-->
					
					
				</form>
				<div class="clearfix"></div>
			</div>
		</div>

		<div class="col-sm-4">
			<div class="all-comments" style="padding-left:20px;padding-right:20px">
				<ul class="movie-info-list">
					<li><label>电影类型：</label>
						<h4>${requestScope.movie.movieType}</h4></li>
					<li><label>电影地区：</label>
						<h4>${requestScope.movie.movieRegion}</h4></li>
					<li><label>电影标签：</label>
						<%
								if(request.getAttribute("movie")!=null)
											 for(String tag : ((Movie)request.getAttribute("movie")).getMovieTags()){
												 %>
						<div class="movie-tags">
							<%=tag%>
						</div>
						<%
											 
											%>
					</li>
					<li><label>电影票房：</label>
						<h6>
										<span> ${requestScope.movie.moviePrice}</span> 万
									</h6></li>
					<li><label>电影评分：</label>
						<h4>
									<%
									if(((Movie)request.getAttribute("movie")).getRanking()==null){
									%>
									暂无评分
									<%
									}else{
										%>
										${requestScope.movie.ranking }
										<%
									}
									%>
									</h4></li>
					<li><label>电影评分人数：</label>
						<h4>
									<%
									if(((Movie)request.getAttribute("movie")).getRankCount()==null){
									%>
									暂无
									<%
									}else{
										%>
										${requestScope.movie.rankCount }
										<%
									}
											 }
									%>
									</h4></li>
					<li><label>电影上映日期：</label>
						<h4>${requestScope.movie.updateDate}</h4></li>
				</ul>
			</div>

		</div>
		<div class="clearfix"> </div>
	</div>
	<!-- //movie-browse-agile -->
	<!--body wrapper start-->
	<br />

</div>
	
</div>

<%@include file="common/footer.jsp"%>