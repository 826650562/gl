<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">

<head>
<title>3D锅炉</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- VENDOR CSS -->
<link rel="stylesheet" href="${basePath}/static/layui/css/layui.css">
<link rel="stylesheet"
	href="${basePath}/static/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${basePath}/static/assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${basePath}/static/assets/vendor/linearicons/style.css">
<link rel="stylesheet"
	href="${basePath}/static/assets/vendor/toastr/toastr.min.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="${basePath}/static//assets/css/jq22.css">
<link rel="stylesheet"
	href="${basePath}/static//assets/css/checkout.css">
<link rel="stylesheet" href="${basePath}/static/assets/css/main.css">
<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
	rel="stylesheet">
<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76"
	href="${basePath}/static/assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="${basePath}/static/assets/img/favicon.png">
<script src="${basePath}/static/layui/layui.js"></script>
<style>
.plus-tag-add a.plus {
	background-position: -289px -96px;
	font-size: 14px;
}
.plus-tag-add a {
    font-size: 14px;
}
</style>
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="../page/index"> <img
					src="${basePath}/static/assets/img/logo_white_2.png"
					class="img-responsive logo">
				</a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth">
						<i class="lnr lnr-arrow-left-circle"></i>
					</button>
				</div>
			</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="index.html"> <i class="fa fa-folder"></i> <span>锅炉及案例</span>
						</a></li>
						<li><a href="addmodel.html"> <i class="fa fa-cube"></i> <span>添加3D模型</span>
						</a></li>
						<li><a href="index.html" class="active" class=""> <i
								class="fa fa-briefcase"></i> <span>添加案例</span>
						</a></li>
						<li><a href="index.html" class=""> <i class="fa fa-file"></i>
								<span>规范管理</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content add">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<h3>编辑案例</h3>
							<div class="form-group">
								<label for="case-name">案例名称:</label> <input type="text"
									class="form-control" id="case-name" placeholder="请输入新建部件的名称...">
							</div>
							<div class="form-group">
								<label for="case-type">案例类别:</label> <select id="case-type"
									class="form-control">
									<c:forEach var="stu" items="${_types}">
										<option value='<c:out value="${stu}"/>'>
										<c:out value="${stu}" /></option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label>添加标签:</label>
								<div class="demo">

									<div class="plus-tag tagbtn clearfix" id="myTags"
										style="display: none;">
										<a value="-1" title="Travel" href="javascript:void(0);"> <span>Travel</span>
											<em></em>
										</a>
									</div>

									<div class="plus-tag-add">
										<form id="" action="" class="login">
											<ul class="Form FancyForm clearfix" style="margin-bottom:0;">
												<li><input id="" name="" type="text"
													class="form-control" maxlength="20" id=""
													placeholder="请输入新建标签名..."></li>
												<li>
													<button type="button" class="btn btn-primary">添加临时标签</button>
													<button type="button"  id="new_casetage" class="btn btn-primary">新增标签</button>
													<a href="javascript:void(0);" class="plus">收起标签</a>
												</li>
											  
											</ul>
										</form>
									</div>
									<!--plus-tag-add end-->

									<div id="mycard-plus">
										<div class="default-tag tagbtn">
											<div class="clearfix nowtips">
											
												<c:forEach var="stu" items="${_tages}">
												    <a value="-1" title="${stu}" href="javascript:void(0);"
													    class="selected"> <span>${stu}</span> <em></em> </a>		
												</c:forEach>
												
											</div>
										</div>
										<!--mycard-plus end-->
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="">封面文件:</label>
								<div class="demo">
									<div class="upload-img"
										style="position:relative;margin-left:0;">
										<input type="file">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label>部件简介说明:</label>
								<div class="demo">
									<div id="bj-editor"></div>
								</div>
							</div>
							<div class="form-group" style="float: right;margin-bottom: 0px;">
								<button id="submit" type="button" class="btn btn-primary">保存</button>
								<button type="button" class="btn btn-danger">返回</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="success-modal" tabindex="-1"
				role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-body">
						<div class="alert alert-success alert-dismissible" role="alert"
							style="font-size: 16px;">
							<button type="button" class="close" style="top:2px;"
								data-dismiss="alert" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<i class="fa fa-check-circle"></i>&nbsp;新建成功！
						</div>
					</div>
				</div>
			</div>

			<div class="modal fade" id="alert-modal" tabindex="-1" role="dialog"
				aria-labelledby="modalTitleId" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-body">
						<div class="alert alert-danger alert-dismissible" role="alert"
							style="font-size: 16px;">
							<button type="button" class="close" style="top:2px;"
								data-dismiss="alert" aria-label="Close">
								<span aria-hidden="true"><i class="fa fa-times-circle"></i></span>
							</button>
							<i class="fa fa-exclamation"></i> <label></label>
						</div>
					</div>
				</div>
			</div>

			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>

	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="${basePath}/static/assets/vendor/jquery/jquery.min.js"></script>
	<script
		src="${basePath}/static/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${basePath}/static/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="${basePath}/static/assets/scripts/klorofil-common.js"></script>
	<script src="${basePath}/static/assets/vendor/toastr/toastr.min.js"></script>
	<script src="${basePath}/static/assets/scripts/jq22.js"></script>
	<script>
		layui.use([ 'layedit', 'table', 'form', 'laypage' ], function() {
			var layedit = layui.layedit;
			layedit.build('bj-editor'); //建立编辑器
		});
	
		function getTipsStr() {
			var caseTipsArr = [];
			$('#myTags').find('a').each(function() {
				var tipVal = $(this).attr('title');
				caseTipsArr.push(tipVal);
			});
			var caseTipsStr = caseTipsArr.toString();
			return caseTipsStr;
		}
	
		function submitCase(caseName, caseType, caseBrief, caseTips) {
			$.ajax({
				type : 'post',
				url : "${basePath}/home/subCase",
				data : {
					caseName : caseName,
					caseType : caseType,
					caseBrief : caseBrief,
					caseTips : caseTips,
				},
				async : false,
				cache : false,
				contentType : "application/x-www-form-urlencoded",
				success : function(data) {
					$('#success-modal').modal('show');
					$('.alert').click(function() {
						$('#success-modal').modal('hide');
					});
				},
				error : function(data) {
					console.log("error:" + data.responseText);
				}
			});
		}
	
		$('#submit').click(function() {
			var caseName = $("#case-name").val();
			var caseType = $.trim($("#case-type").find("option:selected").text());
			var caseBrief = $.trim($('#bj-editor').siblings('.layui-layedit').find('iframe').contents().find('body').html());
			var caseTips = getTipsStr();
	
			if (caseName == '') {
				$('#alert-modal').on('show.bs.modal', function(e) {
					$('#alert-modal .alert').text('案例名称不能为空');
				});
				$('#alert-modal').modal('show');
				return false;
			} else {
				submitCase(caseName, caseType, caseBrief, caseTips);
			}
		});
		
		$("#new_casetage").click(function(){
		   
		});
		
	</script>
</body>

</html>
