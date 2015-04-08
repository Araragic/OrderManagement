<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="cn.emagsoftware.dm.bean.Schedule" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<title>修改上线计划</title>
   
<!-- 修改需求的css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/jquery-ui.custom.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/chosen.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/datepicker.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/bootstrap-timepicker.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/daterangepicker.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/colorpicker.css" />

<!-- ajax layout which only needs content area -->

<div class="page-header">
	<h1>
		修改上线计划
		<small>
			<i class="ace-icon fa fa-angle-double-right"></i>
			&nbsp;&nbsp;请仔细核对每一项
		</small>
	</h1>
</div><!-- /.page-header -->
<div class="row" >
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form:form class="form-horizontal" modelAttribute="modifiSchedule" role="form" id="" action="/Emagdm/schedule/modifiSchedule">
		
			<!-- #section:elements.form -->
			<input id="id" name="id" type="hidden" value="${schedule.id }">
			<input id="moduleID" type="hidden" value="${moduleId }">
			
			<div class="form-group">
				<div class="col-sm-9">
					<input type="hidden" id="requirement_id" name="requirement_id" placeholder="录上线工单编号" class="col-xs-10 col-sm-5" value="${schedule.requirement_id }"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 上线工单编号：<font color='red'>*</font></label>
				<div class="col-sm-9">
					<input type="text" id="schedule_num" name="schedule_num" 
						onblur="checkScheduleNum();" onfocus="clearCss3();"
						placeholder="录上线工单编号" class="col-xs-10 col-sm-5" value="${schedule.schedule_num }"/>
					<span id="showResult3" class="col-sm-2 control-label no-padding-left"></span>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 版本： <font color='red'>*</font> </label>
				<div class="col-sm-9">
					<input type="text" id="version" name="version" 
						onblur="checkVersion();" onfocus="clearCss2();" 
						placeholder="版本" class="col-xs-10 col-sm-5" value="${schedule.version }"/>
					<span id="showResult2" class="col-sm-2 control-label no-padding-left"></span>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 上线日期：<font color='red'>*</font></label>
				<div class="col-xs-10 col-sm-4">
					<div class="input-group">
						<input class="form-control date-picker" id="onlineDate"
							 onfocus="clearCss6();"
							 name="onlineDate" type="text" data-date-format="yyyy-mm-dd" value="${schedule.onlineDate }"/>
							<span class="input-group-addon">
								<i class="fa fa-calendar bigger-110"></i>
							</span>
							<span id="showResult6" class="col-sm-10 control-label no-padding-left">
							</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 上线模块： </label>
					<div class="col-xs-10 col-sm-4" style="float:left">
					<%Integer module_id = (Integer)(((Schedule)request.getAttribute("schedule")).getModule_id()); %>
						<select class="form-control" id="module_id" name="module_id" 
							onblur="checkModuleId();" onfocus="clearCss4();"
							data-placeholder="上线模块..">
							<option>请选择模块</option>
							<option value="1" <%if(module_id==1){%>selected<%} %>>游戏大厅</option>
							<option value="2" <%if(module_id==2){%>selected<%} %>>wap门户</option>
							<option value="3" <%if(module_id==3){%>selected<%} %>>渠道</option>
							<option value="4" <%if(module_id==4){%>selected<%} %>>实时接口</option>
							<option value="5" <%if(module_id==5){%>selected<%} %>>营销系统</option>
						</select>
					</div>
					<div>
							<span id="showResult4"  class="col-sm-1 control-label no-padding-left"></span>
					</div>
			</div>
		
		    <%String status = (String)((Schedule)request.getAttribute("schedule")).getStatus(); %>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 上线计划状态： </label>
					<div class="col-xs-10 col-sm-4">
						<select class="form-control" id="status" name="status" data-placeholder="上线负责人..">
							<option value="未完成" <%if(status.equals("未完成")){%>selected<%} %>>未完成</option>
							<option value="已完成" <%if(status.equals("已完成")){%>selected<%} %>>已完成</option>
						</select>
					</div>
			</div>
			
			<div class="clearfix form-actions" id="buttons">
				<div class="col-md-offset-4 col-md-9" >
					<button class="btn btn-info" type="button" id="submit"  onclick="checkAll();" >
						<i class="ace-icon fa fa-check bigger-110"></i>
						提交
					</button>
					&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
					<button class="btn" type="reset" onclick="clearAllCss();">
						<i class="ace-icon fa fa-undo bigger-110"></i>
						重置
					</button>
					&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
					<a href="javascript:deleteSc(${schedule.id})"><button class="btn btn-danger" type="button">
						<i class="ace-icon fa fa-trash-o bigger-110"></i>
						删除
					</button></a>
				</div>
			</div>
		</form:form>
	</div><!-- /.col -->
</div><!-- /.row -->

<!-- page specific plugin scripts -->
<script type="text/javascript">
$(document).ready(function(){
	var moduleID1 = document.getElementById("moduleID").value;
	var moduleID2 = document.getElementById("module_id").value;
	if(moduleID1 !=moduleID2){
		  $("#schedule_num").attr("disabled", "true");
		  $("#version").attr("disabled", "true");
		  $("#onlineDate").attr("disabled", "true");
		  $("#status").attr("disabled", "true");
		  $("#buttons").attr("style", "display:none");
	}
})

function checkAll(){
	var onlineDate =$.trim($("#onlineDate").val());
	if(onlineDate ==""){
		$("#submit").attr("type","button");
		$("#showResult6").html("<font color='red'>不能为空</font>");
	}else{
		$("#submit").attr("type","submit");
		$("#submit").attr("disabled",false);
	}
}


function clearAllCss(){
$("#showResult2,#showResult3,#showResult4,#showResult6").html("");
}

function clearCss2() {
	$("#showResult2").html("");
}
function clearCss3() {
	$("#showResult3").html("");
}
function clearCss4() {
	$("#showResult4").html("");
	$("#module_id").attr("disabled",true);
}
function clearCss6() {
	$("#showResult6").html("");
}

function checkVersion(){
	var version =$.trim($("#version").val());
	var reg=/^(\d)+(\.[0-9]+)*$/;
	if(version ==""){
		$("#showResult2").html("<font color='red'>不能为空</font>");
		$("#submit").attr("disabled",true);
	}else{
		 if(!version.match(reg)){
			 $("#submit").attr("disabled",true);
			$("#showResult2").html("<font color='red'>格式不正确</font>");
		}else{
			$("#submit").attr("disabled",false);
		}
	}
}

function checkScheduleNum(){
	var schedule_num =$.trim($("#schedule_num").val());
	var id =$.trim($("#id").val());
	var reg=/^(\d)*$/;
	if(schedule_num ==""){
		$("#showResult3").html("<font color='red'>不能为空</font>");
		$("#submit").attr("disabled",true);
	}else{
		 if( !schedule_num.match(reg)){
			$("#submit").attr("disabled",true);
			$("#showResult3").html("<font color='red'>格式不正确</font>");
		}else{
            $.ajax({  
                type:"POST",  
                url:"<%=request.getContextPath()%>/schedule/checkScheduleNumAndId", 
					data : {"schedule_num": schedule_num,"id":id}, 
					dataType : "json", 
					complete : function(data) {
						var result = eval("(" + data.responseText + ")");
						if (result) {
							$("#showResult").html("");
							$("#submit").attr("disabled",false);
						} else {
							$("#showResult3").html("<font color='red'>上线工单号存在</font>");
							$("#submit").attr("disabled",true);
						}
					}
			});
		}
	}
}


function checkModuleId(){
	 var  module_id =document.getElementById("module_id").value;
	 if(module_id =="请选择模块"){
	 	$("#showResult4").html("<font color='red'>不能为空</font>");
		$("#submit").attr("disabled",true);
		$("#module_id").attr("disabled",true);
	 }else{
	 	$("#showResult4").html("");
	 	$("#submit").attr("disabled",false);
	 	$("#module_id").attr("disabled",false);
	 }
}

function deleteSc(id){
	if(window.confirm('你确定要删除该上线吗？')){
		window.location.href = "home#ajax/schedule/deleteSchedule?id=" + id
	}
}



var scripts = [null,
               "<%=request.getContextPath()%>/assets/js/jquery-ui.custom.min.js",
               "<%=request.getContextPath()%>/assets/js/jquery.ui.touch-punch.min.js",
               "<%=request.getContextPath()%>/assets/js/chosen.jquery.min.js",
               "<%=request.getContextPath()%>/assets/js/date-time/bootstrap-datepicker.min.js",
               "<%=request.getContextPath()%>/assets/js/date-time/moment.min.js",
               "<%=request.getContextPath()%>/assets/js/date-time/daterangepicker.min.js",
               "<%=request.getContextPath()%>/assets/js/date-time/bootstrap-datetimepicker.min.js",
               "<%=request.getContextPath()%>/assets/js/jquery.knob.min.js",
               "<%=request.getContextPath()%>/assets/js/jquery.autosize.min.js",
               "<%=request.getContextPath()%>/assets/js/jquery.inputlimiter.1.3.1.min.js",
               "<%=request.getContextPath()%>/assets/js/jquery.maskedinput.min.js",
               "<%=request.getContextPath()%>/assets/js/bootstrap-tag.min.js",
               "<%=request.getContextPath()%>/assets/js/typeahead.jquery.min.js",
               "<%=request.getContextPath()%>/assets/js/dropzone.min.js",
               null];
	
ace.load_ajax_scripts(scripts, function() {
	  //inline scripts related to this page
	jQuery(function($) {
		$('#id-disable-check').on('click', function() {
			var inp = $('#form-input-readonly').get(0);
			if(inp.hasAttribute('disabled')) {
				inp.setAttribute('readonly' , 'true');
				inp.removeAttribute('disabled');
				inp.value="This text field is readonly!";
			}
			else {
				inp.setAttribute('disabled' , 'disabled');
				inp.removeAttribute('readonly');
				inp.value="This text field is disabled!";
			}
		});
	
		$('.chosen-select').chosen({allow_single_deselect:true}); 
		//resize the chosen on window resize
	
		$(window)
		.off('resize.chosen')
		.on('resize.chosen', function() {
			$('.chosen-select').each(function() {
				 var $this = $(this);
				 $this.next().css({'width': $this.parent().width()});
			})
		}).trigger('resize.chosen');
	
	
		$('#chosen-multiple-style').on('click', function(e){
			var target = $(e.target).find('input[type=radio]');
			var which = parseInt(target.val());
			if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
			 else $('#form-field-select-4').removeClass('tag-input-style');
		});
	
		$('[data-rel=tooltip]').tooltip({container:'body'});
		$('[data-rel=popover]').popover({container:'body'});
		
		$('textarea[class*=autosize]').autosize({append: "\n"});
		$('textarea.limited').inputlimiter({
			remText: '%n character%s remaining...',
			limitText: 'max allowed : %n.'
		});
	
		//datepicker plugin
		//link
		$('.date-picker').datepicker({
			autoclose: true,
			todayHighlight: true
		})
		//show datepicker when clicking on the icon
		.next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
	});
});
</script>
