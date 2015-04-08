<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ace.min.css" id="main-ace-style" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ace-rtl.min.css" />
</head>
<body style="background-color: white">
	<div class="alert alert-danger">
		<a href="javascript:goBack()">
			<button type="button" class="close">
				<i class="ace-icon fa fa-times"></i>
			</button>
		</a> 
			<strong><i class="ace-icon fa fa-times"></i> 未找到需要下载的文件!</strong> 
		<br />
	</div>
</body>
<script>
function goBack(){
	history.go(-1);
}

</script>
</html>