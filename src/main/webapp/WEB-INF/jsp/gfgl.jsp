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
	
	
<script type="text/javascript" charset="utf-8"
	src="${basePath}/static/assets/scripts/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${basePath}/static/assets/scripts/editor_api.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
	src="${basePath}/static/assets/scripts/zh-cn/zh-cn.js"></script>	
	

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
					<li class="layui-nav-item"><a class=""
						href="${basePath}/home/index"><i class="fa fa-cube fa-fw"></i>&nbsp;锅炉模型</a></li>
				    <li class="layui-nav-item"><a 
						href="${basePath}/home/addmodel"><i class="fa fa-gear fa-fw"></i>&nbsp;添加3D模型</a></li>
					<li class="layui-nav-item"><a class=""
						href="${basePath}/home/case"><i class="fa fa-cubes fa-fw"></i>&nbsp;锅炉案例</a></li>
					<li class="layui-nav-item layui-nav-itemed"><a
						href="${basePath}/home/gfgl"><i class="fa fa-gear fa-fw"></i>&nbsp;规范管理</a></li>
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
						<button data-toggle="modal" id="delete_guifan"
							class="layui-btn width100 layui-btn-primary layui-btn-sm">
							<i class="fa fa-trash fa-fw"></i>&nbsp;删除
						</button>
					</div>
				</div>

				<div class="z-row gftopsearch">
					<div class="z-col">
						<input type="text" id="search_" placeholder="请输入搜索关键词"
							class="layui-input" />
					</div>
					<div>
						<button class="layui-btn" id="dosearch">
							<i class="fa fa-search fa-fw"></i>
						</button>
					</div>
				</div>

				<div class="z-row gflistbox">
					<div class="z-col"></div>
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
						<div style="height:38px; line-height:38px;">类别：</div>
						<div class="z-col">
							<form class="layui-form" action="">
								<select name="interest" lay-filter="aihao" id="show_type">
									<option value="现行">现行</option>
									<option value="替代">替代</option>
									<option value="废止">废止</option>
								</select>
							</form>
						</div>

						<div style="height:38px; line-height:38px;     margin-left: 10px;">优先级：</div>
						<div class="z-col">
							<input type="number" class="layui-input" id="showYxj"
								placeholder="1">
						</div>

					</div>
					<div class="z-row">
						<div class="z-col padT15">
						<script id="bj-editer" type="text/plain"
												style="width:100%;height:550px;"></script>
						<!-- 	<textarea id="demo" style="display: none;"></textarea> -->
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
					<div class="z-row">
						<div
							style="width:80px;text-align:right;line-height:30px;padding-right:5px;">
							<font color="red">*</font>
						</div>
						<div class="z-col">
							<input class="form-control" style="width: 100%;" id="_gfmc"
								placeholder="请输入新建规范名称..." type="text">
						</div>
					</div>

				</div>
				<div class="modal-body">
					<div class="z-row">
						<div
							style="width:80px;text-align:right;line-height:30px;padding-right:5px;">
							<font>选填</font>
						</div>
						<div class="z-col">
							<input class="form-control" id="_gfbb" placeholder="请输入新建规范版本..."
								type="text">
						</div>
					</div>
				</div>
				<div class="modal-body">
					<div class="z-row">
						<div
							style="width:80px;text-align:right;line-height:30px;padding-right:5px;">
							<font color="red">*</font>
						</div>
						<div class="z-col">
							<input class="form-control" id="_gfjj" placeholder="请输入新建规范简介..."
								type="text">
						</div>
					</div>

				</div>


				<div class="modal-body">
					<div class="z-row">
						<div
							style="width:80px;text-align:right;line-height:30px;padding-right:5px;">类别：</div>
						<div class="z-col">
							<form class="layui-form" action="">
								<select name="interest" id="_typeOfGF" lay-filter="aihao">
									<option value="现行">现行</option>
									<option value="替代">替代</option>
									<option value="废止">废止</option>
								</select>
							</form>
						</div>
					</div>
				</div>

				<div class="modal-body">
					<div class="z-row">
						<div
							style="width:80px;text-align:right;line-height:30px;padding-right:5px;">优先级：</div>
						<div class="z-col">
							<input type="number" class="layui-input" id="_yxjOfGF" value='1'
								placeholder="1">
						</div>
					</div>
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
		 UE.getEditor('bj-editer');
		$(function() {
			var current_id = null;
			layui.use([ 'element', 'laypage', 'form', 'layedit', 'laypage', 'upload', 'tree' ], function() {
				var laypage = layui.laypage,
					layer = layui.layer,
					$ = layui.jquery,
					upload = layui.upload,
					layedit = layui.layedit;
				    // layedit.build('demo'); //建立编辑器
				   
	
				$(".saveModeType").unbind().click(function() {
					var _gfmc = $.trim($("#_gfmc").val());
					var _gfbb = $.trim($("#_gfbb").val());
					var _gfjj = $.trim($("#_gfjj").val());
	
					var _yxjOfGF = $.trim($("#_yxjOfGF").val());
					var _typeOfGF = $.trim($("#_typeOfGF").val());
	
					if (checkOut(_gfmc, _gfjj)) {
						//上传规范名称
						$.ajax({
							type : "POST",
							url : "save_info",
							data : {
								_gfmc : _gfmc,
								_gfbb : _gfbb,
								_gfjj : _gfjj,
								youxianji : _yxjOfGF,
								type : _typeOfGF
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
									layer.msg('系统错误！', {
										icon : 2
									});
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
					if (_gfmc.length > 200) {
						$("#_msg").text("规范名称太长，请保持200个字符以内！");
						return false;
					}
	
					if (_gfjj.length > 500) {
						$("#_msg").text("规范简介太长，请保持500个字符以内！");
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
						//展示列表
						get_guifanInfo($(this).attr("_id"));
					});
	
					//搜索
					$("#dosearch").unbind().click(function() {
						var text = $.trim($(search_).val());
						$.ajax({
							type : "POST",
							url : "search_guifanPar",
							data : {
								_gjz : text,
							},
							async : false,
							cache : false,
							contentType : "application/x-www-form-urlencoded",
							success : function(data) {
								fullListOfGF(JSON.parse(data));
							},
							error : function(data) {
								console.log("error:" + data.responseText);
							}
						});
					});
	
	
					$("#addZzj").unbind().click(function() {
						if (!current_id) {
							layer.msg('请选择节点！', {
								icon : 2
							});
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
	 
						}
	
					});
	
					//删除章节目录
					$("#deleteZzj").unbind().click(function() {
						//判断
						if (!current_id) {
							layer.msg('请选择节点！', {
								icon : 2
							});
							return false;
						} else {
							layer.confirm('是否决定删除选中的章节？', {
								btn : [ '否', '确定' ] //按钮
							}, function() {
								layer.msg('已取消！', {
									icon : 1
								});
							}, function() {
								if (!current_id.pId) {
									layer.msg('无法删除根节点！', {
										icon : 2
									});
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
							})
	
						// gfliitemActive
						}
					});
	
					//保存
					$("#save_node").unbind().click(function() {
						if (!current_id) {
							layer.msg('请选择节点！', {
								icon : 2
							});
							return false;
						} else {
							var title = $("#title_node").val();
							//var area = $('.layui-layedit').find('iframe').contents().find('body').html();
							var area =  UE.getEditor('bj-editer').getContent();
							
							$.ajax({
								type : "POST",
								url : "add_guifan_update",
								data : {
									_id : current_id.id,
									_title : title,
									_area : area
								},
								async : false,
								cache : false,
								contentType : "application/x-www-form-urlencoded",
								success : function(data) {
									if (data == "success") {
										var parid = $(".gfliitemActive").attr("_id")
										get_guifanInfo(parid);
										layer.msg('已更新！', {
											icon : 1
										});
									}
								},
								error : function(data) {
									console.log("error:" + data.responseText);
								}
							});
						}
					});
	
					$("#delete_guifan").unbind().click(function() {
						//删除规范
						var parid = $(".gfliitemActive").attr("_id")
						layer.confirm('是否决定删除选中的规范？', {
							btn : [ '否', '确定' ] //按钮
						}, function() {
							layer.msg('已取消！', {
								icon : 1
							});
						}, function() {
							$.ajax({
								type : "POST",
								url : "delete_guifan_All",
								data : {
									parid : parid,
								},
								async : false,
								cache : false,
								contentType : "application/x-www-form-urlencoded",
								success : function(data) {
									if (data == "success") {
										layer.msg('删除成功', {
											icon : 1
										});
									}
									getAllGF();
								},
								error : function(data) {
									console.log("error:" + data.responseText);
								}
							});
						});
					});
				}
	
				function get_guifanInfo(id) {
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
							setEditorAndTitle(item.nodeName, item.content, item.type, item.youxianji);
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
								setEditorAndTitle(res.nodeName, res.content, res.type, res.youxianji);
							}
						},
						error : function(data) {
							console.log("error:" + data.responseText);
						}
					});
				}
	
				function zTreeOnClick(event, treeId, treeNode) {
					current_id = treeNode
					//更新表格
					getguifanByid(treeNode.id);
				}
	
	
	
				function setEditorAndTitle(title, area, t, y) {
					$("#title_node").val(title);
					UE.getEditor('bj-editer').setContent(area);
					//$('.layui-layedit').find('iframe').contents().find('body').html(area);
					$("#show_type").val(t);
					$("#showYxj").val(y);
					layui.form.render()
				}
	
				initTree();
				getAllGF();
			})
	
		})
	</script>

</body>
</html>
