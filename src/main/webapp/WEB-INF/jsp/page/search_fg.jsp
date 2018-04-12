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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="${basePath}/static/layui/css/layui.css">
<link rel="stylesheet"
	href="${basePath}/static/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${basePath}/static/assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${basePath}/static/assets/vendor/linearicons/style.css">
<link rel="stylesheet"
	href="${basePath}/static/assets/vendor/toastr/toastr.min.css">
<link rel="stylesheet" href="${basePath}/static/assets/css/z-layout.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="${basePath}/static/assets/css/checkout.css">
<link rel="stylesheet" href="${basePath}/static/assets/css/main.css">
<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
	rel="stylesheet">

<script src="${basePath}/static/layui/layui.js"></script>
<script src="${basePath}/static/assets/vendor/jquery/jquery.min.js"></script>
<script
	src="${basePath}/static/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${basePath}/static/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>

<title>法规搜索</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<!-- breadcrumb start -->
	<div class="service-area pb-20">
		<div class="container">

			<div class="z-row padT20">
				<div class="z-col gljjtitle text-center">东莞特检法规搜索</div>
			</div>

			<div class="z-row">
				<div class="z-col"></div>
				<div>
					<div class="z-row">
						<div class="z-col">
							<input type="text" class="ymssinput" id="guanjianci"
								placeholder="请输入搜索关键词">
						</div>
						<div class="z-col">
							<button class="layui-btn layui-btn-normal ymssbtn">搜索</button>
						</div>
					</div>
				</div>
				<div class="z-col"></div>
			</div>

		</div>
	</div>
	<!-- breadcrumb end -->

	<div class="service-area pb-30">
		<div class="container">
			<div class="z-row  ">
				<div class="z-col"></div>
				<div class="padLR5">
					<span class="ymssjsbor  ymssjs " id="allRes">全部</span>
				</div>
				<div class="padLR5">
					<span class="ymssjsbor" id="allNowRes">现行</span>
				</div>
				<div class="padLR5">
					<span class="ymssjsbor" id="allResGo">废止</span>
				</div>
				<div class="padLR5">
					<span class="ymssjsbor" id="allReplace">被替代</span>
				</div>
				<div class="z-col"></div>
			</div>

			<div class="search_contiren"></div>
			<div id="search_page"></div>
			<div class="z-row">
				<div class="form-group" style="float: right;margin-bottom: 0px;">
		 
				</div>
				<div class="z-col"></div>
			</div>
		</div>
	</div>
	<script>
		$(function() {
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
			var _searchRes = {};
			//插入规范的搜索
			$(".ymssbtn").unbind().click(function() {
				var guanjianci = $.trim($("#guanjianci").val());
				if (guanjianci) {
					$.ajax({
						type : "POST",
						url : "${basePath}/home/search_guifanParPlus",
						data : {
							_gjz : guanjianci,
						},
						async : false,
						cache : false,
						contentType : "application/x-www-form-urlencoded",
						success : function(data) {
							_searchRes = JSON.parse(data);
							$("#search_page").show();
							listOfseach(_searchRes);
						},
						error : function(data) {
							console.log("error:" + data.responseText);
						}
					});
				}
	
			});
	
			function listOfseach(res) {
				var _hr = [];
				res.map(function(item) {
					_hr.push(my_getHtml(item));
				});
				var len = _hr.length;
				if (len <= 0) {
					$(".search_contiren").html("<font>无搜索结果</font>");
				} else {
					//分页
					var fenLen = 7;
					layui.use([ 'laypage', 'layer' ], function() {
						var laypage = layui.laypage,
							layer = layui.layer;
						//总页数低于页码总数
						laypage.render({
							elem : "search_page",
							count : len, //数据总数,
							limit : fenLen,
							groups : 2,
							theme : "#01aaff",
							jump : function(obj, first) {
								//首次不执行
								if (!first) {
									$(".search_contiren").html(gethtml(_hr, obj.curr, fenLen));
									_addEvenlister()
								}
	
							}
						});
					})
				}
				$(".search_contiren").html(gethtml(_hr, 1, fenLen));
				_addEvenlister();
			}
			var _current_id = null;
			function _addEvenlister() {
				$(".ssjgitem").unbind().click(function() {
					$(".ssjgitem").css("border", "none");
					$(this).css("border", "1px #1b1b1b solid");
					_current_id = $(this).html();
				});
	
			 
	
	
				$("#allRes").unbind().click(function() {
					listOfseach(_searchRes);
				});
	
				$("#allNowRes").unbind().click(function() {
					type_(this);
				});
				$("#allResGo").unbind().click(function() {
					type_(this);
				});
				$("#allReplace").unbind().click(function() {
					type_(this);
				});
				function type_(s) {
					$(".ymssjsbor").removeClass("ymssjs");
					$(s).addClass("ymssjs");
					var temp = [];
					var _type = $(s).text();
					for (var i = 0; i < _searchRes.length; i++) {
						if (_searchRes[i].type == _type) {
							temp.push(_searchRes[i]);
						}
					}
					listOfseach(temp);
					if (temp.lenth > 0) $("#search_page").show();
					else $("#search_page").hide();
				}
	
	
			}
			function my_getHtml(d) {
				return '<div _id=' + d.id + ' class="z-row ssjgitem">' +
					'<div class="z-col">' +
					'<a href="javascript::">' +
					'<div class="z-row">' +
					' <div class="z-col padTB5"><span class="ssjgtitle">' + d.gfName + '  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  类型：' + d.type + '  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 优先级：' + d.youxianji + '</span></div>' +
					'</div>' +
					'<div class="z-row">' +
					'<div class="z-col padTB5">章节：' + d.nodeName + ' </div>' +
					' </div>' +
					'<div class="z-row">' +
					' <div class="z-col ssjgtxt padTB5"> ' + d.content + '</div>' +
					' </div> </a> </div>  </div>';
			}
	
		})
	</script>

</body>
</html>