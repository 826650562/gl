<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("basePath", request.getContextPath());
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>锅炉信息集成系统</title>
<link rel="icon" href="${basePath}/home/images/favicon.png">
<link href="${basePath}/home/fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- Bootstrap framework main css -->
<link rel="stylesheet" href="${basePath}/home/css/bootstrap.min.css">
<!-- This core.css file contents all plugings css file. -->
<link rel="stylesheet" href="${basePath}/home/css/core.css">
<!-- Theme shortcodes/elements style -->
<link rel="stylesheet" href="${basePath}/home/css/shortcode/shortcodes.css">
 
<!-- Responsive css -->
<link rel="stylesheet" href="${basePath}/home/css/responsive.css">
<!-- User style -->
<link rel="stylesheet" href="${basePath}/home/css/custom.css">
<link href="${basePath}/home/css/z-layout.css" rel="stylesheet">
<link href="${basePath}/home/css/style.css" rel="stylesheet">
<!-- Modernizr JS -->
<style type="text/css">
   html{height:100%;}
   body{ position:relative;background:url(${basePath}/home/images/other/jz.jpg) no-repeat top center; position:relative; height:100%;}
  .xfxx{width:100%; padding-bottom:60px; position:absolute; bottom:0px; left:0px; z-index:9999;}
  .zbfbox{width:100%; position:relative; height:150px; padding:25px 0px; margin-bottom:30px;}
  .zbfboxinner{ height:150px; width:100%; position:absolute;opacity:0.8; top:0px; left:0px; background:#fff; z-index:9999;}
  .zbfboxinner2{position:absolute; height:150px; box-sizing:border-box; padding:15px; text-align:center;  width:100%; top:0px; left:0px; z-index:9999; }
  .ydytitle{font-size:24px; font-weight:bold; padding:10px 0px 5px 0px;}
  .ydyerjititle{font-size:16px; font-weight:bold; padding:20px 0px; }
  .ydynr{font-size:15px; color:#000;}
  .ydynr span{ display:block; float:left; padding:0px 10px;}
</style>

</head>
<body>
<div class="xfxx">
    <div class="zbfbox">
       <div class="zbfboxinner"></div>
       <div class="zbfboxinner2">
          <div class="z-row">
             <div class="z-col"> </div>
             <div class="ydytitle">锅炉信息集成系统</div>
             <div class="z-col"> </div>
          </div>
          <div class="z-row">
             <div class="z-col"> </div>
             <div class="ydyerjititle">基于VR的在线3D工业锅炉信息集成系统</div>
             <div class="z-col"> </div>
          </div>
          <div class="z-row">
             <div class="z-col"> </div>
             <div class="ydynr">
                <span>制作人：</span>
                <span>何泾渭</span>
                <span>丁红</span>
                <span>黄锐钦</span>
                <span>徐洪涛</span>
                <span>张拴羊</span>
                <span>张腾腾</span>
             </div>
             <div class="z-col"> </div>
          </div>
       </div>
    </div>
    <div class="z-row">
       <div class="z-col"> </div>
       <div><a href="index" class="jrwzbtn"><i class="fa fa-sign-in fa-fw"></i>&nbsp;进入网站</a></div>
       <div class="z-col"> </div>
    </div>
</div>
</body>
</html>
 