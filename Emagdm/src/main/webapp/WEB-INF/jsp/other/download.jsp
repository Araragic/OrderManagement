<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import= "java.util.List" %>
<%@ page import= "java.net.URLEncoder" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/jquery-ui.custom.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ace.min.css" id="main-ace-style" />
</head>
<body style="background: white">
	<div class="widget-header center">
		<h6 class="widget-title bigger lighter">
		<i class="ace-icon fa fa-cloud-download"></i>		
				下载文档数据
		</h6>
	</div>
	<div class="widget-body">
		<div class="widget-main no-padding">
			<table class="table table-striped table-bordered table-hover">
				<thead class="thin-border-bottom">
					<tr>
						<th >文件名</th>
						<th class="hidden-480 center">操作</th>
					</tr>
				</thead>
				<c:forEach varStatus="s" items="${fileNameList}">
				<tbody>
					<tr id="${s.index }">
						<td >${s.current } </td>
						<td class="hidden-480 center">
							<a href="/Emagdm/homepage/downloadFile?fileName=${s.current }" >点击下载&nbsp;</a>
							<a href="javascript:deleteFile('${s.current }',${s.index });">点击删除</a>
						</td>
					</tr>
				</tbody>
			</c:forEach>
			</table>
		</div>
	</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
<script type="text/javascript">
function deleteFile(fileName,id) {
	if(window.confirm('你确定要删除数据吗？')){
	    $.ajax({
	        type: "GET",
	        url: "/Emagdm/requirement/deleteFile",
	        data: "fileName=" + fileName,
	        dataType: "json",
	        complete: function(data) {
	            var result = eval("(" + data.responseText + ")");
	            if (result) {
	                $("#" + id ).attr("style", "display:none");
	            } else {
	                alert("删除失败");
	            }
	        },
	    });
	}
}
</script>
</body>
</html>