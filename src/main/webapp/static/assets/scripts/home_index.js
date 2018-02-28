$(function() {
	//后台首页js
	addEvenlister();

	function addEvenlister() {
		$(".saveModeType").click(function() {
			var type = $.trim($("#_gltype").val());
			if (type.length <= 0) {
				$("#_msg").text("类型不能为空！");
				return false;
			} else {
				saveModeType(type);
			}
		});

		var delet_type;
		$('#del-confirm-model').on('show.bs.modal', function(e) {
			// do something...
			delet_type = $("#_select_guoluType").find("option:selected").text();
			$("#deleType_msg").text("确认删除'" + delet_type + "'吗");
		})



		$("#delete_type").click(function() {
			deleteModeType(delet_type);
		});
	}
	
	function deleteModeType(type){
		$.ajax({
			type : "POST",
			url : "deleteModeType",
			data : {
				_type : type,
			},
			async : false,
			cache : false,
			contentType : "application/x-www-form-urlencoded",
			success : function(data) {
			 if(data=='1000'){
				 $('#del-confirm-model').modal('hide');
				 $("#_select_guoluType").find("option:selected").remove();
			  }
			},
			error : function(data) {
				console.log("error:" + data.responseText);
			}
		});
	}

	function saveModeType(type) {
		$.ajax({
			type : "POST",
			url : "saveModeType",
			data : {
				_type : type,
			},
			async : false,
			cache : false,
			contentType : "application/x-www-form-urlencoded",
			success : function(data) {
				if (data == "_10001") {
					$("#_msg").text("类型已存在！");
				} else {
					$("#_select_guoluType").append("<option value=" + type + ">" + type + "</option>");
					$('#newModal').modal('hide')
				}
			},
			error : function(data) {
				console.log("error:" + data.responseText);
			}
		});
	}


})