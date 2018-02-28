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

<link rel="stylesheet" href="${basePath}/static/layui/css/layui.css">
<link rel="stylesheet"
	href="${basePath}/static/font-awesome-4.7.0/css/font-awesome.css">
<link rel="stylesheet" href="${basePath}/static/css/init.css">
<link rel="stylesheet" href="${basePath}/static/css/bootstrap.css">
<link rel="stylesheet" href="${basePath}/static/css/checkout.css">


<script src="../static/js/bootstrap.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-2.1.4.min.js"></script>
<script src="../static/js/bootstrap.bundle.js"></script>
<script src="../static/js/three.js"></script>
<script src="../static/js/threeIndex_v2.js"></script>

<script src="../static/js/three.js" type="text/javascript"></script>
<script src="../static/js/OrbitControls.js" type="text/javascript"></script>
<script src="../static/js/OBJLoader.js" type="text/javascript"></script>
<script src="../static/js/MTLLoader.js" type="text/javascript"></script>
<script src="../static/js/TweenMax.min.js" type="text/javascript"></script>
<!-- <script src="../static/js/typeface-0.10.js" type="text/javascript"></script> -->
<script src="../static/js/CopyShader.js"></script>
<script src="../static/js/FXAAShader.js"></script>
<script src="../static/js/EffectComposer.js"></script>
<script src="../static/js/RenderPass.js"></script>
<script src="../static/js/ShaderPass.js"></script>
<script src="../static/js/OutlinePass.js"></script>

<script src="${basePath}/static/layui/layui.js"></script>

<style>
.mode_main {
	height: 500px;
	width: 800px;
	float: left;
}

.bj_list {
	height: 500px;
	width: 500px;
	float: left;
}

.mode_jianjie {
	height: 500px;
	width: 200px;
	float: left;
}

#fenye {
	text-align: center;
	border-top: 1px solid rgba(0, 0, 0, 0.1);
	margin: -17px 0 0 0;
}

</style>
</head>

<body>
	<div class="container-fluid">
		<i class="fa fa-navicon fa-lg" aria-hidden="true"></i>
	</div>
	<div class="container model">
		<div style="display: flex;margin-bottom: 35px;">
			<input type="text" class="form-control form-control-sm" name=""
				id="pot-name" placeholder="锅炉名称">

			<c:forEach var="stu" begin="0" end="0" items="${_types}">
				<button class="btn btn-outline-secondary dropdown-toggle btn-sm"
					type="button" id="pot-type" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">${stu}</button>
			</c:forEach>

			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				<c:forEach var="stu" items="${_types}">
					<a class="dropdown-item" href="#">${stu} </a>
				</c:forEach>

			</div>
			<button type="button" id="change-pot" class="btn btn-primary btn-sm">修改</button>
			<button type="button" id="back" class="btn btn-light btn-sm">返回</button>
		</div>
		<div class="row">
			<div class="col-3">
				<div style="min-height: 500px;">
					<table class="table table-hover">
						<thead style="background-color: #dee2e6">
							<tr>
								<th scope="col">图元</th>
								<th scope="col">选中</th>
								<th scope="col">隐藏</th>
							</tr>
						</thead>
						<tbody id="parts_">

						</tbody>
					</table>
					<div class="list_parts" id="fenye" style="display:none"></div>
				</div>
			</div>
			<div class="col-9">
				<div class="model-show"
					style="background: #e6e6e6; min-height:500px" id="model-show"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<button type="button" id="_createParts" class="btn btn-primary btn-block ">创建部件</button>
			</div>
		</div>
		<div class="row" style="margin-top: 35px">
			<div class="col-12">
				<div>编辑部件信息</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
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
								<td>Mark</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>Jacob</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>Larry</td>
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
			<div class="col-12">
				视频文件：
				<button type="button" class="btn btn-primary btn-sm"
					style="margin-left:20px;">
					<i class="fa fa-upload" aria-hidden="true"></i>&nbsp;上传视频
				</button>
			</div>
		</div>
		<div class="row" style="margin-top: 35px;">
			<div class="col-12">
				<div style="display: flex;align-items: center">
					<span>封面文件：</span>
					<div class="upload-img"></div>
				</div>
			</div>
		</div>
		<div class="row" style="margin-top: 35px;">
			<div class="col-12">
				编辑锅炉简介：
				<textarea id="editor">

                </textarea>
			</div>
		</div>
	</div>

	<script>
		layui.use('layedit', function() {
			var layedit = layui.layedit;
			layedit.build('editor'); //建立编辑器
		});
	</script>
</body>

</html>