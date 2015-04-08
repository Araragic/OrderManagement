<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="cn.emagsoftware.dm.bean.Requirement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>修改上线订单成功页面</title>

<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/font-awesome.min.css" />

<!-- text fonts -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ace-fonts.css" />

<!-- ace styles -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ace.min.css"
	id="main-ace-style" />

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ace-rtl.min.css" />

<style>
/* some elements used in demo only */
.spinner-preview {
	width: 100px;
	height: 100px;
	text-align: center;
	margin-top: 60px;
}

.dropdown-preview {
	margin: 0 5px;
	display: inline-block;
}

.dropdown-preview>.dropdown-menu {
	display: block;
	position: static;
	margin-bottom: 5px;
}
</style>


</head>
<body style="background-color: white">
	<div class="alert alert-block alert-success">
		<a href="../index/home"><button type="button" class="close">
				<i class="ace-icon fa fa-times"></i>
			</button></a>

		<p>
			<strong> <i class="ace-icon fa fa-check"></i> 修改成功!
			</strong> 您已经成功修改上线工单。
		</p>
	</div>
</body>
<script type="text/javascript"> 
function run(){
	  window.location= '/Emagdm/index/home ';
	}
	window.onload=function(){
	  setTimeout('run()',3000);
	};
</script> 
</html>