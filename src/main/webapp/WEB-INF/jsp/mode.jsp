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
<link rel="stylesheet" href="${basePath}/static/assets/layui/css/layui.css">



<script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-2.1.4.min.js"></script>
<script src="${basePath}/static/assets/scripts/three.js"></script>
<script src="${basePath}/static/assets/scripts//threeIndex_v2.js"></script>

<script src="${basePath}/static/assets/scripts/three.js" type="text/javascript"></script>
<script src="${basePath}/static/assets/scripts/OrbitControls.js" type="text/javascript"></script>
<script src="${basePath}/static/assets/scripts/OBJLoader.js" type="text/javascript"></script>
<script src="${basePath}/static/assets/scripts/MTLLoader.js" type="text/javascript"></script>
<script src="${basePath}/static/assets/scripts/CopyShader.js"></script>
<script src="${basePath}/static/assets/scripts/FXAAShader.js"></script>
<script src="${basePath}/static/assets/scripts/EffectComposer.js"></script>
<script src="${basePath}/static/assets/scripts/RenderPass.js"></script>

<script src="${basePath}/static/assets/scripts/ShaderPass.js"></script>
<script src="${basePath}/static/assets/scripts/OutlinePass.js"></script>
<script src="${basePath}/static/assets/layui/layui.js"></script>

<script
	src="${basePath}/static/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<style>
.mode_main {
	height: 500px;
	width: 800px;
	float: left;
}

::-webkit-scrollbar {
    width: 2px;
    height: 2px;
}

::-webkit-scrollbar-button:vertical {
    display: none;
}

::-webkit-scrollbar-track,
::-webkit-scrollbar-corner {
    background-color: #e2e2e2;
}

::-webkit-scrollbar-thumb {
    border-radius: 0;
    background-color: rgba(0, 0, 0, .3);
}

::-webkit-scrollbar-thumb:vertical:hover {
    background-color: rgba(0, 0, 0, .35);
}

::-webkit-scrollbar-thumb:vertical:active {
    background-color: rgba(0, 0, 0, .38);
}
</style>
</head>

<body>
	<div class="model-show" style="background: #e6e6e6; min-height:500px"
		id="model-show"></div>
		
	<script>
		layui.use('layedit', function() {
			var layedit = layui.layedit;
			layedit.build('editor'); //建立编辑器
		});
		
	</script>
</body>

</html>