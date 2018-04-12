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
<!-- Responsive css -->
<link rel="stylesheet" href="${basePath}/home/css/responsive.css">
<!-- User style -->
<link rel="stylesheet" href="${basePath}/home/css/custom.css">
<link rel="stylesheet" href="${basePath}/home/layui/css/layui.css">
<link href="${basePath}/home/css/z-layout.css" rel="stylesheet">
<link href="${basePath}/home/css/style.css" rel="stylesheet">
<!-- Modernizr JS -->
<style type="text/css">
#productModal .modal-dialog {
	min-height: 500px;
	width: 750px;
}

.modal-content {
	min-height: 500px;
}
</style>
<script src="${basePath}/home/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
	<jsp:include page="../head.jsp" flush="true"></jsp:include>
	<div class="blog-area">
		<div class="contfluidpad">
			<form class="layui-form" action="">
				<div class="row">
					<!------>
					<div class="col-md-2 col-sm-3">
						<div class="column pad15">
							<div class="sidebar-widget mar0">
								<button data-toggle="modal" data-target="#productModal"
									class="compare">
									<i class="fa fa-video-camera fa-fw"></i>&nbsp;VR视频展示
								</button>
							</div>
							<h2 class="title-block">
								<div class="z-row padLR20">
									<div>名称</div>
									<div class="z-col"></div>
									<div
										style="font-size:14px; padding:0px 10px 0px 0px; font-weight:normal;">隐藏</div>
									<div>
										<input type="checkbox" lay-skin="primary"  lay-filter="allChecked" >
									</div>
								</div>
							</h2>
							<div class="sidebar-widget mar0">
								<ul class="sidebar-menu">
								</ul>
							</div>
						</div>
					</div>
					<!------>

					<div class="col-md-10 col-sm-9">
						<div class="blog-wrapper blog-main mb-20">
							<div class="col-md-12 col-sm-12 pad0">
								<h2 class="page-heading mt-40">
									<span class="cat-name"><span class="moode_name"></span>简介</span>
								</h2>
							</div>
							<div class="col-md-12 col-sm-12 pad0">
								<div class="row mar0 gljjcont">
									<div class="col-md-12 col-sm-12 jjnrcont"></div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-10 col-sm-9">
						<div class="row">
							<div class="col-md-6 col-sm-12">
								<!------>
								<div class="blog-wrapper blog-main mb-20">
									<div class="col-md-12 col-sm-12 dddbox">
										<iframe src="" id="modeContainer"
											style="background: #e6e6e6; min-height:500px ; min-width:845px"></iframe>
									</div>
								</div>
								<!------>
							</div>
							<div class="col-md-6 col-sm-12">
								<!------>
								<div class="blog-wrapper blog-main mb-20">
									<div class="col-md-12 col-sm-12 pad0">
										<h2 class="page-heading mt-40">
											<span class="cat-name">引用范例</span> <span data-toggle="modal"
												data-target="#xxxmodle" class="showmodlebtn"><i
												class="fa fa-eye fa-fw"></i>查看全部</span>
										</h2>
									</div>
									<div class="col-md-12 col-sm-12 pad0">
										<div class="row mar0 buxxcont">

											<div class="col-md-12 col-sm-12 jjnrcont part_detail">
												<p>请选择部件查看详情~</p>
												<%-- <p>
													1.是以立式水管布置的蒸汽锅炉。具有结构紧凑，热效率高及安装周期短，基建投资少等优点。<br>2.设置了温度控制、压力控制和液位控制，安全可靠。
												</p>
												<p>3.采用燃烧机顶置式，燃烧机喷出的火焰在炉膛内燃烧后经内圈下部出口进入内圈与二圈水管之间进行纵向冲刷后至上部，而后转弯至二圈与三圈内向下纵向冲刷，烟气通过三圈的烟道口进入省煤器，最后经烟囱排入</p>
												<p>
													<img src="${basePath}/home/images/other/img2.png">
												</p>
												<p>
													1.是以立式水管布置的蒸汽锅炉。具有结构紧凑，热效率高及安装周期短，基建投资少等优点。<br>
													设置了温度控制、压力控制和液位控制，安全可靠。<br>
													采用燃烧机顶置式，燃烧机喷出的火焰在炉膛内燃烧后经内圈下部出口进入内圈与二圈水管之间进行纵向冲刷后至上部，而后转弯至二圈与三圈内向下纵向冲刷，烟气通过三圈的烟道口进入省煤器，最后经烟囱排入的烟道口进入省煤器，最后经烟囱排入
												</p> --%>
											</div>
										</div>
									</div>
								</div>
								<!------>
							</div>
						</div>
					</div>

				</div>
			</form>
		</div>
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
	<!-- Modal -->
	<div class="modal fade" id="xxxmodle" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close diaclose" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">x</span>
					</button>
				</div>
				<div class="modal-body xxxmodle_body">

				</div>
			</div>
		</div>
	</div>
	<!-- Modal end -->
	<!-- jquery latest version -->
	<script src="${basePath}/home/js/vendor/jquery-1.12.0.min.js"></script>
	<!-- Bootstrap framework js -->
	<script src="${basePath}/home/js/bootstrap.min.js"></script>
	<script src="${basePath}/home/layui/layui.js"></script>
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
 
	<script type="text/javascript">
		var tag_id = "${tag_id}";
		var h = $("<a class='tag_id' _id=" + tag_id + "></a>");
		$('body').append(h);
	</script>
	<script src="${basePath}/home/js/detail.js"></script>

</body>
</html>