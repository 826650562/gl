<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>锅炉系统</title>
<link rel="stylesheet" href="${basePath}/static/css/bootstrap.css">
<link rel="stylesheet" href="${basePath}/static/css/grid.css">
<script src="../static/js/bootstrap.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-2.1.4.min.js"></script>
<script src="../static/js/bootstrap.bundle.js"></script>
</head>
<body>
	<div class="main">
		<div class="type container">
			<div class="dropdown">
				<button class="btn btn-secondary dropdown-toggle" type="button"
					id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">锅炉类型</button>
				<div id="type_drop" class="dropdown-menu"
					aria-labelledby="dropdownMenuButton">
					<a class="dropdown-item" href="#">类型1</a> <a class="dropdown-item"
						href="#">类型2</a> <a class="dropdown-item" href="#">类型3</a>
				</div>
			</div>
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#newModal">新建锅炉类型</button>
			<button type="button" class="btn btn-danger" data-toggle="modal"
				data-target="#delModal">删除锅炉类型</button>
			<button type="button" class="btn btn-secondary" data-toggle="modal"
				data-target="#importModal">导入模型</button>
			<button type="button" class="btn btn-info">新建案例</button>
		</div>
		<div class="model container">
			<h4 class="table-intro">锅炉模型</h4>
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
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>MDS锅炉</td>
						<td><img src="../img/fengmian.png" alt=""
							style="width: 40px;height:40px;"></td>
						<td>锅壳锅炉</td>
						<td>&nbsp;</td>
						<td>
							<div class="btn-group" role="group" aria-label="Basic example">
								<button type="button" class="btn btn-light">查看</button>
								<button type="button" class="btn btn-primary">修改</button>
								<button type="button" class="btn btn-danger">删除</button>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>MDS锅炉</td>
						<td><img src="../img/fengmian.png" alt=""
							style="width: 40px;height:40px;"></td>
						<td>锅壳锅炉</td>
						<td>&nbsp;</td>
						<td>
							<div class="btn-group" role="group" aria-label="Basic example">
								<button type="button" class="btn btn-light">查看</button>
								<button type="button" class="btn btn-primary">修改</button>
								<button type="button" class="btn btn-danger">删除</button>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>MDS锅炉</td>
						<td><img src="../img/fengmian.png" alt=""
							style="width: 40px;height:40px;"></td>
						<td>锅壳锅炉</td>
						<td>&nbsp;</td>
						<td>
							<div class="btn-group" role="group" aria-label="Basic example">
								<button type="button" class="btn btn-light">查看</button>
								<button type="button" class="btn btn-primary">修改</button>
								<button type="button" class="btn btn-danger">删除</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<nav class="page" aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#">Previous</a>
					</li>
					<li class="page-item active"><a class="page-link" href="#">1</a>
					</li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</nav>
		</div>
		<div class="case container">
			<h4 class="table-intro">锅炉模型</h4>
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
						<td><img src="../img/fengmian.png" alt=""
							style="width: 40px;height:40px;"></td>
						<td>锅壳锅炉</td>
						<td>特种设备,事故案例</td>
						<td>17-11-11</td>
						<td>
							<div class="btn-group" role="group" aria-label="Basic example">
								<button type="button" class="btn btn-light">查看</button>
								<button type="button" class="btn btn-primary">修改</button>
								<button type="button" class="btn btn-danger">删除</button>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>MDS锅炉</td>
						<td><img src="../img/fengmian.png" alt=""
							style="width: 40px;height:40px;"></td>
						<td>锅壳锅炉</td>
						<td>特种设备,事故案例</td>
						<td>17-11-11</td>
						<td>
							<div class="btn-group" role="group" aria-label="Basic example">
								<button type="button" class="btn btn-light">查看</button>
								<button type="button" class="btn btn-primary">修改</button>
								<button type="button" class="btn btn-danger">删除</button>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>MDS锅炉</td>
						<td><img src="../img/fengmian.png" alt=""
							style="width: 40px;height:40px;"></td>
						<td>锅壳锅炉</td>
						<td>特种设备,事故案例</td>
						<td>17-11-11</td>
						<td>
							<div class="btn-group" role="group" aria-label="Basic example">
								<button type="button" class="btn btn-light">查看</button>
								<button type="button" class="btn btn-primary">修改</button>
								<button type="button" class="btn btn-danger">删除</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<nav class="page" aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#">Previous</a>
					</li>
					<li class="page-item active"><a class="page-link" href="#">1</a>
					</li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</nav>
		</div>
	</div>

	<!-- 新建类型 Modal -->
	<div class="modal fade" id="newModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="new-name">新建锅炉类型：</label> <input type="text"
								class="form-control" id="new-name" placeholder="输入您想新建的锅炉类型">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="new" type="button" class="btn btn-primary">Save
						changes</button>
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
					<h5 class="modal-title">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<ul id="del-list" class="list-group">
						<li class="list-group-item">Cras justo odio</li>
						<li class="list-group-item">Dapibus ac facilisis in</li>
						<li class="list-group-item">Morbi leo risus</li>
						<li class="list-group-item">Porta ac consectetur ac</li>
						<li class="list-group-item">Vestibulum at eros</li>
						<li class="list-group-item">Cras justo odio</li>
						<li class="list-group-item">Dapibus ac facilisis in</li>
						<li class="list-group-item">Morbi leo risus</li>
						<li class="list-group-item">Porta ac consectetur ac</li>
						<li class="list-group-item">Vestibulum at eros</li>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="new" type="button" class="btn btn-primary">Save
						changes</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 导入模型modal -->
	<div class="modal fade" id="importModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						输入名称：<input type="text" name="lname" id="_glmc" /> 锅炉分类 ：<select
							id="_glfl">
							<c:forEach var="stu" items="${_types}" >
								<option value='<c:out value="${stu}"/>'><c:out
										value="${stu}" /></option>
							</c:forEach>
							</select>
						<div class="row">
							<div class="col-md-4 imp-obj imp-btn">
							
								<form id="upload" action="#" enctype="multipart/form-data">
									导入obj模型<input id="uploadObj" type="file" name="file">
								</form>
								
							</div>
							<div class="col-md-4 imp-mtl imp-btn">
							
							
								<form id="upload2" action="#" enctype="multipart/form-data">
									导入mtl文件<input id="uploadMtl" type="file" name="file">
								</form>
								
								
							</div>
						</div>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">关闭</button>
					<button type="button" id="submit-mode" class="btn btn-primary">创建</button>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		$(function() {})
		$("#uploadObj").change(function(e) {
			if (e.target.value.indexOf(".obj") < 0) {
				$("#upload")[0].reset();
				alert("格式错误，请重新上传");
			}
		});
	
		$("#uploadMtl").change(function(e) {
			if (e.target.value.indexOf(".mtl") < 0) {
				$("#upload")[0].reset();
				alert("格式错误，请重新上传");
			}
		});
	
		$("#submit-mode").click(function() {
			var _glmc = $.trim($("#_glmc").val());
			var _glfl = $.trim($("#_glfl").val());
			var uploadObj = $("#uploadObj").val();
			var uploadMtl = $("#uploadMtl").val();
	
	
			if (_glmc.length <= 0) {
				alert("名称不能为空");
				return false;
			}
	
			if (_glfl.length <= 0) {
				alert("分类不能为空");
				return false;
			}
			if (uploadObj.indexOf(".obj") > 0 && uploadMtl.indexOf(".mtl") > 0) {
			} else {
				alert("请上传完整的模型及材料");
				return false;
			}
			savePic(_glmc, _glfl, uploadObj, uploadMtl);
		});
	
		function savePic(_glmc, _glfl, uploadObj, uploadMtl) {
			var ajaxUrl = "${basePath }/home/saveHeaderPic";
			var ajaxModeInfo = "${basePath }/home/saveModeInfo";
			var formData = [ new FormData($("#upload")[0]), new FormData($("#upload2")[0]) ];
			var index = 2;
			sendFile(sendFile, 0);
			function sendFile(fn, index) {
				$.ajax({
					type : "POST",
					url : ajaxUrl,
					data : formData[index],
					async : false,
					cache : false,
					contentType : false,
					processData : false,
					success : function(data) {
						if (index < 1) {
							index++;
							fn(fn, index);
						} else {
							submitValue(_glmc, _glfl);
						}
					},
					error : function(data) {
						console.log("error:" + data.responseText);
					}
				});
			}
			function submitValue(_glmc, _glfl) {
				$.ajax({
					type : "POST",
					url : ajaxModeInfo,
					data : {
						_glmc : _glmc,
						_glfl : _glfl,
					},
					async : false,
					cache : false,
					contentType : "application/x-www-form-urlencoded",
					success : function(data) {
						alert(data);
					},
					error : function(data) {
						console.log("error:" + data.responseText);
					}
				});
			}
	
		}
	</script>

</body>

</html>