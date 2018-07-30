<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>
<%@page import="cn.edu.nku.cc.FakeDouban.domain.po.*" %>
<link href="/FakeDouban/css/single.css" rel='stylesheet' type='text/css' />
<!-- single -->
<div class="single-page-agile-main">
	<div class="container">
		<!-- /w3l-medile-movies-grids -->
		<div class="agileits-single-top">
			<ol class="breadcrumb">
				<li>
					<a href="index.jsp">Home</a>
				</li>
				<li class="active">Single</li>
			</ol>
		</div>
		<div class="single-page-agile-info">
			<!-- /movie-browse-agile -->
			<div class="show-top-grids-w3lagile">
				<div class="col-sm-8">
					<div class="song">
						<div class="song-info">
							<!--<h3>THE LEGEND OF TARZAN - Official Trailer 2</h3>-->
							<h3>${requestScope.movie.movieName}</h3>
						</div>
						<div class="video-grid-single-page-agileits">
							<img src="/FakeDouban/images/5.jpg" alt="" class="img-responsive" />
					</div>
					<div class="all-comments">
						<ul class="movie-info-list">
							<li>
								<label>电影类型：</label>
								<h4>${requestScope.movie.movieType}</h4>
							</li>
							<li>
								<label>电影地区：</label>
								<h4>${requestScope.movie.movieRegion}</h4>
							</li>
							<li>
								<label>电影标签：</label>
								<%
											 for(String tag : ((Movie)request.getAttribute("movie")).getMovieTags()){
												 %>
								<div class="movie-tags">
									<%=tag%>
								</div>
								<%
											 }
											%>
							</li>
							<li>
								<label>电影票房：</label>
								<h6> <span> ${requestScope.movie.moviePrice}</span> 万</h6>
							</li>
							<li>
								<label>电影评分：</label>
								<h4>${requestScope.movie.ranking}</h4>
							</li>
							<li>
								<label>电影评分人数：</label>
								<h4>${requestScope.movie.rankCount}</h4>
							</li>
							<li>
								<label>电影上映日期：</label>
								<h4>${requestScope.movie.updateDate}</h4>
							</li>
						</ul>
					</div>
					<div class="clearfix"> </div>
					<div class="all-comments">
						<div class="all-comments-info">
							<div class="agile-info-wthree-box">
								<form action="/movie/simpleReview" method="POST">
									<input type="text" placeholder="说几句吧......" required="required">
									<input type="number" placeholder="评分（5分满分）" required="required" min="1" max="5" />
									<input type="submit" value="发送">
									<div class="clearfix"> </div>
								</form>
							</div>
						</div>
					</div>
				</div>

				<div class="all-comments">

					<h3><strong>短评</strong></h3>
					<hr />
					<div class="media-grids">
						<div class="media">
							<h5 class="ranking">5.0</h5>
							<div class="media-left">
								<a href="#">
									<img src="/FakeDouban/images/user.jpg" title="One movies" alt=" " />
								</a>
								<h6>TOM BROWN</h6>
							</div>
							<div class="media-body">
								<p>Maecenas ultricies rhoncus tincidunt maecenas imperdiet ipsum id ex pretium hendrerit maecenas imperdiet ipsum id ex pretium hendrerit</p>
							</div>
						</div>

					</div>

				</div>
			</div>
			<div class="col-sm-4">
				<div class="all-comments">
					<h3><strong>长评</strong></h3>
					<hr />
					<div class="media-grids">
						<div class="media">
							<h5>This is title.</h5>
							<h5 class="ranking">99</h5>
							<div class="media-left">
								<a href="#">
									<img src="/FakeDouban/images/user.jpg" title="One movies" alt=" " />
								</a>
								<h6>username</h6>
							</div>
							<div class="media-body">
								<p>Maecenas ultricies rhoncus tincidunt maecenas imperdiet ipsum id ex pretium hendrerit maecenas imperdiet ipsum id ex pretium hendrerit</p>
							</div>

						</div>

					</div>

				</div>
			</div>
			<div class="clearfix"> </div>
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