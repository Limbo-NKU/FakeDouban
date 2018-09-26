<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>
<%@page import="cn.edu.nku.cc.FakeDouban.domain.po.*" %>
<%@page import="java.util.*" %>

<%
if(request.getAttribute("hotmovies")==null||request.getAttribute("newmovies")==null){
	%>
	<script type="text/javascript">
		$().ready(function(){
			window.location.href="/FakeDouban/movie/index";
		});
	</script>
	<%
}
%>

<!-- banner-bottom -->
<div class="banner-bottom">
	<div class="container">
		<h1>热门电影</h1>
		<div class="w3_agile_banner_bottom_grid">
			<div class="owl-carousel owl-theme owl-demo" id="ca1">
				<div class="item">
					<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
						<a href="/FakeDouban/movie/detail?movieid=2" class="hvr-shutter-out-horizontal"><img src="/FakeDouban/images/m13.jpg" title="album-name" class="img-responsive" alt=" " />
							<div class="w3l-action-icon">
								<i class="fa fa-play-circle" aria-hidden="true"></i>
							</div>
						</a>
						<div class="mid-1 agileits_w3layouts_mid_1_home">
							<div class="w3l-movie-text">
								<h6>
									<a href="/FakeDouban/movie/detail?movieid=2">Citizen Soldier</a>
								</h6>
							</div>
							<div class="mid-2 agile_mid_2_home">
								<p>2016</p>
								<div class="block-stars">
									<ul class="w3l-ratings">
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
										</li>
									</ul>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="ribben">
							<p>NEW</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
						<a href="/FakeDouban/movie/detail?movieid=2" class="hvr-shutter-out-horizontal"><img src="/FakeDouban/images/m11.jpg" title="album-name" class="img-responsive" alt=" " />
							<div class="w3l-action-icon">
								<i class="fa fa-play-circle" aria-hidden="true"></i>
							</div>
						</a>
						<div class="mid-1 agileits_w3layouts_mid_1_home">
							<div class="w3l-movie-text">
								<h6>
									<a href="/FakeDouban/movie/detail?movieid=2">X-Men</a>
								</h6>
							</div>
							<div class="mid-2 agile_mid_2_home">
								<p>2016</p>
								<div class="block-stars">
									<ul class="w3l-ratings">
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
										</li>
									</ul>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="ribben">
							<p>NEW</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
						<a href="/FakeDouban/movie/detail?movieid=2" class="hvr-shutter-out-horizontal"><img src="/FakeDouban/images/m12.jpg" title="album-name" class="img-responsive" alt=" " />
							<div class="w3l-action-icon">
								<i class="fa fa-play-circle" aria-hidden="true"></i>
							</div>
						</a>
						<div class="mid-1 agileits_w3layouts_mid_1_home">
							<div class="w3l-movie-text">
								<h6>
									<a href="/FakeDouban/movie/detail?movieid=2">Greater</a>
								</h6>
							</div>
							<div class="mid-2 agile_mid_2_home">
								<p>2016</p>
								<div class="block-stars">
									<ul class="w3l-ratings">
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
										</li>
									</ul>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="ribben">
							<p>NEW</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
						<a href="/FakeDouban/movie/detail?movieid=2" class="hvr-shutter-out-horizontal"><img src="/FakeDouban/images/m7.jpg" title="album-name" class="img-responsive" alt=" " />
							<div class="w3l-action-icon">
								<i class="fa fa-play-circle" aria-hidden="true"></i>
							</div>
						</a>
						<div class="mid-1 agileits_w3layouts_mid_1_home">
							<div class="w3l-movie-text">
								<h6>
									<a href="/FakeDouban/movie/detail?movieid=2">Light B/t Oceans</a>
								</h6>
							</div>
							<div class="mid-2 agile_mid_2_home">
								<p>2016</p>
								<div class="block-stars">
									<ul class="w3l-ratings">
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
										</li>
									</ul>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="ribben">
							<p>NEW</p>
						</div>
					</div>
				</div>
				
				<% 
					ArrayList<Movie> hotmovies=(ArrayList)request.getAttribute("hotmovies");
					if(hotmovies!=null){
					for(Movie movie:hotmovies){
						%>
						<div class="item">
					<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
						<a href="/FakeDouban/movie/detail?movieid=<%=movie.getId()%>" class="hvr-shutter-out-horizontal">
							<img src="/FakeDouban/images/nullposter.jpg" title="album-name" class="img-responsive" alt=" " />
							<div class="w3l-action-icon">
								<i class="fa fa-play-circle" aria-hidden="true"></i>
							</div>
						</a>
						<div class="mid-1 agileits_w3layouts_mid_1_home">
							<div class="w3l-movie-text">
								<h6>
									<a href="/FakeDouban/movie/detail?movieid=<%=movie.getId()%>"><%=movie.getMovieName()%></a>
								</h6>
							</div>
							<div class="mid-2 agile_mid_2_home">
								<p><%=movie.getUpdateDate()%></p>
								<div class="block-stars">
									<ul class="w3l-ratings">
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
										</li>
									</ul>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="ribben">
							<p>NEW</p>
						</div>
					</div>
				</div>
				<%
				}}
				%>
			</div>
		</div>
	</div>

</div>
<div class="banner-bottom">
	<div class="container">
		<h1>最新电影</h1>
		<div class="w3_agile_banner_bottom_grid">
			<div class="owl-carousel owl-theme owl-demo">
				<div class="item">
					<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
						<a href="/FakeDouban/movie/detail?movieid=2" class="hvr-shutter-out-horizontal"><img src="/FakeDouban/images/m12.jpg" title="album-name" class="img-responsive" alt=" " />
							<div class="w3l-action-icon">
								<i class="fa fa-play-circle" aria-hidden="true"></i>
							</div>
						</a>
						<div class="mid-1 agileits_w3layouts_mid_1_home">
							<div class="w3l-movie-text">
								<h6>
									<a href="/FakeDouban/movie/detail?movieid=2">Greater</a>
								</h6>
							</div>
							<div class="mid-2 agile_mid_2_home">
								<p>2016</p>
								<div class="block-stars">
									<ul class="w3l-ratings">
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
										</li>
									</ul>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="ribben">
							<p>NEW</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
						<a href="/FakeDouban/movie/detail?movieid=2" class="hvr-shutter-out-horizontal"><img src="/FakeDouban/images/m7.jpg" title="album-name" class="img-responsive" alt=" " />
							<div class="w3l-action-icon">
								<i class="fa fa-play-circle" aria-hidden="true"></i>
							</div>
						</a>
						<div class="mid-1 agileits_w3layouts_mid_1_home">
							<div class="w3l-movie-text">
								<h6>
									<a href="/FakeDouban/movie/detail?movieid=2">Light B/t Oceans</a>
								</h6>
							</div>
							<div class="mid-2 agile_mid_2_home">
								<p>2016</p>
								<div class="block-stars">
									<ul class="w3l-ratings">
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
										</li>
									</ul>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="ribben">
							<p>NEW</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
						<a href="/FakeDouban/movie/detail?movieid=2" class="hvr-shutter-out-horizontal"><img src="/FakeDouban/images/m8.jpg" title="album-name" class="img-responsive" alt=" " />
							<div class="w3l-action-icon">
								<i class="fa fa-play-circle" aria-hidden="true"></i>
							</div>
						</a>
						<div class="mid-1 agileits_w3layouts_mid_1_home">
							<div class="w3l-movie-text">
								<h6>
									<a href="/FakeDouban/movie/detail?movieid=2">The BFG</a>
								</h6>
							</div>
							<div class="mid-2 agile_mid_2_home">
								<p>2016</p>
								<div class="block-stars">
									<ul class="w3l-ratings">
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
										</li>
									</ul>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="ribben">
							<p>NEW</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
						<a href="/FakeDouban/movie/detail?movieid=2" class="hvr-shutter-out-horizontal"><img src="/FakeDouban/images/m9.jpg" title="album-name" class="img-responsive" alt=" " />
							<div class="w3l-action-icon">
								<i class="fa fa-play-circle" aria-hidden="true"></i>
							</div>
						</a>
						<div class="mid-1 agileits_w3layouts_mid_1_home">
							<div class="w3l-movie-text">
								<h6>
									<a href="/FakeDouban/movie/detail?movieid=2">Central Intelligence</a>
								</h6>
							</div>
							<div class="mid-2 agile_mid_2_home">
								<p>2016</p>
								<div class="block-stars">
									<ul class="w3l-ratings">
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
										</li>
									</ul>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="ribben">
							<p>NEW</p>
						</div>
					</div>
				</div>
				
				<% 
					ArrayList<Movie> newmovies=(ArrayList<Movie>)request.getAttribute("newmovies");
					if(newmovies!=null){
					for(Movie movie:newmovies){
						%>
						<div class="item">
					<div class="w3l-movie-gride-agile w3l-movie-gride-agile1">
						<a href="/FakeDouban/movie/detail?movieid=<%=movie.getId()%>" class="hvr-shutter-out-horizontal">
							<img src="/FakeDouban/images/nullposter.jpg" title="album-name" class="img-responsive" alt=" " />
							<div class="w3l-action-icon">
								<i class="fa fa-play-circle" aria-hidden="true"></i>
							</div>
						</a>
						<div class="mid-1 agileits_w3layouts_mid_1_home">
							<div class="w3l-movie-text">
								<h6>
									<a href="/FakeDouban/movie/detail?movieid=<%=movie.getId()%>"><%=movie.getMovieName()%></a>
								</h6>
							</div>
							<div class="mid-2 agile_mid_2_home">
								<p><%=movie.getUpdateDate()%></p>
								<div class="block-stars">
									<ul class="w3l-ratings">
										<li>
											<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
										</li>
										<li>
											<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
										</li>
									</ul>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="ribben">
							<p>NEW</p>
						</div>
					</div>
				</div>
				<%
				}}
				%>
			</div>
		</div>
	</div>

</div>

<!-- //banner-bottom -->
<a href="/FakeDouban/movie/all">
	<div id="viewall-button">
		<h1>显 示 全 部 电 影</h1>
	</div>
</a>

<%@include file="common/footer.jsp"%>