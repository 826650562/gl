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
<link rel="stylesheet" href="${basePath}/static/assets/css/z-layout.css">
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


<script type="text/javascript" charset="utf-8"
	src="${basePath}/static/assets/scripts/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${basePath}/static/assets/scripts/editor_api.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
	src="${basePath}/static/assets/scripts/zh-cn/zh-cn.js"></script>

<style>
.list_parts {
	text-align: center;
	border-top: 1px solid rgba(0, 0, 0, 0.1);
	margin: -17px 0 0 0;
}

#parts_ tr th {
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 3;
	overflow: hidden;
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
									<span class="result" style="display:none"> <i
										class="fa fa-tag"></i> <span
										class="ant-upload-list-item-name file_name" title="bg.png"></span>
									</span>
								</button>
								<button type="button" id="" class="btn btn-light btn-sm mtl-up">
									<i class="fa fa-upload" aria-hidden="true"></i>&nbsp;上传mtl文件

									<form id="upload2" action="#" enctype="multipart/form-data">
										<input id="uploadMtl" type="file" name="file">
									</form>
									<span class="result" style="display:none"> <i
										class="fa fa-tag"></i> <span
										class="ant-upload-list-item-name file_name" title="bg.png"></span>
									</span>
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
												<th scope="col">选中<input id="checkedAll"
													type='checkbox'></th>
												<th scope="col">隐藏<input id="uncheckAll"
													type='checkbox'></th>
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
											<!-- <div id="bj-editer"></div> -->
											<script id="bj-editer" type="text/plain"
												style="width:100%;height:350px;"></script>
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

						<!-- 创建部件 Modal -->
						<div class="modal fade" id="insertModal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true" style=" background: #fff;  ">


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
										<div class="form-group"
											style="float: right;margin-bottom: 0px;">
											<button type="button" class="btn btn-primary" id="cancen_d">取消</button>
											<button type="button" class="btn btn-danger" id="yes_seach">确定</button>
										</div>
										<div class="z-col"></div>
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
										<tbody id="parts_list">
										</tbody>

									</table>
									<div class="list_parts" id="fenye_edit"
										style="margin:0px;display:none"></div>
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
												<script id="bj-update-editer" type="text/plain"
													style="width:100%;height:350px;"></script>
											</div>
											<div class="form-group"
												style="float: left;margin-bottom: 0px;">
												<button type="button" class="btn btn-primary"
													data-toggle="modal" id="insertGF">插入规范</button>
											</div>
											<div class="form-group"
												style="float: right;margin-bottom: 0px;">
												<button type="button" class="btn btn-primary"
													id="update_part">保存</button>
												<button type="button" class="btn btn-danger"
													id="delete_part">删除该部件</button>
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
									<div class="upload-img">
									<img src="/seckill/static/assets/img/plus.png" style="width: 150px;  height: 200px; ">

										<form id="upload_fengmian" action="#"
											enctype="multipart/form-data">
											<input id="uploadfengmian" type="file" name="file"
												style="width: 155px; height: 200px; margin-left: 110px;">
										</form>
									</div>
								</div>
								</style="opacity:.01"div>
							</div>
							<div class="row" style="margin-top: 65px;">
								<div class="col-md-12">
									编辑锅炉简介：
									<!-- <textarea id="editor" class="editor_mode">
                                    </textarea> -->
									<script id="editor" type="text/plain"
										style="width:100%;height:350px;"></script>
								</div>
							</div>
							<div class="row" style="margin-top: 35px;">
								<div class="col-md-12">
									<button class="btn btn-primary btn-block" id="AllSave—mode">保存锅炉模型</button>
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
			$(function() {
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
		
			})
		</script>

		<script type="text/javascript">
		
			//实例化编辑器
			//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
			UE.getEditor('editor');
			UE.getEditor('bj-editer');
			UE.getEditor('bj-update-editer');
		</script>


		<script>
			$(function() {
				var tag = "${is_show_Create}";
				layui.use([ 'layedit', 'table', 'form', 'laypage' ], function() {
					layer = layui.layer,
		
					$("#uploadObj").change(function(e) {
						if (e.target.value.indexOf(".obj") < 0) {
							$("#upload")[0].reset();
							layer.msg("格式错误，请重新上传", {
								icon : 2
							});
						} else {
							var values = e.target.value.split("\\");
							var name = values[values.length - 1];
							$(".file_name").eq(0).text(name)
							$(".file_name").eq(0).parent().show();
						}
					});
		
					$("#uploadMtl").change(function(e) {
						if (e.target.value.indexOf(".mtl") < 0) {
							$("#upload2")[0].reset();
							layer.msg("格式错误，请重新上传", {
								icon : 2
							});
						} else {
							var values = e.target.value.split("\\");
							var name = values[values.length - 1];
							$(".file_name").eq(1).text(name);
							$(".file_name").eq(1).parent().show();
						}
		
					});
		
					$("#uploadfengmian").change(function(e) {
						var bujianId = $(".main").attr("mode_id")||tag;
						
						var img = e.target.value;
						if (img.length >= 0) {
							$.ajax({
								type : "POST",
								url : "${basePath }/home/upload_img?_id=" + bujianId+"&type=mode",
								data : new FormData($("#upload_fengmian")[0]),
								async : false,
								cache : false,
								contentType : false,
								processData : false,
								success : function(data) {
									$(".upload-img").find("img").attr("src","/seckill/uploadFiles/" + data );
								},
								error : function(data) {
									console.log("error:" + data.responseText);
								}
							});
						}
						$("#upload_fengmian")[0].reset();
					});
		
					//全部保存
					$("#AllSave—mode").unbind().click(function() {
						var name = $.trim($("#_showAndedit_name").val());
						var delet_type = $("#_showAndedit_select").val();
						//var textarea = $('.editor_mode').siblings('.layui-layedit').find('iframe').contents().find('body').html();
						var textarea = UE.getEditor('editor').getContent();
		
						var mode_id = $(".main").attr("mode_id")||tag;
						if (name.length <= 0) {
							layer.msg("锅炉名称不能为空！", {
								icon : 2
							});
							return;
						}
						if (textarea.length < 0) {
							layer.msg("锅炉简介不能为空！", {
								icon : 2
							});
							return;
						}
						$.ajax({
							type : "POST",
							url : "allsave_mode",
							data : {
								_glmc : name,
								_glfl : delet_type,
								_textarea : textarea,
								mode_id : mode_id
							},
							async : false,
							cache : false,
							contentType : "application/x-www-form-urlencoded",
							success : function(data) {
								if (data == "1000") {
									layer.msg("保存成功", {
										icon : 1
									});
									window.location.href = "index";
								}
							},
							error : function(data) {
								console.log("error:" + data.responseText);
							}
						});
					});
		
		
		
					$("#submit-mode").unbind().click(function() {
						var _glmc = $.trim($("#_glmc").val());
						var _glfl = $.trim($("#_select_guoluType").find("option:selected").text());
						var uploadObj = $("#uploadObj").val();
						var uploadMtl = $("#uploadMtl").val();
		
		
						if (_glmc.length <= 0) {
							layer.msg("名称不能为空", {
								icon : 2
							});
							return false;
						}
		
						if (_glfl.length <= 0) {
							layer.msg("分类不能为空", {
								icon : 2
							})
							return false;
						}
						if (uploadObj.indexOf(".obj") > 0 && uploadMtl.indexOf(".mtl") > 0) {
						} else {
							layer.msg("请上传完整的模型及材料", {
								icon : 2
							})
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
					function showAndEdit(name, type) {
						$("#_showAndedit_name").val(name || $("#_glmc").val());
						var delet_type = $("#_select_guoluType").find("option:selected").text();
						$("#_showAndedit_select").val(type || delet_type);
						$('.add').hide();
						$('.checkout').show();
						//加载模型
						var _glmc = $.trim($("#_glmc").val());
						var _glfl = $.trim($("#_select_guoluType").find("option:selected").text());
						$("#modeContainer").attr({
							'_name' : name || _glmc,
							'_type' : type || _glfl,
						});
						$("#modeContainer").attr("src", "${basePath }/home/loadMode");
					}
		
					var bujianId;
					//拉出部件列表
					getListOfParts = function(id) {
						bujianId = id;
						$.ajax({
							type : "POST",
							url : "getAllModeparts",
							async : false,
							cache : false,
							data : {
								_id : id
							},
							contentType : "application/x-www-form-urlencoded",
							success : function(data) {
								var res = JSON.parse(data);
								res.length > 0 && _fullListOfParts(res)
							},
							error : function(data) {
								console.log("error:" + data.responseText);
							}
						});
						function _fullListOfParts(res) {
							var _hr = [];
							res.map(function(item) {
								_hr.push(_getHtml(item));
							});
							var len = _hr.length;
							if (len <= 0) {
								$("#parts_list").html("<font>无数据</font>");
							} else {
								//分页
								var fenLen = 10;
								layui.use([ 'laypage', 'layer' ], function() {
									var laypage = layui.laypage,
										layer = layui.layer;
									//总页数低于页码总数
									laypage.render({
										elem : "fenye_edit",
										count : len, //数据总数,
										limit : fenLen,
										groups : 2,
										theme : "#01aaff",
										jump : function(obj, first) {
											//首次不执行
											if (!first) {
												$("#parts_list").html(gethtml(_hr, obj.curr, fenLen));
											}
											addEvenlister()
										}
									});
								})
							}
							$("#parts_list").html(gethtml(_hr, 1, fenLen));
							$(".bj-table").append($("#fenye_edit"));
							$("#fenye_edit").fadeIn(100);
							addEvenlister();
						}
		
						function addEvenlister() {
							$("#parts_list").find("tr").unbind().click(function() {
								getInfoOfPart($(this).attr("id"));
							});
		
							$("#update_part").unbind().click(function() {
								//保存修改后的部件
								var name = $.trim($('#bj-update-name').val());
								//var textArea = $('#bj-update-editer').siblings('.layui-layedit').find('iframe').contents().find('body').html()
								var textArea = UE.getEditor('bj-update-editer').getContent();
								var id = $('.new-model h4').attr("_id_part");
								if (name.length <= 0 || textArea.length <= 0) {
									layer.msg("主要信息不能为空~", {
										icon : 2
									})
									return false;
								}
								update_part(id, name, textArea);
							});
		
							$("#delete_part").unbind().click(function() {
								//删除该部件
								layer.confirm('确认删除吗', {
									btn : [ '否', '确定' ] //按钮
								}, function() {
									layer.msg('已取消！', {
										icon : 1
									});
								}, function() {
									var id = $('.new-model h4').attr("_id_part");
									delete_part(id);
								})
							});
						}
		
						function getInfoOfPart(id) {
							$.ajax({
								type : "POST",
								url : "getInfoOfPart",
								async : false,
								cache : false,
								data : {
									_id : id
								},
								contentType : "application/x-www-form-urlencoded",
								success : function(data) {
									var res = JSON.parse(data)[0];
									$('.new-model h4').hide().attr("_id_part", id);
									$('.new-model-box').show();
									$('.new-model-box .bj-select').val(res.part_ids);
									$('#bj-update-name').val(res.part_name);
									UE.getEditor('bj-update-editer').setContent(res.part_info);
								//$('#bj-update-editer').siblings('.layui-layedit').find('iframe').contents().find('body').html(res.part_info);
								},
								error : function(data) {
									console.log("error:" + data.responseText);
								}
							});
						}
		
						function update_part(id, name, textArea) {
							//保存修改后的部件
							$.ajax({
								type : "POST",
								url : "update_part",
								async : false,
								cache : false,
								data : {
									_id : id,
									name : name,
									textArea : textArea
								},
								contentType : "application/x-www-form-urlencoded",
								success : function(data) {
									getListOfParts(bujianId);
									layer.msg("保存成功~！", {
										icon : 1
									})
								},
								error : function(data) {
									console.log("error:" + data.responseText);
								}
							});
						}
						function delete_part(id, name, textArea) {
							//保存修改后的部件
							$.ajax({
								type : "POST",
								url : "delete_part",
								async : false,
								cache : false,
								data : {
									_id : id,
								},
								contentType : "application/x-www-form-urlencoded",
								success : function(data) {
									//更新列表
									getListOfParts(bujianId);
									$('.new-model h4').show()
									$('.new-model-box').hide();
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
						function _getHtml(item) {
							return "<tr id=" + item.id + " modeId=" + item.modeId + "><th scope='row'>" + item.part_name + "</th><td><label class='fancy-checkbox'>" +
								"<input type='checkbox'><span></span></label></td></tr>";
						}
					}
		
		
		
		
					//选中的
					var checkoutParts = [];
					var removeOrshowParts = [];
					var yem_check = [];
					var yem_outline_check = [];
		
					getParts = function(_datas, scene, id__, outlinePass) {
						var parts_ = document.getElementById("parts_");
						var fenye = document.getElementById("fenye");
		
						//获取模型的原件
						var datas = $.extend([], _datas.children);
						var id_ = id__;
						var html = [];
						if (datas.length > 0) {
							datas.map(function(data) {
								html.push(getHtml(data));
							});
						} else {
							$(parts_).html("<font>无数据</font>");
						}
						var len = html.length;
						if (len > 0) {
							//分页
							var fenLen = 10;
							layui.use([ 'laypage', 'layer' ], function() {
								var laypage = layui.laypage,
									layer = layui.layer;
								//总页数低于页码总数
								laypage.render({
									elem : $("#fenye"),
									count : len, //数据总数,
									limit : fenLen,
									groups : 2,
									theme : "#01aaff",
									jump : function(obj, first) {
										//首次不执行
										if (!first) {
											$(parts_).html(gethtml(html, obj.curr, fenLen));
										} else {
											$(parts_).html(gethtml(html, 1, fenLen));
											$(fenye).fadeIn(100);
										}
										$(parts_).find("input").each(function(index, item) {
											if ($(item).attr("_type") == "show") {
												if (checkoutParts.indexOf($(item).val()) >= 0) {
													$(item).prop("checked", true);
												} else
													$(item).prop("checked", false);
											} else {
												if (removeOrshowParts.indexOf($(item).val()) >= 0) {
													$(item).prop("checked", true);
												} else
													$(item).prop("checked", false);
											}
										});
										if (yem_outline_check.indexOf(obj.curr) >= 0) {
											$("#checkedAll").prop("checked", true);
										} else {
											$("#checkedAll").prop("checked", false);
										}
										if (yem_check.indexOf(obj.curr) >= 0) {
											$("#uncheckAll").prop("checked", true);
										} else {
											$("#uncheckAll").prop("checked", false);
										}
										addEventerlister(obj.curr);
									}
								});
							})
		
							//注册监控事件
							function addEventerlister(p) {
								var pageNub = p;
								var parts_ = document.getElementById("parts_");
								$(parts_).find("input").unbind().click(function() {
									var type = $(this).attr("_type");
									var id = $(this).attr("value");
									if (type == "show") {
										if ($(this).is(':checked')) {
											checkoutParts.push(id);
										} else {
											var index = checkoutParts.indexOf(id);
											if (index >= 0) {
												checkoutParts.splice(index, 1);
											}
										}
										outlinePass.selectedObjects = _getParts(checkoutParts);
									} else {
										if ($(this).is(':checked')) {
											_datas.remove(_getParts([ id ])[0]);
											removeOrshowParts.push(id)
										} else {
											var index = removeOrshowParts.indexOf(id);
											if (index >= 0) {
												removeOrshowParts.splice(index, 1);
											}
											_datas.add(_getParts([ id ])[0]);
										}
									}
								});
		
		
								$("#checkedAll").unbind().click(function() {
									//全选
									var input = $("#parts_").find("input[_type=show]");
									if ($(this).is(':checked')) {
										$("[_type=show]").prop("checked", true);
										input.each(function(index, item) {
											checkoutParts.push($(item).val());
										});
										yem_outline_check.push(pageNub);
									} else {
										$("[_type=show]").prop("checked", false);
										input.each(function(index, item) {
											var index = checkoutParts.indexOf($(item).val());
											if (index >= 0) {
												checkoutParts.splice(index, 1);
											}
										});
		
										var index = yem_outline_check.indexOf(pageNub);
										if (index >= 0) {
											yem_outline_check.splice(index, 1);
										}
									}
									outlinePass.selectedObjects = _getParts(checkoutParts);
								});
								$("#uncheckAll").unbind().click(function() {
									var input = $("#parts_").find("input[_type=hide]");
									//全选
									if ($(this).is(':checked')) {
										$("[_type=hide]").prop("checked", true);
										input.each(function(index, item) {
											_datas.remove(_getParts([ $(item).val() ])[0]);
											removeOrshowParts.push($(item).val())
										});
										yem_check.push(pageNub);
									} else {
										$("[_type=hide]").prop("checked", false);
										input.each(function(index, item) {
											var index = removeOrshowParts.indexOf($(item).val());
											if (index >= 0) {
												removeOrshowParts.splice(index, 1);
											}
											_datas.add(_getParts([ $(item).val() ])[0]);
										});
										var index = yem_check.indexOf(pageNub);
										if (index >= 0) {
											yem_check.splice(index, 1);
										}
									}
								});
		
								var _createParts = document.getElementById("_createParts");
								//创建部件
								$(_createParts).unbind().click(function() {
									if (checkoutParts.length <= 0) {
										layer.msg('请先勾选部件！', {
											icon : 2
										})
										return false;
									} else {
										$("#bj-selected").val(checkoutParts.toString());
										$('#bjModal').modal('show');
									}
								});
		
								$("#new_bj_create").unbind().click(function() {
									var bj_name = $.trim($("#bj-name").val());
									var bj_parts = checkoutParts.toString();
									var brief = UE.getEditor('bj-editer').getContent();
									//var brief = $('#bj-editer').siblings('.layui-layedit').find('iframe').contents().find('body').html();
									$.ajax({
										type : "POST",
										url : "saveModeParts",
										data : {
											bj_name : bj_name,
											bj_parts : bj_parts,
											brief : brief,
											id : id_
										},
										async : false,
										cache : false,
										contentType : "application/x-www-form-urlencoded",
										success : function(data) {
											if (data == "1000") {
												getListOfParts(id_);
												$('#bjModal').modal('hide');
											}
										},
										error : function(data) {
											console.log("error:" + data.responseText);
										}
									});
								});
		
							}
		
		
							$("#insertGF").unbind().click(function() {
								$(".search_contiren").html("<font>将按照搜索关键词搜索标题及内容，不支持多个关键词</font>");
								$("#search_page").hide();
								$('#insertModal').modal('show');
							});
		
							var _searchRes = {};
							//插入规范的搜索
							$(".ymssbtn").unbind().click(function() {
								var guanjianci = $.trim($("#guanjianci").val());
								if (guanjianci) {
									$.ajax({
										type : "POST",
										url : "search_guifanParPlus",
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
		
								$(".ssjgitem").unbind().dblclick(function() {
									$(".ssjgitem").css("border", "none");
									$(this).css("border", "1px #1b1b1b solid");
									_current_id = $(this).html();
									UE.getEditor('bj-update-editer').focus();
									UE.getEditor('bj-update-editer').execCommand('inserthtml', _current_id);
									$('#insertModal').modal('hide');
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
		
							$("#yes_seach").unbind().click(function() {
								//确认插入规范
								UE.getEditor('bj-update-editer').focus();
								UE.getEditor('bj-update-editer').execCommand('inserthtml', _current_id);
								$('#insertModal').modal('hide');
							});
		
							$("#cancen_d").unbind().click(function() {
								//取消
								$('#insertModal').modal('hide');
							});
		
		
							function _getParts(arr) {
								var modeParts = [];
								arr.map(function(item) {
									datas.map(function(data) {
										if (data.name == item) {
											modeParts.push(data);
										}
									});
								});
								return modeParts
							}
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
					}
		
		
					function getHtml(data) {
						return "<tr> <th scope='row'>" + data.name + "</th>" +
							"<td><input type='checkbox' name='vehicle' value='" + data.name + "'  _type='show'  /></td>" +
							"<td><input type='checkbox' name='vehicle' value='" + data.name + "'  _type='hide'  /></td> </tr>";
					}
		
		
		
					if (tag && tag != "") {
						//隐藏
						$('.add').hide();
						$('.checkout').show();
						$.ajax({
							type : "POST",
							url : "getModeById",
							data : {
								_id : tag
							},
							async : false,
							cache : false,
							contentType : "application/x-www-form-urlencoded",
							success : function(data) {
								var res = JSON.parse(data)[0];
								showAndEdit(res.name, res.type);
								getListOfParts(tag);
								if(res.fenmian)
							    $(".upload-img").find("img").attr("src","/seckill/uploadFiles/" + res.fenmian );
								UE.getEditor('editor').setContent(res.info);
							},
							error : function(data) {
								console.log("error:" + data.responseText);
							}
						});
		
					}
		
				});
			})
		</script>
</body>

</html>