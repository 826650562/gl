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

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="${basePath}/home/layui/css/layui.css">
<link rel="stylesheet"
	href="${basePath}/home/fontawesome/css/font-awesome.min.css">
<link href="${basePath}/home/css/bootstrap.min.css" rel="stylesheet">
<link href="${basePath}/home/css/z-layout.css" rel="stylesheet">
<link href="${basePath}/home/css/style2.css" rel="stylesheet">

<link rel="stylesheet" href="${basePath}/home/css/zTreeStyle.css"
	type="text/css">
<link rel="stylesheet" href="${basePath}/home/css/demo.css"
	type="text/css">

<style type="text/css">
html, body {
	height: 100%;
}
/*.layui-btn{height:38px; line-height:38px;}*/
#xjglmx .modal-dialog {
	min-height: 500px;
	width: 500px;
}

#tjgllb .modal-dialog {
	min-height: 500px;
	width: 500px;
}

.layui-layout-admin .layui-body {
	top: 60px;
	bottom: 0px;
}
</style>

<!--App自定义的css-->
</head>
<body class="layui-layout-body">

	<div class="layui-layout layui-layout-admin">

		<div class="layui-header">
			<div class="layui-logo">锅炉信息集成系统管理</div>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img">admin用户管理员
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">退出</a>
						</dd>
					</dl></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item"><a class="" href="glmx.html"><i
							class="fa fa-cube fa-fw"></i>&nbsp;锅炉模型</a></li>
					<li class="layui-nav-item"><a class="" href="glal.html"><i
							class="fa fa-cubes fa-fw"></i>&nbsp;锅炉案例</a></li>
					<li class="layui-nav-item layui-nav-itemed"><a
						href="gfgl.html"><i class="fa fa-gear fa-fw"></i>&nbsp;规范管理</a></li>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<div class="panal1">
				<div class="z-row gftopcz">
					<div class="z-col padR5">
						<button data-toggle="modal" data-target="#tjgllb"
							class="layui-btn width100 layui-btn-primary layui-btn-sm">
							<i class="fa fa-plus-square fa-fw"></i>&nbsp;添加
						</button>
					</div>
					<div class="z-col padL5">
						<button data-toggle="modal" data-target="#tjgllb"
							class="layui-btn width100 layui-btn-primary layui-btn-sm">
							<i class="fa fa-trash fa-fw"></i>&nbsp;删除
						</button>
					</div>
				</div>

				<div class="z-row gftopsearch">
					<div class="z-col">
						<input type="text" placeholder="请输入搜索关键词" class="layui-input" />
					</div>
					<div>
						<button class="layui-btn">
							<i class="fa fa-search fa-fw"></i>
						</button>
					</div>
				</div>

				<div class="z-row gflistbox">
					<div class="z-col">
						<div class="z-row">
							<div class="z-col">
								<a href="#" class="gfliitem"
									title="20201 NB/T 47034-2013工业锅炉技术条件">20201 NB/T
									47034-2013工业锅炉技术条件</a>
							</div>
						</div>
						<div class="z-row">
							<div class="z-col">
								<a href="#" class="gfliitem"
									title="20201 NB/T 47034-2013工业锅炉技术条件">20201 NB/T
									47034-2013工业锅炉技术条件</a>
							</div>
						</div>
						<div class="z-row">
							<div class="z-col">
								<a href="#" class="gfliitem gfliitemActive"
									title="20201 NB/T 47034-2013工业锅炉技术条件术条件">20201 NB/T
									47034-2013工业锅炉技术条件术条件</a>
							</div>
						</div>
						<div class="z-row">
							<div class="z-col">
								<a href="#" class="gfliitem"
									title="20201 NB/T 47034-2013工业锅炉技术条件">20201 NB/T
									47034-2013工业锅炉技术条件</a>
							</div>
						</div>
						<div class="z-row">
							<div class="z-col">
								<a href="#" class="gfliitem"
									title="20201 NB/T 47034-2013工业锅炉技术条件">20201 NB/T
									47034-2013工业锅炉技术条件</a>
							</div>
						</div>
						<div class="z-row">
							<div class="z-col">
								<a href="#" class="gfliitem"
									title="20201 NB/T 47034-2013工业锅炉技术条件">20201 NB/T
									47034-2013工业锅炉技术条件</a>
							</div>
						</div>
						<div class="z-row">
							<div class="z-col">
								<a href="#" class="gfliitem"
									title="20201 NB/T 47034-2013工业锅炉技术条件">20201 NB/T
									47034-2013工业锅炉技术条件</a>
							</div>
						</div>
						<div class="z-row">
							<div class="z-col">
								<a href="#" class="gfliitem"
									title="20201 NB/T 47034-2013工业锅炉技术条件术条件">20201 NB/T
									47034-2013工业锅炉技术条件术条件</a>
							</div>
						</div>
						<div class="z-row">
							<div class="z-col">
								<a href="#" class="gfliitem"
									title="20201 NB/T 47034-2013工业锅炉技术条件术条件">20201 NB/T
									47034-2013工业锅炉技术条件术条件</a>
							</div>
						</div>
						<div class="z-row">
							<div class="z-col">
								<a href="#" class="gfliitem"
									title="20201 NB/T 47034-2013工业锅炉技术条件术条件">20201 NB/T
									47034-2013工业锅炉技术条件术条件</a>
							</div>
						</div>
						<div class="z-row">
							<div class="z-col">
								<a href="#" class="gfliitem"
									title="20201 NB/T 47034-2013工业锅炉技术条件术条件">20201 NB/T
									47034-2013工业锅炉技术条件术条件</a>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="panal2">
				<div id="treeView" class="ztree"></div>
			</div>

			<div class="panal3">
				<div class="pad15">
					<div class="z-row">
						<div style="height:38px; line-height:38px;">章节名称：</div>
						<div class="z-col padR15">
							<input type="text" id="title_node" class="layui-input"
								placeholder="请输入..." />
						</div>
						<div style="height:38px; line-height:38px;">模型类别：</div>
						<div class="z-col">
							<form class="layui-form" action="">
								<select name="interest" lay-filter="aihao">
									<option value=""></option>
									<option value="0">锅炉模型</option>
									<option value="1" selected="">锅炉模型</option>
									<option value="2">锅炉模型</option>
									<option value="3">锅炉模型</option>
									<option value="4">锅炉模型</option>
								</select>
							</form>
						</div>
					</div>
					<div class="z-row">
						<div class="z-col padT15">
							<textarea id="demo" style="display: none;"></textarea>
						</div>
					</div>
					<div class="z-row padTB15">
						<div class="z-col"></div>
						<div class="z-col padR15">
							<button data-toggle="modal" id="save_node"
								class="layui-btn width100 layui-btn-sm">
								<i class="fa fa-plus-square fa-fw"></i>&nbsp;保存
							</button>
						</div>
						<!-- 	<div class="z-col padR15">
							<button data-toggle="modal" 
								class="layui-btn width100 layui-btn-primary layui-btn-sm">
								<i class="fa fa-plus-square fa-fw"></i>&nbsp;添加父章节
							</button>
						</div> -->
						<div class="z-col padR15">
							<button data-toggle="modal" id="addZzj"
								class="layui-btn width100 layui-btn-primary layui-btn-sm">
								<i class="fa fa-plus-square fa-fw"></i>&nbsp;添加子章节
							</button>
						</div>
						<div class="z-col padR15">
							<button data-toggle="modal" id="deleteZzj"
								class="layui-btn width100 layui-btn-primary layui-btn-sm"
								style="border:1px solid #dc521c; color:#dc521c;">
								<i class="fa fa-plus-square fa-fw"></i>&nbsp;删除选中节点
							</button>
						</div>
						<!-- 		<div class="z-col padR15">
							<button data-toggle="modal" id="deleteAllZzj"
								class="layui-btn width100 layui-btn-primary layui-btn-sm"
								style="border:1px solid #dc521c; color:#dc521c;">
								<i class="fa fa-plus-square fa-fw"></i>&nbsp;删除该章节树
							</button>
						</div> -->
						<div class="z-col"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 新建类型 Modal -->
	<div class="modal fade" id="tjgllb" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					新建规范
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<font color="red" style="float:left">*</font><input
						class="form-control" style="width: 98%;" id="_gfmc"
						placeholder="请输入新建规范名称..." type="text">
				</div>
				<div class="modal-body">
					<input class="form-control" style="width: 98%;" id="_gfbb"
						placeholder="请输入新建规范版本..." type="text">
				</div>
				<div class="modal-body">
					<font color="red" style="float:left">*</font><input
						class="form-control" style="width: 98%;" id="_gfjj"
						placeholder="请输入新建规范简介..." type="text">
				</div>
				<div class="modal-footer">
					<font color="red" id="_msg" style="float:left"></font>
					<button id="new" type="button" class="btn btn-primary saveModeType">保存</button>
				</div>
			</div>
		</div>
	</div>
	<script src="${basePath}/home/js/jquery-1.12.0.min.js"></script>
	<script src="${basePath}/home/js/bootstrap.min.js"></script>
	<script src="${basePath}/home/layui/layui.js"></script>
	<script type="text/javascript"
		src="${basePath}/home/js/jquery.ztree.core.min.js"></script>


	<script>
		//新建规范
		$(function() {
			var current_id = null;
			layui.use([ 'element', 'laypage', 'form', 'layedit', 'laypage', 'upload', 'tree' ], function() {
				var laypage = layui.laypage,
					layer = layui.layer,
					$ = layui.jquery,
					upload = layui.upload,
					layedit = layui.layedit;
				layedit.build('demo'); //建立编辑器
	
				$(".saveModeType").unbind().click(function() {
					var _gfmc = $.trim($("#_gfmc").val());
					var _gfbb = $.trim($("#_gfbb").val());
					var _gfjj = $.trim($("#_gfjj").val());
					if (checkOut(_gfmc, _gfjj)) {
						//上传规范名称
						$.ajax({
							type : "POST",
							url : "save_info",
							data : {
								_gfmc : _gfmc,
								_gfbb : _gfbb,
								_gfjj : _gfjj,
								youxianji : 1,
								type : '现行'
							},
							async : false,
							cache : false,
							contentType : "application/x-www-form-urlencoded",
							success : function(data) {
								if (data == 'esit_100') {
									$("#_msg").text("规范名称已存在！");
								} else if (data == 'success_100') {
									//关闭窗口 
									$('#tjgllb').modal('hide');
									getAllGF();
								} else {
									alert("系统错误！");
								}
							},
							error : function(data) {
								console.log("error:" + data.responseText);
							}
						});
	
					}
				});
				function checkOut(_gfmc, _gfjj) {
					if (_gfmc.length <= 0) {
						$("#_msg").text("规范名称不能为空！");
						return false;
					} else if (_gfjj.length <= 0) {
						$("#_msg").text("规范简介不能为空！");
						return false;
					}
					return true;
				}
	
				function getAllGF() {
					$.ajax({
						type : "POST",
						url : "get_GFinfo",
						async : false,
						cache : false,
						contentType : "application/x-www-form-urlencoded",
						success : function(data) {
							if (data) {
								var res = JSON.parse(data);
								$(".gflistbox .z-col").html("");
								fullListOfGF(res);
							}
						},
						error : function(data) {
							console.log("error:" + data.responseText);
						}
					});
				}
				//填充规范列表
				function fullListOfGF(res) {
					var html = "";
					res.map(function(item) {
						html += getHtml(item);
					});
					$(".gflistbox .z-col").html(html);
					var fristNode = $(".gflistbox .z-col").find("a").eq(0);
					fristNode.addClass("gfliitemActive");
					get_guifanInfo(fristNode.attr("_id"));
					addEvenlister();
				}
				function getHtml(item) {
					return '<div class="z-row"> <div class="z-col"> <a _id="' + item.id + '"  href="javascript:;" class="gfliitem" title="' + item.gfName + '">' + item.gfName + '</a> </div> </div>'
				}
				function addEvenlister() {
					$(".gflistbox .z-col a").unbind().click(function() {
						$(".gflistbox .z-col a").removeClass("gfliitemActive");
						$(this).addClass("gfliitemActive");
					});
	
					$("#addZzj").unbind().click(function() {
						if (!current_id) {
							alert("请选择节点");
							return false;
						} else {
							//添加一个节点
							var parid = $(".gfliitemActive").attr("_id")
							$.ajax({
								type : "POST",
								url : "add_guifan",
								data : {
									_pid : current_id.id,
									_parId : parid
								},
								async : false,
								cache : false,
								contentType : "application/x-www-form-urlencoded",
								success : function(data) {
									current_id = null;
									get_guifanInfo(parid);
								},
								error : function(data) {
									console.log("error:" + data.responseText);
								}
							});
	
	
						// gfliitemActive
						}
	
					});
					$("#deleteZzj").unbind().click(function() {
						//判断
	
	
						if (!current_id) {
							alert("请选择节点");
							return false;
						} else {
							if (!current_id.pId) {
								alert("无法删除根节点！");
								return false;
							}
							//添加一个节点
							var parid = $(".gfliitemActive").attr("_id")
							$.ajax({
								type : "POST",
								url : "delete_guifan",
								data : {
									_pid : current_id.id,
									_parId : parid
								},
								async : false,
								cache : false,
								contentType : "application/x-www-form-urlencoded",
								success : function(data) {
									current_id = null;
									get_guifanInfo(parid);
								},
								error : function(data) {
									console.log("error:" + data.responseText);
								}
							});
	
	
						// gfliitemActive
						}
	
					});
	
					//保存
					$("#save_node").unbind().click(function() {
						if (!current_id) {
							alert("请选择节点");
							return false;
						} else {
							var title = $("#title_node").val();
							var area = $('.layui-layedit').find('iframe').contents().find('body').html();
							$.ajax({
								type : "POST",
								url : "add_guifan",
								data : {
									_id : id,
									_title:title,
									_area:area
								},
								async : false,
								cache : false,
								contentType : "application/x-www-form-urlencoded",
								success : function(data) {
									if (data=="success") {
										 alert("已更新！");
									}
								},
								error : function(data) {
									console.log("error:" + data.responseText);
								}
							});
	
	
						}
					});
				}
	
				function get_guifanInfo(id) {
					get_guifanInfo
					if (!id) return false;
					$.ajax({
						type : "POST",
						url : "get_guifanInfo",
						data : {
							_id : id
						},
						async : false,
						cache : false,
						contentType : "application/x-www-form-urlencoded",
						success : function(data) {
							if (data) {
								var res = JSON.parse(data);
								fullListOfOption(res);
								console.info(res);
							}
						},
						error : function(data) {
							console.log("error:" + data.responseText);
						}
					});
				}
	
				function fullListOfOption(data) {
					var nodes = [];
					data.map(function(item, index) {
						var option = {};
						if (item.pid == 0) {
							option.isParent = true;
						}
						if (index == data.length - 1) {
							setEditorAndTitle(item.nodeName, item.content);
						}
						option.open = true;
						option.name = item.nodeName;
						option.id = item.id;
						option.pId = item.pid;
						nodes.push(option);
					});
	
					initTree(nodes);
				}
	
	
				function initTree(option) {
					var setting = {
						data : {
							simpleData : {
								enable : true
							}
						},
						callback : {
							onClick : zTreeOnClick
						}
					};
	
					$(document).ready(function() {
						$.fn.zTree.init($("#treeView"), setting, option);
					});
	
				}
	
	
				function getguifanByid(id) {
					if (!id) return false;
					$.ajax({
						type : "POST",
						url : "getguifanByid",
						data : {
							_id : id
						},
						async : false,
						cache : false,
						contentType : "application/x-www-form-urlencoded",
						success : function(data) {
							if (data) {
								var res = JSON.parse(data)[0];
								setEditorAndTitle(res.nodeName, res.content);
							}
						},
						error : function(data) {
							console.log("error:" + data.responseText);
						}
					});
				}
	
				function zTreeOnClick(event, treeId, treeNode) {
					console.info(treeNode);
					current_id = treeNode
					//更新表格
					getguifanByid(treeNode.id);
				}
	
	
	
				function setEditorAndTitle(title, area) {
					$("#title_node").val(title);
					$('.layui-layedit').find('iframe').contents().find('body').html(area);
				}
	
				initTree();
				getAllGF();
			})
	
		})
	</script>

</body>
</html>
