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
<script src="${basePath}/static/layui/layui.js"></script>

<!-- END WRAPPER -->
<!-- Javascript -->
<script src="${basePath}/static/assets/vendor/jquery/jquery.min.js"></script>
<script
	src="${basePath}/static/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${basePath}/static/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${basePath}/static/assets/scripts/klorofil-common.js"></script>
<script src="${basePath}/static/assets/vendor/toastr/toastr.min.js"></script>

<style>
#fenye {
	text-align: center;
	border-top: 1px solid rgba(0, 0, 0, 0.1);
	margin: -17px 0 0 0;
}
</style>


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
						<li><a href="index.html"> <i class="fa fa-folder"></i> <span>锅炉及案例</span>
						</a></li>
						<li><a href="addmodel.html" class="active"> <i
								class="fa fa-cube"></i> <span>添加3D模型</span>
						</a></li>
						<li><a href="case.html" class=""> <i
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
							<div style="display: flex;margin-bottom: 20px;">
								<input type="text" class="form-control form-control-sm" name=""
									id="_glmc" placeholder="锅炉名称"> <select
									class="form-control" id="_select_guoluType"
									style="margin-right:10px;">
									<c:forEach var="stu" items="${_types}">
										<option value='<c:out value="${stu}"/>'><c:out
												value="${stu}" /></option>
									</c:forEach>
								</select>

								<button type="button" id="" class="btn btn-light btn-sm obj-up">
									<i class="fa fa-upload" aria-hidden="true"></i>&nbsp;导入obj模型
									<form id="upload" action="#" enctype="multipart/form-data">
										<input id="uploadObj" type="file" name="file">
									</form>
									<span class="result"> <i class="fa fa-tag"></i> <span
										class="ant-upload-list-item-name" title="bg.png">bg.png</span>
									</span>
								</button>
								<button type="button" id="" class="btn btn-light btn-sm mtl-up">
									<i class="fa fa-upload" aria-hidden="true"></i>&nbsp;上传mtl文件

									<form id="upload2" action="#" enctype="multipart/form-data">
										<input id="uploadMtl" type="file" name="file">
									</form>

								</button>
								<button type="button" id="submit-mode"
									class="btn btn-primary create">
									<i class="fa fa-check-circle" aria-hidden="true"></i>&nbsp;创建
								</button>
								<button type="button" class="btn btn-light">
									<i class="fa fa-arrow-circle-left" aria-hidden="true"></i>&nbsp;返回
								</button>
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
										id="_showAndedit_name" placeholder="锅炉名称"> <select
										class="form-control" style="margin-right:10px;"
										id="_showAndedit_select">
										<c:forEach var="stu" items="${_types}">
											<option value='<c:out value="${stu}"/>'><c:out
													value="${stu}" /></option>
										</c:forEach>
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
										<tbody id="parts_">
										</tbody>
									</table>
									<div class="list_parts" id="fenye" style="display:none"></div>
								</div>
							</div>
							<div class="col-md-9">
								<div class="model-show"
									style="background: #e6e6e6; min-height:500px">
									<iframe src="" id="modeContainer"
										style="background: #e6e6e6; min-height:500px ; min-width:1200px"></iframe>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<button type="button" id="_createParts"
									class="btn btn-primary btn-block new-bj" data-toggle="modal">创建部件</button>
							</div>
						</div>
						<!-- 创建部件 Modal -->
						<div class="modal fade" id="bjModal" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg" role="document">
								<div class="modal-content">
									<div class="modal-header">
										创建新部件
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div class="form-group">
											<label for="bj-name">部件名称:</label> <input type="text"
												class="form-control" id="bj-name" value="新建部件">
										</div>
										<div class="form-group">
											<label for="bj-selected">已选中的图元:</label> <input type="text"
												class="form-control" id="bj-selected" value="" disabled>
										</div>
										<div class="form-group">
											<label for="bj-name">部件简介说明:</label>
											<div id="bj-editer"></div>
										</div>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">关闭</button>
										<button id="new_bj_create" type="button"
											class="btn btn-primary">保存</button>
									</div>
								</div>
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
									<table class="table table-hover bj-table" style="width:20%">
										<thead style="background-color: #dee2e6">
											<tr>
												<th scope="col">部件</th>
												<th scope="col">隐藏</th>
											</tr>
										</thead>

										<tbody id="parts_">

										</tbody>
									</table>
									<div class="list_parts" id="fenye_edit" style="display:none"></div>

									</table>
									<div class="new-model"
										style="width:80%;border-left: 1px solid #e6e6e6;text-align: center;font-size:18px;">
										<h4 style="margin: 220px 0;">选择或者新建部件</h4>
										<div class="new-model-box" style="display: none;">
											<div class="form-group">
												<label for="bj-name">部件名称:</label> <input type="text"
													class="form-control" id="bj-update-name"
													placeholder="请输入新建部件的名称...">
											</div>
											<div class="form-group">
												<label for="">已选中的图元:</label> <input type="text"
													class="form-control bj-select" id="" value="" disabled>
											</div>
											<div class="form-group">
												<label for="bj-name">部件简介说明:</label>
												<div id="bj-update-editer"></div>
											</div>
											<div class="form-group"
												style="float: right;margin-bottom: 0px;">
												<button type="button" class="btn btn-primary">保存</button>
												<button type="button" class="btn btn-danger">删除该部件</button>
											</div>
										</div>
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
									<input type="file" name="" id="" style="opacity:.01">
								</button>

							</div>
						</div>
						<div class="row" style="margin-top: 35px;">
							<div class="col-md-12">
								<div style="display: flex;align-items: center">
									<span>封面文件：</span>
									<div class="upload-img"></div>
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

	<script>
		$('.nav li').each(function() {
			$(this).on('click', function() {
				$(this).addClass('active');
				$(this).siblings('li').removeClass('active');
			});
		});
	
	
	
		var file = $('#obj-upload'),
			aim = $('#aim');
		file.on('change', function(e) {
			//e.currentTarget.files 是一个数组，如果支持多个文件，则需要遍历
			var name = e.currentTarget.files[0].name;
			aim.val(name);
		});
	
		layui.use([ 'layedit', 'table', 'form', 'laypage' ], function() {
			var layedit = layui.layedit;
			layedit.build('editor'); //建立编辑器
			layedit.build('bj-editer');
			layedit.build('bj-update-editer');
			var laypage = layui.laypage;
			laypage.render({
				elem : 'page1',
				count : 200,
				layout : [ 'count', 'prev', 'page', 'next', 'limit', 'skip' ],
				jump : function(obj) {
					console.log(obj)
				}
			});
			laypage.render({
				elem : 'page2',
				count : 200,
				layout : [ 'count', 'prev', 'page', 'next', 'limit', 'skip' ],
				jump : function(obj) {
					console.log(obj)
				}
			});
		});
	</script>
   
   <script>
    $(function(){
       var tag="${is_show_Create}";
       if(tag && tag=="_1001"){
          //隐藏
          
          	
            $('.add').hide();
            $('.checkout').show();
           
       }
       
    });
   
   </script>


	<script>
		$(function() {
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
	
			/* 			$('.create').click(function() {
					
					});
				 */
	
			$("#submit-mode").click(function() {
				var _glmc = $.trim($("#_glmc").val());
				var _glfl = $.trim($("#_select_guoluType").find("option:selected").text());
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
							if (data == "1000") {
								showAndEdit();
							}
						},
						error : function(data) {
							console.log("error:" + data.responseText);
						}
					});
				}
			}
	
			//展示并编辑部件详细信息
			function showAndEdit() {
				$("#_showAndedit_name").val($("#_glmc").val());
				var delet_type = $("#_select_guoluType").find("option:selected").text();
				$("#_showAndedit_select").val(delet_type);
				$('.add').hide();
				$('.checkout').show();
				//加载模型
	
				var _glmc = $.trim($("#_glmc").val());
				var _glfl = $.trim($("#_select_guoluType").find("option:selected").text());
	
				$("#modeContainer").attr({
					'_name' : _glmc,
					'_type' : _glfl
				});
				$("#modeContainer").attr("src", "${basePath }/home/loadMode");
			}
	
			//拉出部件列表
			getListOfParts = function() {
				var html = "<tr><th scope='row'>1</th><td><label class='fancy-checkbox'>" +
					"<input type='checkbox'><span></span></label></td></tr>";
				$.ajax({
					type : "POST",
					url : getAllModeparts,
					async : false,
					cache : false,
					contentType : "application/x-www-form-urlencoded",
					success : function(data) {
						 console.info(data);
					},
					error : function(data) {
						console.log("error:" + data.responseText);
					}
				});
	
			}
	
	
	
	
		})
	</script>
</body>

</html>