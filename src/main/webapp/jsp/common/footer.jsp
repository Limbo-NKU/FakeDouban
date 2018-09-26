<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript" src="/FakeDouban/js/move-top.js"></script>
<footer>
		<div class="footer">
			<div class="container">
				<div class="w3ls_footer_grid">
					<div class="col-md-6 w3ls_footer_grid_left">
						<div class="w3ls_footer_grid_left1">
							<h2>联系我们</h2>
							<div class="w3ls_footer_grid_left1_pos">
								<h4 style="color: white">
									联系方式？不存在的。
								</h4>
							</div>
						</div>
					</div>
					<div class="col-md-6 w3ls_footer_grid_right">
						<a href="index.html">
							<h2>Fake<span>Douban</span></h2></a>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="col-md-5 w3ls_footer_grid1_left">
					<p>
						Powered By Team No.10
					</p>
				</div>
				<div class="col-md-7 w3ls_footer_grid1_right">
					<ul>
						<li>
							<a href="/FakeDouban/admin">后台管理界面入口</a>
						</li>
						
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</footer>
 	<script src="/FakeDouban/js/bootstrap.min.js"></script>
		<script>
			$(document).ready(function() {
				$(".dropdown").hover(
					function() {
						$('.dropdown-menu', this).stop(true, true).slideDown("fast");
						$(this).toggleClass('open');
					},
					function() {
						$('.dropdown-menu', this).stop(true, true).slideUp("fast");
						$(this).toggleClass('open');
					}
				);
			});
		</script>
		<!-- //Bootstrap Core JavaScript -->
		<!-- here stars scrolling icon -->
		<!--  --><script type="text/javascript">
			$(document).ready(function() {
				/*
					var defaults = {
					containerID: 'toTop', // fading element id
					containerHoverID: 'toTopHover', // fading element hover id
					scrollSpeed: 1200,
					easingType: 'linear' 
					};
				*/

				$().UItoTop({
					easingType: 'easeOutQuart'
				});

			});
		</script>
		<!-- //here ends scrolling icon -->
	</body>

</html>