<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>朗睿科技工单管理系统</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/ui.jqgrid.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/jquery-ui.custom.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/datepicker.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/daterangepicker.css" />

<!-- /.page-header -->
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<div class="center">
			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<div class="alert alert-block alert-success">
						<i class="ace-icon fa fa-check green"></i> 欢迎来到 <strong
							class="green"> 工单管理系统 
						</strong>
					</div>

					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->
							<div class="widget-body">
								<div class="widget-main">
									<div class="form-inline">
										需求工单：
										<div class="input-group ">
											<input id="requirement_num" name="requirement_num"
												type="text" class="input-small" placeholder="需求工单查询" />
										</div>
										&nbsp;&nbsp; 负责人：
										<div class="input-group ">
											<input id="manager" name="manager" type="text"
												class="input-small" placeholder="负责人查询" />
										</div>
										&nbsp;&nbsp; 标题：
										<div class="input-group ">
											<input id="title" name="title" type="text"
												class="input-small" placeholder="标题查询" />
										</div>
										&nbsp;&nbsp; 状态：
										<div class="input-group">
											<select class="form-control" id="status" name="status">
												<option value="">状态查询</option>
												<option value="未完成">未完成</option>
												<option value="已完成">已完成</option>
											</select>
										</div>
										&nbsp;&nbsp; 模块：
										<div class="input-group">
											<select class="form-control" id="module" name="module">
												<option value="0">模块查询</option>
												<option value="-1">无上线需求</option>
												<option value="1">游戏大厅</option>
												<option value="2">wap门户</option>
												<option value="3">渠道</option>
												<option value="4">实时接口</option>
												<option value="5">营销系统</option>
												
											</select>
										</div>
										&nbsp;&nbsp; 上线时间：
										<div class="input-daterange input-group">
											<input type="text" class="input-mini" name="start"
												id="leftDate" /> <span class="input-group-addon"> <i
												class="fa fa-exchange"></i>
											</span> <input type="text" class="input-mini" name="end"
												id="rightDate" />
										</div>
										&nbsp;&nbsp;
										<div class="input-group">
											<span class="input-group-btn">
												<button class="btn btn-purple btn-sm"
													onclick="multipleSearch()">
													查找一下 <i
														class="ace-icon fa fa-search icon-on-right bigger-110"></i>
												</button>
											</span>
										</div>
									</div>
								</div>
								<table id="grid-table"></table>
								<div id="grid-pager"></div>
							</div>
							<div id="download" style="display: none;">
								<div>
									<iframe name="download"
										style="width: 600px; height: 200px; float: left; border: 0;">
									</iframe>
								</div>
								<div style="float: left" >
								<button type="button" class="btn-danger" onclick="closeDownload();"> 
									<i class="ace-icon fa fa-times red3"></i>
								</button>
								</div>
							</div>
							<!-- PAGE CONTENT ENDS -->
						</div>
						<!-- /.col -->
					</div>
					<!-- 分隔线		 -->
					<!-- /.row -->
					<!-- PAGE CONTENT ENDS -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.page-content-area -->
	</div>
	<!-- /.page-content -->
</div>
<!-- /.main-content -->
<!-- 右边主页面结束 -->
<!-- /.page-content-area -->


<script src="<%=request.getContextPath()%>/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/date-time/daterangepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/jqGrid/jquery.jqGrid.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/jqGrid/i18n/grid.locale-cn.js"></script>
<script src="<%=request.getContextPath()%>/assets/layer/layer.min.js"></script>
<script type="text/javascript">
	
	//点击下载按钮展现下载表格
	function showDownload(id){
    	obj = document.getElementById('download');
    	obj.style.display = "";
	}
	function closeDownload(id){
    	obj = document.getElementById('download');
    	obj.style.display = "none";
	}
	
	
	//时间查询用的js函数
	$('.input-daterange').datepicker({format:'yyyy-mm-dd',autoclose:true});
	
	//往后台传输查询数据
	var multipleSearch = function() {  
		var rules="";
		var requirement_num = document.getElementById("requirement_num").value;
		var manager = document.getElementById("manager").value;
		var title = document.getElementById("title").value;
		var status = document.getElementById("status").value;
		var module = document.getElementById("module").value;
		var leftDate = document.getElementById("leftDate").value;
		var rightDate = document.getElementById("rightDate").value;
		
		rules += "{" + requirement_num+ "," +manager+ "," +title+ "," +status+ "," +module+ "," +leftDate+ "," +rightDate+ "}"
		
		var postData = $("#grid-table").jqGrid("getGridParam", "postData");
		$.extend(postData, {filters: rules});
		
		$("#grid-table").jqGrid("setGridParam", {
			search: true	//(9)将jqGrid的search选项设为true
		}).trigger("reloadGrid", [{page:1}]);	//(10)重新载入Grid表格
	};
	
	/* 动态表格开始*/
			jQuery(function($) {
				var grid_selector = "#grid-table";
				var pager_selector = "#grid-pager";
				
				//resize to fit page size
				$(window).on('resize.jqGrid', function () {
					$(grid_selector).jqGrid( 'setGridWidth', $(".page-content").width() );
			    });
				//resize on sidebar collapse/expand
				var parent_column = $(grid_selector).closest('[class*="col-"]');
				$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
					if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
						//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
						setTimeout(function() {
							$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
						}, 0);
					}
			    });
				
				jQuery(grid_selector).jqGrid({
					/** 主表的设置*/
					//editurl: "/dummy.html",//定义对form编辑时的url
					//userData: 从request中取得的一些用户信息
					caption: "首页表格",//表格标题
					datatype: "json",//获取数据格式
					url: "<%=request.getContextPath()%>/homepage/search",
					//获取数据的请求
					//cellurl : 单元格修改提交的url 
					mtype: "POST", 
					height:430,//表格高度
					autowidth: true,//自动调节宽度
					viewrecords : true,//显示总共查出来有多少记录
					rowNum:10,//默认显示多少条记录
					rowList:[10,20,30,40],//修改显示一页显示多少条记录
					pager : pager_selector,//对应下面的包含按钮的div的名称
					emptyrecords : "未查到任何记录",//
					sortable:true,
					sortname:'id',
					sortorder:'asc',
					altRows: false,//是否允许直接在表格中修改
					//toppager: true,
					//multiselect: true,
					//multikey: "ctrlKey",
			        multiboxonly: true,
			        jsonReader : {
				          root: "data",
				          page: "page",
				          total: "total",
				          records: "records",
				          repeatitems: false,
				          cell: "cell",
				          id: "id"
				     },
				     prmNames : {
				    	 search:"search"
				     },
					colNames:['','ID','需求工单号', '版本', '标题','紧急','涉及核心','发起人', '负责人','上线时间', '状态', '创建人','创建时间', '最后修改人','最后修改时间','描述','备注'],
					colModel:[
                        {name:'button',index:'button' ,width:25,formatter:'actions',
                        	formatoptions:{ 
                        		keys: true,
                        		editbutton:true,
                        		editformbutton: false,
                        		url:"/Emagdm/requirement/finRequirement",
                        		delbutton:true,
                        		delOptions: {deltitle:"",url:"/Emagdm/requirement/deleteRequirement"}}},
					    {name:'id',index:'id', sortable:false,hidden:true},
					    {name:'requirement_num',index:'requirement_num', width:45, sortable:true,sorttype:"int"},
						{name:'version',index:'version', width:27,sortable:false,hidden:true},
						{name:'title',index:'title', width:150, sortable:false, formatter:modifiRequirement},
						{name:'catchUrgency',index:'catchUrgency', sortable:false, width:20},
						{name:'catchRelateHW',index:'catchRelateHW', sortable:false, width:25 },
						{name:'initiator',index:'initiator', sortable:false, width:30 },
						{name:'manager',index:'manager', sortable:false, width:30},
						{name:'onlineDate',index:'onlineDate',width:30,sortable:false},
						{name:'status',index:'status', sortable:false, width:30,edittype:"checkbox",editoptions:{value:"已完成:未完成"},editable:true,unformat: aceSwitch},
						{name:'create_user',index:'create_user', sortable:false, width:40,hidden:true},
						{name:'createTime',index:'createTime',width:51, sortable:false},
						{name:'update_user',index:'update_user', width:40,sortable:false,hidden:true},
						{name:'updateTime',index:'updateTime',width:51,sortable:false,hidden:true },
						{name:'description',index:'description',hidden:true,sortable:false },
						{name:'note',index:'note',hidden:true,sortable:false,editable:true },
						//{name:'downloadRe',index:'downloadRe',width:50,sortable:false,formatter: downloadRe },
					], 
					
				     /** 子表设置*/
						subGrid : true,
						subGridOptions : {
							plusicon : "ace-icon fa fa-plus center bigger-110 blue",
							minusicon  : "ace-icon fa fa-minus center bigger-110 blue",
							openicon : "ace-icon fa fa-chevron-right center orange"
						},
						subGridRowExpanded: function (subgridDivId, rowId) {
							var rowDate = jQuery(grid_selector).jqGrid('getRowData',rowId);
							var requirement_num = rowDate.requirement_num;//取到点击行的requirement_num
							var subgridTableId = subgridDivId + "_t";
							var subgridSelectId = subgridDivId + "_tt";
							$("#" + subgridDivId).html("<table id='" + subgridTableId + "'></table>");
							$("#" + subgridTableId).jqGrid({
								jsonReader : {
							          root: "data"
							     },
								mtype: "GET", 
								datatype: 'json',
								//emptyrecords : "未查到任何记录",//
								url: "<%=request.getContextPath()%>/schedule/getScheduleListByReID?id="+rowId,
								colNames: ['','上线工单号','对应模块名称','状态','版本','上线日期','创建者','创建时间','最后更新人','最后更新时间'],
								colModel: [
									{name:'myac',index:'', width:56, fixed:true, sortable:false, resize:false,
										formatter:'actions', 
										formatoptions:{ 
										keys:true,
										editbutton : false,
										url:"/Emagdm/schedule/finSchedule",
										delbutton: true,
										delOptions:{recreateForm: true, beforeShowForm:beforeDeleteCallback,url:"/Emagdm/schedule/deleteSchedule"}
										}
									},
									{ name: 'schedule_num', width: 130,formatter:modifiSchedule },
									{ name: 'moduleName', width: 100 },
									{ name: 'status', width: 80,edittype:"checkbox",editoptions:{value:"已完成:未完成"},editable:true,unformat: aceSwitch },
									{ name: 'version', width: 50 },
									{ name: 'onlineDate', width: 100 },
									{ name: 'create_user', width: 100 },
									{ name: 'createTime', width: 150 },
									{ name: 'update_user', width: 100 },
									{ name: 'updateTime', width: 150 }
								]
							});
						},
					loadComplete : function() {
						var table = this;
						setTimeout(function(){
							styleCheckbox(table);
							updateActionIcons(table);
							updatePagerIcons(table);
							enableTooltips(table);
						}, 0);
					},
					
					col : {
					        caption: "Show/Hide Columns",
					        bSubmit: "Submit",
					        bCancel: "Cancel"
					}
					/**
					,
					grouping:true, 
					groupingView : { 
						 groupField : ['name'],
						 groupDataSorted : true,
						 plusicon : 'fa fa-chevron-down bigger-110',
						 minusicon : 'fa fa-chevron-up bigger-110'
					},
					caption: "Grouping"
					*/
				});
				$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
				
				//点击title可链接到修改需求页面
				function modifiRequirement(cellvalue, options, rowObject){
					var href = "home#ajax/requirement/modifi";
					var c = href + "?" + "requirement_num=" + rowObject["requirement_num"] + "&id=" + rowObject["id"];
					return "<a " + ' data-url="ajax/requirement/modifi" ' + ' href="' + c + '">' + cellvalue + "</a>"
				}
				//点击链接到修改上线工单页面
				function modifiSchedule(cellvalue){
					var href = "home#ajax/schedule/modifi";
					var c = href + "?" + "schedule_num=" + cellvalue;
					return "<a " + ' href="' + c + '">' + cellvalue + "</a>"
				}
				
				//enable search/filter toolbar
				//jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})
				//jQuery(grid_selector).filterToolbar({});
			
				//switch element when editing inline
				function aceSwitch( cellvalue, options, cell ) {
					setTimeout(function(){
						$(cell) .find('input[type=checkbox]')
							.addClass('ace ace-switch ace-switch-5')
							.after('<span class="lbl"></span>');
					}, 0);
				}
				//enable datepicker
				function pickDate( cellvalue, options, cell ) {
					setTimeout(function(){
						$(cell) .find('input[type=text]')
								.datepicker({format:'yyyy-mm-dd' , autoclose:true}); 
					}, 0);
				}
				
				//navButtons
				jQuery(grid_selector).jqGrid('navGrid',pager_selector,
					{ 	//navbar options
						edit: true,//被做成了添加上线按钮
						editicon : 'ace-icon fa fa-plus-circle red',
						edittitle:"",
						edittext:"<span style='color:#e2755f'>上线&nbsp;&nbsp;</span>",
						editfunc:forAddSchedule,
						add: false,//禁用，
						addicon : 'ace-icon fa fa-plus-circle purple',
						del: true,//被做成下载文档按钮
						delfunc:download,
						deltitle:"下载对应文档",
						deltext:"<span style='color:#7e6eb0'>下载&nbsp;&nbsp;</span>",
						delicon : 'ace-icon fa fa-cloud-download blue',
						search: false,//禁用
						searchicon : 'ace-icon fa fa-search orange',
						refresh: false,//禁用
						refreshicon : 'ace-icon fa fa-refresh green',
						view: true,//唯一保留原功能的按钮，但是修改了样式
						viewtext:"<span style='color:#69aa46'>详情&nbsp;&nbsp;</span>",
						viewicon : 'ace-icon fa fa-search grey'
					},
					{
						//edit record form
						//closeAfterEdit: true,
						//width: 700,
						recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						}
					},
					{
						//new record form
						//width: 700,
						closeAfterAdd : true,
						recreateForm : true,
						viewPagerButtons : false,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						}
					},
					{
						//delete record form
						recreateForm: true,
						url:"/Emagdm/requirement/deleteRequirement",
						beforeShowForm : function(e) {
							var form = $(e[0]);
							if(form.data('styled')) return false;
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_delete_form(form);
							form.data('styled', true);
						},
						onClick : function(e) {
							alert(1);
						}
					},
					{
						//search form
						caption:"查找",
						recreateForm: true,
						afterShowSearch: function(e){
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
							style_search_form(form);
						},
						afterRedraw: function(){
							style_search_filters($(this));
						}
						,
						multipleSearch: true
						/**
						multipleGroup:true,
						showQuery: true
						*/
					},
					{
						//view record form
						recreateForm: true,
						beforeShowForm: function(e){
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />');
						}
					}
				)
				//点击按钮添加上线计划
				function forAddSchedule(id) {
					//传id请求controller查询
					window.location.href="home#ajax/schedule/insert?id="+id; 
				}
				//点击按钮下载文档
				function download(id) {
					//传id请求controller查询
					window.download.location.href="/Emagdm/homepage/downloadPage?id="+id;
					showDownload();
				}
				
				function style_edit_form(form) {
					//enable datepicker on "sdate" field and switches for "stock" field
					form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
						.end().find('input[name=stock]')
							.addClass('ace ace-switch ace-switch-5').after('<span class="lbl"></span>');
							   //don't wrap inside a label element, the checkbox value won't be submitted (POST'ed)
							  //.addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');
			
					//update buttons classes
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
					buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')
					
					buttons = form.next().find('.navButton a');
					buttons.find('.ui-icon').hide();
					buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
					buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');		
				}
			
				function style_delete_form(form) {
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-sm btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-danger').prepend('<i class="ace-icon fa fa-trash-o"></i>');
					buttons.eq(1).addClass('btn-default').prepend('<i class="ace-icon fa fa-times"></i>')
				}
				
				function style_search_filters(form) {
					form.find('.delete-rule').val('X');
					form.find('.add-rule').addClass('btn btn-xs btn-primary');
					form.find('.add-group').addClass('btn btn-xs btn-success');
					form.find('.delete-group').addClass('btn btn-xs btn-danger');
				}
				function style_search_form(form) {
					var dialog = form.closest('.ui-jqdialog');
					var buttons = dialog.find('.EditTable')
					buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
					buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
					buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
				}
				
				function beforeDeleteCallback(e) {
					var form = $(e[0]);
					if(form.data('styled')) return false;
					
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_delete_form(form);
					
					form.data('styled', true);
				}
				
				function beforeEditCallback(e) {
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_edit_form(form);
				}

				//it causes some flicker when reloading or navigating grid
				//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
				//or go back to default browser checkbox styles for the grid
				function styleCheckbox(table) {
				/**
					$(table).find('input:checkbox').addClass('ace')
					.wrap('<label />')
					.after('<span class="lbl align-top" />')

					$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
					.find('input.cbox[type=checkbox]').addClass('ace')
					.wrap('<label />').after('<span class="lbl align-top" />');
				*/
				}

				//unlike navButtons icons, action icons in rows seem to be hard-coded
				//you can change them like this in here if you want
				function updateActionIcons(table) {
					/**
					var replacement = 
					{
						'ui-ace-icon fa fa-pencil' : 'ace-icon fa fa-pencil blue',
						'ui-ace-icon fa fa-trash-o' : 'ace-icon fa fa-trash-o red',
						'ui-icon-disk' : 'ace-icon fa fa-check green',
						'ui-icon-cancel' : 'ace-icon fa fa-times red'
					};
					$(table).find('.ui-pg-div span.ui-icon').each(function(){
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
						if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
					})
					*/
				}
				
				//replace icons with FontAwesome icons like above
				function updatePagerIcons(table) {
					var replacement = 
					{
						'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
						'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
						'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
						'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
					};
					$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
						
						if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
					})
				}
			
				function enableTooltips(table) {
					$('.navtable .ui-pg-button').tooltip({container:'body'});
					$(table).find('.ui-pg-div').tooltip({container:'body'});
				}
			
				//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');
			
				$(document).on('ajaxloadstart', function(e) {
					$(grid_selector).jqGrid('GridUnload');
					$('.ui-jqdialog').remove();
				});
			});
	/* 动态表格结束*/
</script>
