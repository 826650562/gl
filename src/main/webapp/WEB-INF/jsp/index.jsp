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
<link rel="stylesheet" href="${basePath}/static/assets/css/checkout.css">
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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${basePath}/static/layui/layui.js"></script>
<script src="${basePath}/static/assets/scripts/home_index.js"></script>
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="index.html"> <img
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
						<li><a href="index.html" class="active"> <i
								class="fa fa-folder"></i> <span>锅炉及案例</span>
						</a></li>
						<li><a href="addmodel.html" class=""> <i
								class="fa fa-cube"></i> <span>添加3D模型</span>
						</a></li>
						<li><a href="${basePath }/home/case" class=""> <i
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
			<div class="main-content pot-index">
				<div class="container-fluid">
					<div class="row">
						<div class="type col-md-12" style="display: flex;">
							<select name="" id="_select_guoluType" class="form-control"
								style="margin-right:10px;">
								<c:forEach var="stu" items="${_types}">
									<option value='<c:out value="${stu}"/>'><c:out
											value="${stu}" /></option>
								</c:forEach>
							</select>
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#newModal" style="margin-right:10px;">
								新建锅炉类型</button>
							<button type="button" class="btn btn-danger" data-toggle="modal"
								data-target="#del-confirm-model" style="margin-right:10px;">
								删除锅炉类型</button>
							<button type="button" class="btn btn-secondary"
								data-toggle="modal" data-target="#importModal"
								style="margin-right:10px;">
								<a href="${basePath }/home/addmodel">新建锅炉模型</a>
							</button>
							<button type="button" class="btn btn-info"
								style="margin-right:10px;">新建案例</button>
						</div>
					</div>
					<div class="model row">
						<div class="col-md-12">
							<!-- PANEL DEFAULT -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">锅炉模型</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse">
											<i class="lnr lnr-chevron-up"></i>
										</button>
										<button type="button" class="btn-remove">
											<i class="lnr lnr-cross"></i>
										</button>
									</div>
								</div>
								<div class="panel-body">
									<table id="pot-model" class="table table-bordered table-hover">
										<thead>
											<tr>
												<th scope="col">ID</th>
												<th scope="col">标题</th>
												<th scope="col">封面</th>
												<th scope="col">类别</th>
												<th scope="col">视频</th>
												<th scope="col">操作</th>
											</tr>
										</thead>
										<tbody id="listOfGuolu">
											 
										</tbody>
									</table>
									<div id="page1"></div>
								</div>
							</div>
							<!-- END PANEL DEFAULT -->
						</div>
					</div>
					<div class="case row">
						<div class="col-md-12">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">锅炉案例</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse">
											<i class="lnr lnr-chevron-up"></i>
										</button>
										<button type="button" class="btn-remove">
											<i class="lnr lnr-cross"></i>
										</button>
									</div>
								</div>
								<div class="panel-body">
									<table id="pot-model" class="table table-bordered table-hover">
										<thead>
											<tr>
												<th scope="col">ID</th>
												<th scope="col">标题</th>
												<th scope="col">封面</th>
												<th scope="col">类别</th>
												<th scope="col">关键字</th>
												<th scope="col">时间</th>
												<th scope="col">操作</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">1</th>
												<td>MDS锅炉</td>
												<td><img
													src="${basePath}/static/assets/img/fengmian.png" alt=""
													style="width: 40px;height:40px;"></td>
												<td>锅壳锅炉</td>
												<td>特种设备,事故案例</td>
												<td>17-11-11</td>
												<td>
													<button type="button" class="btn btn-light watch">查看</button>
													<button type="button" class="btn btn-primary">修改</button>
													<button type="button" class="btn btn-danger">删除</button>
												</td>
											</tr>

										</tbody>
									</table>
									<div id="page2"></div>
								</div>
							</div>
							<!-- END PANEL DEFAULT -->
						</div>
					</div>


					<!-- 新建类型 Modal -->
					<div class="modal fade" id="newModal" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									新建锅炉类型
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<input class="form-control" id="_gltype"
										placeholder="请输入新建锅炉类型..." type="text">
								</div>
								<div class="modal-footer">
									<font color="red" id="_msg" style="float:left"></font>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">关闭</button>
									<button id="new" type="button"
										class="btn btn-primary saveModeType">保存</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 删除类型modal -->
					<div class="modal fade" id="delModal" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									删除锅炉类型
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<ul id="del-list" class="list-group">
										<li class="list-group-item"><label class="fancy-checkbox"><input
												type="checkbox"><span></span></label>Cras justo odio</li>
										<li class="list-group-item"><label class="fancy-checkbox"><input
												type="checkbox"><span></span></label>Dapibus ac facilisis in</li>
										<li class="list-group-item"><label class="fancy-checkbox"><input
												type="checkbox"><span></span></label>Morbi leo risus</li>
										<li class="list-group-item"><label class="fancy-checkbox"><input
												type="checkbox"><span></span></label>Cras justo odio</li>
										<li class="list-group-item"><label class="fancy-checkbox"><input
												type="checkbox"><span></span></label>Dapibus ac facilisis in</li>
										<li class="list-group-item"><label class="fancy-checkbox"><input
												type="checkbox"><span></span></label>Morbi leo risus</li>
										<li class="list-group-item"><label class="fancy-checkbox"><input
												type="checkbox"><span></span></label>Cras justo odio</li>
										<li class="list-group-item"><label class="fancy-checkbox"><input
												type="checkbox"><span></span></label>Dapibus ac facilisis in</li>
										<li class="list-group-item"><label class="fancy-checkbox"><input
												type="checkbox"><span></span></label>Morbi leo risus</li>
										<li class="list-group-item"><label class="fancy-checkbox"><input
												type="checkbox"><span></span></label>Cras justo odio</li>
										<li class="list-group-item"><label class="fancy-checkbox"><input
												type="checkbox"><span></span></label>Dapibus ac facilisis in</li>
										<li class="list-group-item"><label class="fancy-checkbox"><input
												type="checkbox"><span></span></label>Morbi leo risus</li>
										<li class="list-group-item"><label class="fancy-checkbox"><input
												type="checkbox"><span></span></label>Cras justo odio</li>
										<li class="list-group-item"><label class="fancy-checkbox"><input
												type="checkbox"><span></span></label>Dapibus ac facilisis in</li>
										<li class="list-group-item"><label class="fancy-checkbox"><input
												type="checkbox"><span></span></label>Morbi leo risus</li>
										<li class="list-group-item"><label class="fancy-checkbox"><input
												type="checkbox"><span></span></label>Cras justo odio</li>
										<li class="list-group-item"><label class="fancy-checkbox"><input
												type="checkbox"><span></span></label>Dapibus ac facilisis in</li>
										<li class="list-group-item"><label class="fancy-checkbox"><input
												type="checkbox"><span></span></label>Morbi leo risus</li>
										<li class="list-group-item"><label class="fancy-checkbox"><input
												type="checkbox"><span></span></label>Cras justo odio</li>
										<li class="list-group-item"><label class="fancy-checkbox"><input
												type="checkbox"><span></span></label>Dapibus ac facilisis in</li>
										<li class="list-group-item"><label class="fancy-checkbox"><input
												type="checkbox"><span></span></label>Morbi leo risus</li>
									</ul>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">关闭</button>
									<button id="del-btn" type="button" class="btn btn-danger"
										data-toggle="modal" data-target="#del-confirm-model">删除</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 删除确认model -->
					<div class="modal fade" id="del-confirm-model" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalCenterTitle"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header" style="color: #8a6d3b;">
									<i class="fa fa-warning"></i>警告
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body" id="deleType_msg"></div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">取消</button>
									<button type="button" class="btn btn-primary" id="delete_type">确认</button>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div class="main-content checkout">
				<div class="container-fluid">
					<div>
						<div class="row">
							<div class="col-md-12">
								<div style="display: flex;margin-bottom: 20px;">
									<input type="text" class="form-control form-control-sm" name=""
										id="pot-name" placeholder="锅炉名称"> <select
										class="form-control" style="margin-right:10px;">
										<option value="cheese">锅壳锅炉</option>
										<option value="tomatoes">水管锅炉</option>
									</select>
									<button type="button" id="change-pot"
										class="btn btn-primary btn-sm">修改</button>
									<button type="button" id="back" class="btn btn-light btn-sm">返回</button>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-3">
								<div style="min-height: 500px;">
									<table class="table table-hover">
										<thead style="background-color: #dee2e6">
											<tr>
												<th scope="col">图元</th>
												<th scope="col">选中</th>
												<th scope="col">隐藏</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">1</th>
												<td><label class="fancy-checkbox"> <input
														type="checkbox"> <span></span>
												</label></td>
												<td><label class="fancy-checkbox"> <input
														type="checkbox"> <span></span>
												</label></td>
											</tr>
											<tr>
												<th scope="row">2</th>
												<td><label class="fancy-checkbox"> <input
														type="checkbox"> <span></span>
												</label></td>
												<td><label class="fancy-checkbox"> <input
														type="checkbox"> <span></span>
												</label></td>
											</tr>
											<tr>
												<th scope="row">3</th>
												<td><label class="fancy-checkbox"> <input
														type="checkbox"> <span></span>
												</label></td>
												<td><label class="fancy-checkbox"> <input
														type="checkbox"> <span></span>
												</label></td>
											</tr>
										</tbody>
									</table>
								</div>

							</div>
							<div class="col-md-9">
								<div class="model-show"
									style="background: #e6e6e6; min-height:500px"></div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<button type="button" class="btn btn-primary btn-block">创建部件</button>
							</div>
						</div>
						<div class="row" style="margin-top: 35px">
							<div class="col-md-12">
								<div>编辑部件信息</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div style="display:flex; border: 1px solid #e6e6e6">
									<table class="table table-hover" style="width:20%">
										<thead style="background-color: #dee2e6">
											<tr>
												<th scope="col">部件</th>
												<th scope="col">隐藏</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">1</th>
												<td><label class="fancy-checkbox"> <input
														type="checkbox"> <span></span>
												</label></td>
											</tr>
											<tr>
												<th scope="row">2</th>
												<td><label class="fancy-checkbox"> <input
														type="checkbox"> <span></span>
												</label></td>
											</tr>
											<tr>
												<th scope="row">3</th>
												<td><label class="fancy-checkbox"> <input
														type="checkbox"> <span></span>
												</label></td>
											</tr>
										</tbody>
									</table>
									<div class="new-model"
										style="height:500px;width:80%;border-left: 1px solid #e6e6e6;text-align: center;font-size:18px;">
										<h4 style="margin: 220px 0;">选择或者新建部件</h4>
									</div>
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 35px;">
							<div class="col-md-12">
								视频文件：
								<button type="button"
									class="btn btn-primary btn-sm video-upload"
									style="margin-left:20px;">
									<i class="fa fa-upload" aria-hidden="true"></i>&nbsp;&nbsp;上传视频
									<input type="file">
								</button>

							</div>
						</div>
						<div class="row" style="margin-top: 35px;">
							<div class="col-md-12">
								<div style="display: flex;align-items: center">
									<span>封面文件：</span>
									<div class="upload-img">
										<input type="file">
									</div>
								</div>
							</div>
						</div>
						<div class="row" style="margin-top: 35px;">
							<div class="col-md-12">
								编辑锅炉简介：
								<textarea id="editor">

								</textarea>
							</div>
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
	<script
		src="${basePath}/static/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${basePath}/static/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="${basePath}/static/assets/scripts/klorofil-common.js"></script>
	<script src="${basePath}/static/assets/vendor/toastr/toastr.min.js"></script>
	<script>
		$('.nav li').each(function() {
			$(this).on('click', function() {
				$(this).addClass('active');
				$(this).siblings('li').removeClass('active');
			});
		});
		
		$('.watch').click(function() {
			$('.pot-index').hide();
			$('.checkout').show();
		});
		$('#back').click(function() {
			$('.pot-index').show();
			$('.checkout').hide();
		});
	</script>
</body>

</html>