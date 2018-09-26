<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>
<%@page import="cn.edu.nku.cc.FakeDouban.domain.po.*"%>
<!-- single -->
<%
	if (request.getAttribute("movie") == null) {
		response.sendRedirect("/FakeDouban/error.html");
	}
%>
<link rel="stylesheet" type="text/css" href="/FakeDouban/css/single.css" />
<div class="single-page-agile-main">
	<div class="container">
		<!-- /w3l-medile-movies-grids -->
		<div class="agileits-single-top">
			<ol class="breadcrumb">
				<li><a href="/movie/index">Home</a></li>
				<li class="active">Single</li>
			</ol>
		</div>
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
						<div class="all-comments">
							<ul class="movie-info-list">
								<li><label>电影类型：</label>
									<h4>${requestScope.movie.movieType}</h4></li>
								<li><label>电影地区：</label>
									<h4>${requestScope.movie.movieRegion}</h4></li>
								<li><label>电影标签：</label> <%
 	if (request.getAttribute("movie") != null)
 		for (String tag : ((Movie) request.getAttribute("movie")).getMovieTags()) {
 %>
									<div class="movie-tags">
										<%=tag%>
									</div> <%
 	}
 %></li>
								<li><label>电影票房：</label>
									<h6>
										<span> ${requestScope.movie.moviePrice}</span> 万
									</h6></li>
								<li><label>电影评分：</label>
									<h4>
										<%
											if (((Movie) request.getAttribute("movie")).getRanking() == null) {
										%>
										暂无评分
										<%
											} else {
										%>
										${requestScope.movie.ranking }
										<%
											}
										%>
									</h4></li>
								<li><label>电影评分人数：</label>
									<h4>
										<%
											if (((Movie) request.getAttribute("movie")).getRankCount() == null) {
										%>
										暂无
										<%
											} else {
										%>
										${requestScope.movie.rankCount }
										<%
											}
										%>
									</h4></li>
								<li><label>电影上映日期：</label>
									<h4>${requestScope.movie.updateDate}</h4></li>
							</ul>
						</div>
					</div>

					<div class="clearfix"></div>
					<div class="all-comments">

						<div class="all-comments-info">
							<%
								if (session.getAttribute("userSession") != null) {
							%>
							<a>发表短评</a>
							<div class="agile-info-wthree-box">
								<form action="/FakeDouban/movie/simplereview" method="post">
									<input type="hidden" name="movieid" id="movieid"
										value="${requestScope.movie.id }" /> <input type="text"
										placeholder="说几句吧......" required="required" name="review" />
									<input type="number" placeholder="评分（5分满分）" required="required"
										min="1" max="5" name="rank" /> <input type="submit"
										value="发送">
									<div class="clearfix"></div>
								</form>
							</div>
							<%
								} else {
							%>
							<span>发表短评，请先<a href="/FakeDouban/jsp/login.jsp">登录</a></span>
							<%
								}
							%>
						</div>
					</div>
					<div class="all-comments long-reviews">
						<ul class="longreview-header">
							<li>
								<h3>
									<strong>长评</strong>
								</h3>
							</li>
							<%
								if ((User) session.getAttribute("userSession") != null) {
									if (((User) session.getAttribute("userSession")).getLevel() != null) {
							%>
							<li class="button" style="margin-right:5px;float:right;">
							<a
								href="/FakeDouban/movie/addlongreview?movieid=${requestScope.movie.id }" style="color:white">写长评</a>
							</li>
						<%
							}
							}
						%>
						</ul>

						<hr />
						<div class="media-grids">
							<%
								ArrayList<LongReview> lReviews = (ArrayList<LongReview>) request.getAttribute("longreviews");
								if (lReviews.size() == 0) {
							%>
							<div class="media">
								<h6>当前没有评论员发表长评，.</h6>
							</div>
							<%
								} else
									for (LongReview lReview : lReviews) {
							%>
							<div class="media">
								<h5><%=lReview.getTitle()%></h5>
								<h5 class="ranking"><%=lReview.getRank()%></h5>
								<div class="media-left">
									<a
										href="/FakeDouban/user/detail?userid=<%=lReview.getReviewer().getId()%>">
										<img src="/FakeDouban/images/user.jpg" title="One movies"
										alt=" " />
									</a>
									<h6><%=lReview.getReviewer().getUserName()%></h6>
								</div>
								<div class="media-body">
									<p><%=lReview.getContent().substring(0, lReview.getContent().length()>255?255:lReview.getContent().length())%>...
									</p>
								</div>

							</div>
							<%
								}
							%>

						</div>

					</div>



				</div>
				<!--						<div class="clearfix"> </div>
-->
				<div class="col-sm-4">
					<div class="all-comments simple-reviews">

						<h3>
							<strong>短评</strong>
						</h3>
						<hr />
						<div class="media-grids">
							<%
								ArrayList<SimpleReview> sReviews = (ArrayList<SimpleReview>) request.getAttribute("simplereviews");
								if (sReviews.size() == 0) {
							%>
							<div class="media">
								<h6>当前没有用户评论，快来说几句吧......</h6>
							</div>
							<%
								} else
									for (SimpleReview sReview : sReviews) {
							%>
							<div class="media">
								<h5 class="ranking"><%=sReview.getRank()%>.0
								</h5>
								<div class="media-left">
									<a
										href="/FakeDouban/user/detail?userid=<%=sReview.getUser().getId()%>">
										<img src="/FakeDouban/images/user.jpg" title="One movies"
										alt=" " />
									</a>
									<h6><%=sReview.getUser().getUserName()%></h6>
								</div>
								<div class="media-body">
									<p><%=sReview.getReview()%></p>
								</div>
							</div>
							<%
								}
							%>

						</div>

					</div>


				</div>

			</div>
			<!-- //movie-browse-agile -->
			<!--body wrapper start-->
			<br />

		</div>
		<!-- //w3l-latest-movies-grids -->
	</div>
</div>
<!-- //w3l-medile-movies-grids -->

<%@include file="common/footer.jsp"%>