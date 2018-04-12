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
<link rel="stylesheet" href="${basePath}/static/layui/css/layui.css">
<link rel="stylesheet" href="${basePath}/home/css/custom.css">
<script src="${basePath}/static/layui/layui.js"></script>

<link href="${basePath}/home/css/z-layout.css" rel="stylesheet">
<link href="${basePath}/home/css/style.css" rel="stylesheet">
<!-- Modernizr JS -->
<script src="${basePath}/home/js/vendor/modernizr-2.8.3.min.js"></script>
<style>
.case_content {
	width: 1000px;
	margin: auto;
	height: 800px;
	padding: 10px 5px;
}

.allb_title {
	font-size: 20px;
	float: left
}

.blog-info {
	padding: 20px 25px 30px 0px;
}
</style>
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

	<div class="row case_content">
		<div class="allb_title">案例列表</div>
		<div class="row case_lists"></div>
		<div id="page2"></div>
	</div>

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
		getCaseInfoByid();
		function getCaseInfoByid() {
			$.ajax({
				type : "POST",
				url : "../home/loadCase",
				async : false,
				cache : false,
				success : function(data) {
					var res = JSON.parse(data);
					var count = res.length;
					var fenLen = 4
					var htmls = [];
					res.reverse();
					res.map(function(item, index) {
						htmls.push(getHtmlModel(item, index));
					});
					if (htmls.length <= 0) {
						$(".case_lists").html("暂无数据！");
					} else {
						layui.use([ 'layedit', 'table', 'form', 'laypage' ], function() {
							var laypage = layui.laypage;
							laypage.render({
								elem : 'page2',
								count : count,
								limit : fenLen,
								layout : [ 'count', 'prev', 'page', 'next', 'skip' ],
								jump : function(obj, first) {
									//首次不执行
									if (!first) {
										$(".case_lists").html(gethtml(htmls, obj.curr, fenLen));
									} else {
										$(".case_lists").html(gethtml(htmls, 1, fenLen));
									}
								//addEvenlister_case();
								}
							});

						});
					}

				},
				error : function(data) {
					console.log("error:" + data.responseText);
				}
			});
		}

		function gethtml(html, cur, len) {
			var h = "";
			var be = (cur - 1) * len;
			var end = cur * len;
			for (var i = 0; i < html.length; i++) {
				if (i >= be && i < end) {
					h += html[i];
				}
			}
			return h;
		}

		function getHtmlModel(item) {
			return '	<div class="col-lg-12">' +
				'<div class="blog-wrapper mb-30">' +
				'<div class="blog-info">' +
				'<h3> <a href="../page/casedetail?tag_id=' + item.id + '">' + item.name + '</a> </h3>' +
				'<div class="blog-meta">' +
				'<span class="f-left">' + item.date + '</span> <span class="f-right"><a' +
				'href="../page/casedetail?tag_id=' + item.id + '">查看详情</a></span> </div>' +
				'</div> </div> </div>';
		}


	})
</script>

</html>