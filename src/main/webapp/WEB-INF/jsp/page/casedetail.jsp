<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
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
<link rel="stylesheet" href="${basePath}/home/css/core.css">
<!-- Theme shortcodes/elements style -->
<link rel="stylesheet"
	href="${basePath}/home/css/shortcode/shortcodes.css">

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
									<li><a href="${basePath}/page/index#shouye">首页</a></li>
									<li><a href="${basePath}/page/index#list_mode">模型展示</a></li>
									<li><a target="_blank" href="${basePath}/page/search_fl">法规搜索</a></li>
									<li><a href="${basePath}/page/index#list_case">案例集锦</a></li>
									<li><a href="javascript:;">计算工具</a></li>

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

	<div class="service-area pt-30">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12 text-center gljjtitle"></div>
			</div>
			<div class="row">
				<div class="col-md-12 col-sm-12">
					<div class="z-row">
						<div class="z-col"></div>
						<div class="caselabelbox"></div>
						<div class="z-col"></div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 col-sm-12">
					<div class="z-row">
						<div class="z-col"></div>
						<div class="casexxbq sslb">所属类别：</div>
						<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
						<div class="casexxbq case_fbsj">发布时间：2018-02-12 12:09</div>
						<div class="z-col bianji"></div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- breadcrumb start -->
	<div class="service-area pb-30">
		<div class="container">
			<div class="row mar0">
				<div class="col-md-12 col-sm-12 casenrcont"></div>
			</div>
		</div>
	</div>
	<!-- breadcrumb end -->

   <jsp:include page="./footer.jsp" flush="true"></jsp:include>

	<!-- Modal -->
	<div class="modal fade" id="productModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close diaclose" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
				</div>
				<div class="modal-body"></div>
			</div>
		</div>
	</div>
	<!-- Modal end -->
	<!-- jquery latest version -->
	<script src="${basePath}/home/js/vendor/jquery-1.12.0.min.js"></script>
	<!-- Bootstrap framework js -->
	<script src="${basePath}/home/js/bootstrap.min.js"></script>
	<!-- ajax-mail js -->
	<script src="${basePath}/home/js/ajax-mail.js"></script>
	<!-- owl.carousel js -->
	<script src="${basePath}/home/js/owl.carousel.min.js"></script>
	<!-- owl.carousel js -->
	<script src="${basePath}/home/js/jquery-ui.min.js"></script>
	<!-- jquery.nivo.slider js -->
	<script src="${basePath}/home/js/jquery.nivo.slider.pack.js"></script>
	<!-- All js plugins included in this file. -->
	<script src="${basePath}/home/js/plugins.js"></script>
	<!-- Main js file that contents all jQuery plugins activation. -->
	<script src="${basePath}/home/js/main.js"></script>
</body>

<script>
	$(function() {

		var tag_id = "${tag_id}";
		if (tag_id) {
			getCaseInfoByid();
		}

		function getCaseInfoByid() {
			$.ajax({
				type : "POST",
				url : "../home/loadCase",
				async : false,
				cache : false,
				data : {
					_id : tag_id
				},
				contentType : "application/x-www-form-urlencoded",
				success : function(data) {
					var res = JSON.parse(data)[0];
					fullHmtl(res);
				},
				error : function(data) {
					console.log("error:" + data.responseText);
				}
			});
		}

		function fullHmtl(res) {
			//console.info(res);
			$(".gljjtitle").text(res.name);
			tips = res.tips.split(",");
			var html = "所属类别：";
			tips.map(function(item) {
				html += "<span>" + item + "</span>";
			});
			//$(".bianji").html(html);
			$(".sslb").text(res.type);
			$(".case_fbsj").text("发布时间：" + res.date);
			$(".casenrcont").html(res.brief);
		}

	})
</script>

</html>