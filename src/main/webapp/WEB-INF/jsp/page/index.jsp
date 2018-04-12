<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>锅炉信息集成系统</title>
<link rel="icon" href="${basePath}/home/images/favicon.png">
<link href="${basePath}/home/fontawesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Bootstrap framework main css -->
<link rel="stylesheet" href="${basePath}/home/css/bootstrap.min.css">
<!-- This core.css file contents all plugings css file. -->
<link rel="stylesheet" href="${basePath}/home/css/core.css">
<!-- Theme shortcodes/elements style -->
<link rel="stylesheet"
	href="${basePath}/home/css/shortcode/shortcodes.css">
<!-- Theme main style -->
<!-- Responsive css -->
<link rel="stylesheet" href="${basePath}/home/css/responsive.css">
<!-- User style -->
<link rel="stylesheet" href="${basePath}/home/css/custom.css">
<link href="${basePath}/home/css/z-layout.css" rel="stylesheet">
<link href="${basePath}/home/css/style.css" rel="stylesheet">
<!-- Modernizr JS -->
<script src="${basePath}/home/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
	<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->
	<!-- header start -->
	<header class="header-pos header-2">
		<div class="header-area header-middle">
			<div class="header-pad">
				<div class="row">
					<div class="col-md-2 col-sm-12 col-xs-12">
						<div class="logo logo-2">
							<a href="index.html"><img
								src="${basePath}/home/images/logo.png" alt="" /></a>
						</div>
					</div>
					<div class="col-md-10 col-sm-12 col-xs-12 text-right xs-center">
						<div
							class="main-menu menu-style-2 display-inline hidden-sm hidden-xs">
							<nav>
								<ul>

									<li><a href="#shouye">首页</a></li>
									<li><a href="#list_mode">模型展示</a></li>
									<li><a target="_blank" href="${basePath}/page/search_fl">法规搜索</a></li>
									<li><a href="#list_case">案例集锦</a></li>
									<li><a href="shop.html">计算工具</a></li>

									<div class="shopping-cart ml-20 display-inline p-0 ptb-15">
										<div>
											<i class="fa fa-search fa-fw"></i>&nbsp;搜索
										</div>
										<ul>
											<li>
												<form action="#" id="searchbox">
													<input type="text" placeholder="Search" />
													<button class="button-search"></button>
												</form>
											</li>
										</ul>
									</div>
									<div class="setting-menu display-inline m-0 ptb-15">
										<div class="icon-nav current">
											<i class="fa fa-user-circle-o fa-fw"></i>&nbsp;用户
										</div>
										<ul class="content-nav toogle-content">
											<li class="currencies-block-top"><a href="#"
												class="yhdl"><i class="fa fa-user fa-fw"></i>&nbsp;用户登录</a>
											</li>
											<li class="currencies-block-top"><a href="#"
												class="yhdl"><i class="fa fa-sign-in fa-fw"></i>&nbsp;用户注册</a>
											</li>
										</ul>
									</div>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- header end -->

	<!-- slider-container start -->
	<div class="slider-container">
		<!-- Slider Image -->
		<div id="shouye"></div>
		<div id="mainSlider" class="nivoSlider slider-image">
			<img src="${basePath}/home/images/slider/2.jpg" alt=""
				title="#htmlcaption0" /> <img
				src="${basePath}/home/images/slider/1.jpg" alt=""
				title="#htmlcaption1" /> <img
				src="${basePath}/home/images/slider/4.jpg" alt=""
				title="#htmlcaption2" /> <img
				src="${basePath}/home/images/slider/3.jpg" alt=""
				title="#htmlcaption3" />
		</div>
		<!-- Slider Caption 1 -->

		<c:forEach items="${modes}" var="i" begin="0" end="4" varStatus="id">
			<div id="htmlcaption${id.index}"
				class="nivo-html-caption slider-caption-${id.index}">
				<div class="container">
					<div class="slide1-text slider-style-2">
						<div class="middle-text">
							<div class="cap-dec cap-1 wow bounceInRight"
								data-wow-duration="0.9s" data-wow-delay="0s">
								<h2>
									<strong>${i.name}</strong>
								</h2>
							</div>
							<div class="cap-text wow bounceInRight" data-wow-duration="1.2s"
								data-wow-delay="0.3s">${i.jianjie}</div>
							<div class="cap-readmore wow bounceInUp" data-wow-duration="1.3s"
								data-wow-delay=".5s">
								<a href="${basePath}/page/detail?tag_id=${i.id}">查看详情</a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</c:forEach>
		<div id="list_mode"></div>
		<!-- Slider Caption 2 -->





	</div>

	<!-- slider-container end -->
	<!-- new-arrival-area start -->
	<div class="new-arrival-area pt-60 pb-60">
		<div class="container">
			<div class="row">
				<div class="section-title text-center mb-20">
					<h2>锅炉展示</h2>
				</div>
			</div>
			<!-- Tab panes -->
			<div class="row">

				<div class="tab-content">
					<div class="tab-pane active" id="home">
						<div class="product-carousel">
							<c:forEach items="${modes}" var="i" begin="0" end="4"
								varStatus="id">
								<div class="col-md-12">
									<div class="product-wrapper mb-40 mrg-nn-xs">
										<div class="product-img">
											<a href="#"><img
												src="${basePath}/uploadFiles/${i.fenmian}" alt="" /></a> <span
												class="new-label"><i class="fa fa-eye fa-fw"></i>12</span>
											<div class="product-action">
												<a href="${basePath}/page/detail?tag_id=${i.id}"><i
													class="fa fa-eye fa-fw"></i> 查看详情</a>
											</div>
										</div>
										<div class="product-content">
											<div class="pro-title">
												<h3>
													<a href="${basePath}/page/detail?tag_id=${i.id}">${i.name}</a>
												</h3>
											</div>
										</div>
									</div>
								</div>

							</c:forEach>
						</div>

					</div>
					<div class="tab-pane" id="profile">
						<div class="product-carousel">

							<div class="col-md-12">
								<div class="product-wrapper mb-40 mrg-nn-xs">
									<div class="product-img">
										<a href="#"><img
											src="${basePath}/home/images/product/3.jpg" alt="" /></a> <span
											class="new-label"><i class="fa fa-eye fa-fw"></i>12</span>
										<div class="product-action">
											<a href="#"><i class="fa fa-eye fa-fw"></i> 查看详情</a>
										</div>
									</div>
									<div class="product-content">
										<div class="pro-title">
											<h3>
												<a href="#">LSS贯流式锅炉</a>
											</h3>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="product-wrapper mb-40 mrg-nn-xs">
									<div class="product-img">
										<a href="#"><img
											src="${basePath}/home/images/product/2.jpg" alt="" /></a> <span
											class="new-label"><i class="fa fa-eye fa-fw"></i>12</span>
										<div class="product-action">
											<a href="#"><i class="fa fa-eye fa-fw"></i> 查看详情</a>
										</div>
									</div>
									<div class="product-content">
										<div class="pro-title">
											<h3>
												<a href="#">LSS贯流式锅炉</a>
											</h3>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="product-wrapper mb-40 mrg-nn-xs">
									<div class="product-img">
										<a href="#"><img
											src="${basePath}/home/images/product/1.jpg" alt="" /></a> <span
											class="new-label"><i class="fa fa-eye fa-fw"></i>12</span>
										<div class="product-action">
											<a href="#"><i class="fa fa-eye fa-fw"></i> 查看详情</a>
										</div>
									</div>
									<div class="product-content">
										<div class="pro-title">
											<h3>
												<a href="#">LSS贯流式锅炉</a>
											</h3>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="product-wrapper mb-40 mrg-nn-xs">
									<div class="product-img">
										<a href="#"><img
											src="${basePath}/home/images/product/4.jpg" alt="" /></a> <span
											class="new-label"><i class="fa fa-eye fa-fw"></i>12</span>
										<div class="product-action">
											<a href="#"><i class="fa fa-eye fa-fw"></i> 查看详情</a>
										</div>
									</div>
									<div class="product-content">
										<div class="pro-title">
											<h3>
												<a href="#">LSS贯流式锅炉</a>
											</h3>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="product-wrapper mb-40 mrg-nn-xs">
									<div class="product-img">
										<a href="#"><img
											src="${basePath}/home/images/product/5.jpg" alt="" /></a> <span
											class="new-label"><i class="fa fa-eye fa-fw"></i>12</span>
										<div class="product-action">
											<a href="#"><i class="fa fa-eye fa-fw"></i> 查看详情</a>
										</div>
									</div>
									<div class="product-content">
										<div class="pro-title">
											<h3>
												<a href="#">LSS贯流式锅炉</a>
											</h3>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>








		</div>
		<div class="z-row">
			<div class="z-col"></div>
			<div>
				<a href="javascript:alert('暂时没更多锅炉模型');" class="cksybtn">查看所有</a>
			</div>
			<div class="z-col"></div>
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<!-- new-arrival-area end -->
	<!-- service-area start -->
	<div class="service-area pt-60 pb-60 gray-bg">
		<div class="container">
			<div class="row">
				<div class="col-md-1 col-sm-0"></div>
				<div class="col-md-10 col-sm-12">
					<p class="text-center padB15">
						针对实际生产环境中常见的5种型号的锅炉，运用虚拟现实（VR）技术，制作了VR视频，运用先进的WebGL技术，制作了网页三维模型系统，配套开发了国家标准规范引用系统，最终实现了锅炉的在线展示和视频教学功能。
					</p>
				</div>
				<div class="col-md-1 col-sm-0"></div>
			</div>



			<div class="row">

				<div class="col-md-4 col-sm-6">
					<div class="z-row">
						<div class="z-col"></div>
						<div>
							<div class="service-icon">
								<i class="fa fa-cubes fa-2x"></i>
							</div>
						</div>
						<div class="z-col"></div>
					</div>
					<div class="z-row">
						<div class="z-col"></div>
						<div class="ptb-20">
							<h5>3D交互</h5>
						</div>
						<div class="z-col"></div>
					</div>
					<div class="z-row">
						<div class="z-col text-center">
							<p class="overlenhide">（1）使用业界权威参数化建模软件，1:1比例绘制锅炉3D模型；&nbsp;&nbsp;（2）巧妙结合WebGL前沿技术，实现在网页中对3D模型的预览、拖动、缩放等功能；&nbsp;&nbsp;（3）独有的锅炉零部件拆分、隐藏功能</p>
						</div>
					</div>
				</div>

				<div class="col-md-4 col-sm-6">
					<div class="z-row">
						<div class="z-col"></div>
						<div>
							<div class="service-icon">
								<i class="fa fa-video-camera fa-2x"></i>
							</div>
						</div>
						<div class="z-col"></div>
					</div>
					<div class="z-row">
						<div class="z-col"></div>
						<div class="ptb-20">
							<h5>VR视频</h5>
						</div>
						<div class="z-col"></div>
					</div>
					<div class="z-row">
						<div class="z-col text-center">
							<p>（1）使用业界流行的开发引擎，真实还原了锅炉组装、水循环、烟气循环等过程；&nbsp;&nbsp;（2）开发了水的流动、蒸发模型和蒸汽、烟气流动模型；&nbsp;&nbsp;（3）可配套使用HTC
								Vive VR头盔观看</p>
						</div>
					</div>
				</div>

				<div class="col-md-4 col-sm-6">
					<div class="z-row">
						<div class="z-col"></div>
						<div>
							<div class="service-icon">
								<i class="fa fa-pie-chart fa-2x"></i>
							</div>
						</div>
						<div class="z-col"></div>
					</div>
					<div class="z-row">
						<div class="z-col"></div>
						<div class="ptb-20">
							<h5>规范文件</h5>
						</div>
						<div class="z-col"></div>
					</div>
					<div class="z-row">
						<div class="z-col text-center">
							<p>（1）创建了锅炉行业国家标准规范数据库；&nbsp;&nbsp;（2）锅炉零部件与规范条文一
								一对应；&nbsp;&nbsp;（3）规范中的表格、公式、图片一应俱全</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- service-area end -->

	<!-- latest-blog-area start -->

	<div class="latest-blog-area ptb-60" id="list_case">
		<div class="container">
			<div class="row">
				<div class="section-title text-center mb-40">
					<h2>案例集锦</h2>
				</div>
			</div>

			<div class="row">
				<c:forEach items="${cases}" var="i" begin="0" end="4"
								varStatus="id">
				<div class="row case-list">
					<div class="col-lg-12">
						<div class="blog-wrapper mb-30">
							<div class="blog-info">
								<h3>
									<a href="../page/casedetail?tag_id=${i.id}">${i.name}</a>
								</h3>
								<div class="blog-meta">
									<span class="f-left">${i.date}</span> <span
										class="f-right"><a href="../page/casedetail?tag_id=${i.id}"  >查看详情</a></span>
								</div>
							</div>
						</div>
					</div>
				</div>
	</c:forEach>
			 


			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="z-row">
						<div class="z-col"></div>
						<div>
							<a href="../page/case_list" class="cksybtn">查看所有</a>
						</div>
						<div class="z-col"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- latest-blog-area end -->

      <jsp:include page="./footer.jsp" flush="true"></jsp:include>
	 
	<!-- jquery latest version -->
	<script src="${basePath}/home/js/vendor/jquery-1.12.0.min.js"></script>
	<!-- Bootstrap framework js -->
	<script src="${basePath}/home/js/bootstrap.min.js"></script>
	<!-- ajax-mail js -->
	<script src="${basePath}/home/js/ajax-mail.js"></script>
	<!-- owl.carousel js -->
	<script src="${basePath}/home/js/owl.carousel.min.js"></script>
	<!-- jquery.nivo.slider js -->
	<script src="${basePath}/home/js/jquery.nivo.slider.pack.js"></script>
	<!-- All js plugins included in this file. -->
	<script src="${basePath}/home/js/plugins.js"></script>
	<script src="${basePath}/home/js/main.js"></script>
	<script>
		$(function() {
			var len = $(".overlenhide").html().length;
			str = $(".overlenhide").html();
			var newstr = "";
			if (len > 80) {
				newstr = $(".overlenhide").html().substring(0, 80);
			}
			$(".overlenhide").html(newstr + "..." + "<span class='zk'>展开</span>");
			//console.log(len);
			$(".zk").click(function() {
				$(".overlenhide").html(str);
			});
	
		})
	</script>
</body>
</html>
