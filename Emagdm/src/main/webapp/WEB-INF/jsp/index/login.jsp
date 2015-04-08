<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="description" content="User login page" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<title>用户登陆</title>
<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/assets/avatars/emagsoftware.png" media="screen" />
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/font-awesome.min.css" />
<!-- text fonts -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ace-fonts.css" />
<!-- ace styles -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ace.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ace.onpage-help.css" />
</head>


<body class="login-layout light-login" >
	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="center">
							<h1>
								<i class="ace-icon fa fa-leaf green"></i> <span class="red">工单</span>
								<span class="grey" id="id-text2">管理系统</span>
							</h1>
							<h4 class="blue" id="id-company-text">&copy; 南京朗瑞科技</h4>
						</div>

						<div class="space-6"></div>

						<div class="position-relative">
							<div id="login-box"
								class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<i class="ace-icon fa fa-coffee green"></i> 
											请输入登录信息
										</h4>
										<div class="space-6"></div>

										<form:form modelAttribute="contentModel" class="login-form" method="POST">
											<fieldset>
												<label class="block clearfix"> 
													<span class="block input-icon input-icon-right"> 
														<form:input path="username" type="text" class="form-control"  
														placeholder="用户名" onfocus="clearCss();"  onblur="checkIsExist()"/><br/>
														<span id="showResult2" class="col-sm-4 control-label no-padding-left"></span>
															<i class="ace-icon fa fa-user"></i>
													</span>
												</label> 
												<label class="block clearfix"> 
													<span class="block input-icon input-icon-right"> 
														<form:password path="password" class="form-control" autocomplete="off" placeholder="密码" /><br/>
														<form:errors path="password" class="field-has-error" style="color:red"></form:errors> 
															<i class="ace-icon fa fa-lock"></i>
													</span>
												</label> 

												<div class="space"></div>

												<div class="clearfix">
													<button type="submit"
														class="width-35 pull-right btn btn-sm btn-primary" id="submit">
														<i class="ace-icon fa fa-key"></i> 
														<span class="bigger-110">登陆</span>
													</button>
												</div>
												<div class="space-4"></div>
											<div class="social-or-login center">
												<span class="bigger-110">欢迎使用</span>
											</div>
											</fieldset>
										</form:form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- inline scripts related to this page -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
	<script type="text/javascript">
	function checkIsExist() {  
        var username = $.trim($("#username").val());  
        $.ajax({  
            type:"POST",  
            url:"<%=request.getContextPath()%>/checkUser", 
				data : "username=" + username, 
				dataType : "json", 
				complete : function(data) {
					var result = eval("(" + data.responseText + ")");
					if (result) {
						$("#showResult2").html("<div style='width:200px'><font color='red'>该用户不能登陆!</font></div>");
						$("#submit").attr("disabled",true);
					} else {
						$("#showResult2").html("");
						$("#submit").attr("disabled",false);
					}
				}
			});
	}
	function clearCss() {
	$("#showResult").html("");
	}	
	</script>
</body>
</html>