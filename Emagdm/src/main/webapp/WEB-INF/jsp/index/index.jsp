<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>欢迎使用工单系统</title>
		<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/assets/avatars/emagsoftware.png" media="screen" />
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/font-awesome.min.css" />
		<!-- text fonts -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ace-fonts.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ace.min.css" id="main-ace-style" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ace-rtl.min.css" />
		<!-- ace settings handler -->
		<script src="<%=request.getContextPath()%>/assets/js/ace-extra.min.js"></script>
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
</head>
<body class="no-skin">
	<!-- #section:basics/navbar.layout -->
	<!-- 顶部状态栏开始 -->
	<div id="navbar"
		class="navbar navbar-default    navbar-collapse       h-navbar">
		<script type="text/javascript">
			try {
				ace.settings.check('navbar', 'fixed')
			} catch (e) {
			}
		</script>
		<div class="navbar-container" id="navbar-container">
			<div class="navbar-header pull-left">
				<!-- #section:basics/navbar.layout.brand -->
				<a href="home#ajax/homepage/home" class="navbar-brand"> <small> <i
						class="fa fa-leaf"></i> 工单管理系统
				</small>
				</a>
				<!-- /section:basics/navbar.layout.brand -->

				<!-- #section:basics/navbar.toggle -->
				<button class="pull-right navbar-toggle navbar-toggle-img collapsed"
					type="button" data-toggle="collapse"
					data-target=".navbar-buttons,.navbar-menu">
					<span class="sr-only">Toggle user menu</span> <img
						src="<%=request.getContextPath()%>/assets/avatars/emagsoftware.png" />
				</button>
				<button class="pull-right navbar-toggle collapsed" type="button"
					data-toggle="collapse" data-target=".sidebar">
					<span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span>

					<span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<!-- /section:basics/navbar.toggle -->
			</div>
			<!-- #section:basics/navbar.dropdown  -->
			<div class="navbar-buttons navbar-header pull-right  collapse navbar-collapse"
				role="navigation">
				<ul class="nav ace-nav">
					<!-- #section:basics/navbar.user_menu 用户界面-->
					<li class="light-blue">
					<a data-toggle="dropdown" href="#" class="dropdown-toggle"> 
					<img class="nav-user-photo" src="<%=request.getContextPath()%>/assets/avatars/emagsoftware.png" /> 
					<span class="user-info"> <small>&nbsp;&nbsp;&nbsp;Welcome&nbsp;&nbsp;</small><%=session.getAttribute("username")%></span> 
					<i class="ace-icon fa fa-caret-down"></i>
					</a>
						<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<li><a href="/Emagdm/index/logout"> <i class="ace-icon fa fa-power-off"></i>
									登出
							</a></li>
						</ul></li>
					<!-- /section:basics/navbar.user_menu 用户界面结束-->
				</ul>
			</div>
			<!-- #section:basics/navbar.dropdown  -->
			<!-- /section:basics/navbar.dropdown  Message图标和search框-->
			<!-- /section:basics/navbar.dropdown  Message图标和search框-->
		</div>
		<!-- /.navbar-container -->
	</div>
	<!-- 顶部状态栏结束 -->

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>

		<!-- #section:basics/sidebar.horizontal 第二行选择栏开始-->
		<div id="sidebar"
			class="sidebar     h-sidebar   navbar-collapse collapse">
			<script type="text/javascript">
				try {
					ace.settings.check('sidebar', 'fixed')
				} catch (e) {
				}
			</script>
			<!-- 四色框框 -->
			<div class="sidebar-shortcuts" id="sidebar-shortcuts" >
				<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
					<span class="btn btn-success"></span> <span class="btn btn-info"></span>
					<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
				</div>
			</div>
			<!-- /.sidebar-shortcuts 四色框框 -->

			<ul class="nav nav-list">
				<li class="active open hover"><a data-url="ajax/homepage/home" href="home#ajax/homepage/home">
						<i class="menu-icon fa fa-desktop"></i> <span class="menu-text">主页君
					</span> <b class="arrow fa fa-angle-down"></b>
				</a><b class="arrow"></b></li>
				
				<li class="active open hover"><a data-url="ajax/requirement/insert" href="home#ajax/requirement/insert">
						<i class="menu-icon fa fa-pencil-square-o"></i> <span class="menu-text">添加需求
					</span> <b class="arrow fa fa-angle-down"></b>
				</a><b class="arrow"></b></li>
			</ul>
			<!-- /.nav-list -->
			<!-- #section:basics/sidebar.layout.minimize -->
			<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
				<i class="ace-icon fa fa-angle-double-left"
					data-icon1="ace-icon fa fa-angle-double-left"
					data-icon2="ace-icon fa fa-angle-double-right"></i>
			</div>
			<!-- /section:basics/sidebar.layout.minimize -->
			<script type="text/javascript">
				try {
					ace.settings.check('sidebar', 'collapsed')
				} catch (e) {
				}
			</script>
		</div>
		<!-- #section:basics/sidebar.horizontal 第二行选择栏结束-->
		<!-- 主页面开始 -->
		<div class="main-content">
			<div class="page-content">
				<div class="page-content-area">
				<!-- 这里面显示是ajax页面 -->
				</div>
			</div>
		</div>
		<!-- 主页面结束 -->
		<div class="footer"> 
			<div class="footer-inner">
				<!-- #section:basics/footer -->
				<div class="footer-content">
					<span class="bigger-120"> <span class="blue bolder">南京朗睿科技有限公司</span>
					&copy; 2015
					</span> &nbsp; &nbsp;
				</div>
				<!-- /section:basics/footer -->
			</div>
		</div>
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!--[if !IE]> -->
	<script type="text/javascript">
		window.jQuery || document.write("<script src='<%=request.getContextPath()%>/assets/js/jquery.min.js'>" + "<"+"/script>");
	</script>
	<!-- <![endif]-->
	<script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
	<!-- ace scripts -->
	<script src="<%=request.getContextPath()%>/assets/js/ace-elements.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/ace.min.js"></script>
	
	<!-- 加载ajax页面使用的函数 -->
	<script src="<%=request.getContextPath()%>/assets/js/ace/ace.ajax-content.js"></script>
	<script type="text/javascript">
	$(function () { $("[data-toggle='tooltip']").tooltip(); });
		//Load content via ajax
		ace.enable_ajax_content(jQuery, {
			content_url : function(url) {
				//alert("url" + url);
				if (!url.match(/^ajax\//)) {
					return false;
				}
					var path = document.location.pathname;
					//alert("10000" + path);
					//for Ace HTML demo version, convert index.jsp#ajax/homepage to > homepage and load it
					if (path.match(/home/)) {
						var change = path.replace(/index\/home/, url.replace(/^ajax\//, ''));
						//alert("20000" + change);
						return change;
					}
			},
			default_url : 'ajax/homepage/home'//default url
		});
	</script>
	<!-- 加载ajax页面使用的函数 -->
</body>
</html>
