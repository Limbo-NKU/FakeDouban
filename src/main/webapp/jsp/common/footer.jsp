<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer>
		<div class="footer">
			<div class="container">
				<div class="w3ls_footer_grid">
					<div class="col-md-6 w3ls_footer_grid_left">
						<div class="w3ls_footer_grid_left1">
							<h2>联系我们</h2>
							<div class="w3ls_footer_grid_left1_pos">
								<h4 style="color: white">
									不好意思，我也不知道如何联系我们......
								</h4>
							</div>
						</div>
					</div>
					<div class="col-md-6 w3ls_footer_grid_right">
						<a href="index.html">
							<h2>One<span>Movies</span></h2></a>
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
							<a href="genres.html">Movies</a>
						</li>
						<li>
							<a href="faq.html">FAQ</a>
						</li>
						<li>
							<a href="horror.html">Action</a>
						</li>
						<li>
							<a href="genres.html">Adventure</a>
						</li>
						<li>
							<a href="comedy.html">Comedy</a>
						</li>
						<li>
							<a href="icons.html">Icons</a>
						</li>
						<li>
							<a href="contact.html">Contact Us</a>
						</li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</footer>
 	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
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
		<script type="text/javascript">
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