//前台模型详情页面
$(function() {
	var mode_id = $(".tag_id").attr("_id");
	if (mode_id) {
		getModeInfoByid();
	}
	var outlinePass,_object,mydata;
	setOutline=function(d,o){
		outlinePass=d;
		_object=o;
		mydata = $.extend([], _object.children);  
	}
	
	function getModeInfoByid() {
		$.ajax({
			type : "POST",
			url : "../home/getModeById",
			async : false,
			cache : false,
			data : {
				_id : mode_id
			},
			contentType : "application/x-www-form-urlencoded",
			success : function(data) {
				var res = JSON.parse(data)[0];
				fullHmtl(res);
			},
			error : function(data) {
				console.log("error:" + data.responseText);
			}
		});
	}

	function fullHmtl(res) {
		$(".jjnrcont").html(res.info);
		$(".moode_name").text(res.name);
		fullPartsList();
		$("#modeContainer").attr({
			'_obj' : res.obj,
			'_mtl' : res.mtl,
		});
		$("#modeContainer").attr("src", "loadMode");
	}
	function fullPartsList() {
		$.ajax({
			type : "POST",
			url : "../home/getAllModeparts",
			async : false,
			cache : false,
			data : {
				_id : mode_id
			},
			contentType : "application/x-www-form-urlencoded",
			success : function(data) {
				var res = JSON.parse(data);
				console.info(res);
				fullPartsHmtl(res);
			},
			error : function(data) {
				console.log("error:" + data.responseText);
			}
		});
	}

	function fullPartsHmtl(d) {
		var html = "";
		d.map(function(item) {
			html += getHmtl(item);
		});
		$(".sidebar-menu").html(html);
		addEvenlister();
	}

	function getHmtl(d) {
		return '<li _partId='+d.id+'><a href="javascript:;">' + d.part_name + ' <span class="slidebarxtb"><input value='+d.part_ids+' type="checkbox"  lay-filter="part_mode"  _type=parta lay-skin="primary"  ><div class="layui-unselect layui-form-checkbox layui-form-checked" lay-skin="primary"><i class="layui-icon"></i></div></span></a></li>'
	}
	function addEvenlister() {
		$(".sidebar-menu li").unbind().click(function() {
			$(".sidebar-menu li a").removeClass("bjactive");
			$(this).find("a").addClass("bjactive");
			var _partId=$(this).attr("_partId");
			getInfoBy_partId(_partId);
		});
		
		layui.use([ 'form', 'layedit', 'laydate' ], function() {
			var form = layui.form;
			form.on('checkbox(allChecked)', function(data) {
				if(data.elem.checked){
					$("[_type=parta]").prop("checked", true);	
					form.render();
					$("[_type=parta]").each(function(index, item) {
						var datas=_getParts($(item).val().split(','));
						datas.map(function(d){
							_object.remove(d);
						});
					});
				}else{
					$("[_type=parta]").prop("checked", false);	
					form.render();
					$("[_type=parta]").each(function(index, item) {
						var datas=_getParts($(item).val().split(','));
						datas.map(function(d){
							_object.add(d);
						});
					});
				}
				
			});
			
			form.on('checkbox(part_mode)', function(data) {
				if(data.elem.checked){
					form.render();
					var datas=_getParts(data.value.split(','));
					datas.map(function(d){
						_object.remove(d);
					});
				}else{
					form.render();
					var datas=_getParts(data.value.split(','));
					datas.map(function(d){
						_object.add(d);
					});
				}
			});
		});
		
		$('#xxxmodle').on('show.bs.modal', function(e) {
		    $(".xxxmodle_body").html($(".part_detail").html());
		})
	}
	
	function getInfoBy_partId(id){
		$.ajax({
			type : "POST",
			url : "../home/getInfoOfPart",
			async : false,
			cache : false,
			data : {
				_id : id
			},
			contentType : "application/x-www-form-urlencoded",
			success : function(data) {
				var res = JSON.parse(data)[0];
				$(".part_detail").html(res.part_info);
				var ids=res.part_ids.split(",");
				ids=ids.map(function(id){
					return parseInt(id);
				});
				if(ids.length>0){
					outlinePass.selectedObjects=_getParts(ids);
				}
			},
			error : function(data) {
				console.log("error:" + data.responseText);
			}
		});
	}
	
	
	function _getParts(arr) {
		var modeParts = [];
		arr.map(function(item) {
			mydata.map(function(data) {
				if (data.name == item) {
					modeParts.push(data);
				}
			});
		});
		return modeParts
	}


})