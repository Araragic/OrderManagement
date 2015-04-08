<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="cn.emagsoftware.dm.bean.Requirement"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<title>修改需求</title>

<!-- 添加需求的css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/jquery-ui.custom.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/chosen.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/datepicker.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/bootstrap-timepicker.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/daterangepicker.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/bootstrap-datetimepicker.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/colorpicker.css" />

<!-- 上线计划表格开始 -->
<div class="page-header">
	<h1>
		对应上线计划 <a href="home#ajax/schedule/insert?id=${requirement.id}"><small>
				<i class="ace-icon fa fa-angle-double-right"></i>
				&nbsp;&nbsp;点击&nbsp;<i class="ace-icon fa fa-plus-circle green"></i>&nbsp;可添加上线
		</small></a>
	</h1>
</div>
<div class="row">
	<div class="col-xs-12">
		<div class="table-header center">
		<i class="ace-icon fa fa-table"></i>
		&nbsp;&nbsp;上线工单数据
		</div>
		<div style="height:300px; overflow:scroll;">
			<table id="sample-table-2"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					<th class="center">上线工单号</th>
					<th class="center">对应模块名称</th>
					<th class="center">状态</th>
					<th class="center">版本</th>
					<th class="center">上线日期</th>
					<th class="center">创建者</th>
					<th class="center">创建时间</th>
					<th class="center">最后更新人</th>
					<th class="center">最后更新时间</th>
					<th class="center">操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="list" items="${list}">
					<tr id="${list.id}">
						<td class="center">${list.schedule_num}</td>
						<td class="center">${list.moduleName }</td>
						<td class="center">${list.status}</td>
						<td class="center">${list.version}</td>
						<td class="center">${list.onlineDate}</td>
						<td class="center">${list.create_user}</td>
						<td class="center">${list.createTime}</td>
						<td class="center">${list.update_user}</td>
						<td class="center">${list.updateTime}</td>
						<td class="center">
							<div class="hidden-sm hidden-xs action-buttons">
								<a class="green" href="home#ajax/schedule/modifi?schedule_num=${list.schedule_num}"> 
									<i class="ace-icon fa fa-pencil bigger-130"></i>
								</a> 
								<a class="red" href="javascript:deleteSchedule(${list.id})">
									<i class="ace-icon fa fa-trash-o bigger-130"></i>
								</a>
							</div>
							<div class="hidden-md hidden-lg">
								<div class="inline position-relative">
									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
										<li><a href="#" class="tooltip-success"
											data-rel="tooltip" title="Edit"> <span class="green">
													<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
											</span>
										</a></li>
										<li><a href="#" class="tooltip-error" data-rel="tooltip"
											title="Delete"> <span class="red"> <i
													class="ace-icon fa fa-trash-o bigger-120"></i>
											</span>
										</a></li>
									</ul>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<!-- 上线计划表格结束 -->

<div class="hr hr32 hr-dotted "></div>
<div class="widget-box widget-color-red">
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
					<tr id="-${s.index }" >
						<td >${s.current } </td>
						<td class="hidden-480 center">
							<a href="/Emagdm/homepage/downloadFile?fileName=${s.current }" >点击下载&nbsp;</a>
							<a href="javascript:deleteFile('${s.current }','-${s.index }');">点击删除</a>
						</td>
					</tr>
				</tbody>
			</c:forEach>
			</table>
		</div>
	</div>
</div>
<div class="hr hr32 hr-dotted"></div>	

<!-- 修改需求工单部分开始 -->
<div class="page-header">
	<h1>
		修改需求工单 <small> <i class="ace-icon fa fa-angle-double-right"></i>
			&nbsp;&nbsp;请仔细核对每一项
		</small>
	</h1>
</div>
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form:form class="form-horizontal" role="form" id=""
			modelAttribute="modifiRequirement"
			action="/Emagdm/requirement/modifiRequirement"
			enctype="multipart/form-data">

			<input id="id" name="id" type="hidden" value="${requirement.id}">
			<!-- #section:elements.form -->
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-1"> 需求工单编号：<font color='red'>*</font></label>

				<div class="col-sm-9">
					<input type="text" id="requirement_num" name="requirement_num"
						onfocus="clearCss();" onblur="checkRequirmentNumAndId();"
						value="${requirement.requirement_num}" placeholder="录入需求工单编号"
						class="col-xs-10 col-sm-5" /> <span id="showResult"
						class="col-sm-2 control-label no-padding-left"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-1"> 需求标题：<font color='red'>*</font> </label>

				<div class="col-sm-9">
					<input type="text" id="title" name="title"
						value="${requirement.title}" onblur="checkTitle();"
						onfocus="clearCss2();" placeholder="录入需求标题"
						class="col-xs-10 col-sm-5" /> <span id="showResult2"
						class="col-sm-2 control-label no-padding-left"> </span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-1"> 版本：<font color='red'>*</font> </label>
				<div class="col-sm-9">
					<input type="text" id="version" name="version"
						onblur="checkVersion();" onfocus="clearCss3();" placeholder="版本"
						class="col-xs-10 col-sm-5" value="${requirement.version} " /> <span
						id="showResult3" class="col-sm-2 control-label no-padding-left"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-1"> 需求预定完成日期：<font color='red'>*</font> </label>
				<div class="col-xs-10 col-sm-4">
					<div class="input-group">
						<input class="form-control date-picker" id="onlineDate"
							name="onlineDate" 
							onfocus="clearCss6();" type="text" data-date-format="yyyy-mm-dd"
							value="${requirement.onlineDate}" /> <span
							class="input-group-addon"> <i
							class="fa fa-calendar bigger-110"></i>
						</span> <span id="showResult6"
							class="col-sm-10 control-label no-padding-right"> </span>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-1"> 发起人：<font color='red'>*</font> </label>

				<div class="col-sm-9">
					<input type="text" id="initiator" name="initiator"
						onblur="checkInitiator();" onfocus="clearCss4();"
						placeholder="发起人" class="col-xs-10 col-sm-5"
						value="${requirement.initiator} " /> <span id="showResult4"
						class="col-sm-2 control-label no-padding-left"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-1"> 负责人： <font color='red'>*</font></label>
				<div class="col-sm-9">
					<input type="text" id="manager" name="manager"
						onblur="checkManager();" onfocus="clearCss5();" placeholder="负责人"
						class="col-xs-10 col-sm-5" value="${requirement.manager} " /> <span
						id="showResult5" class="col-sm-2 control-label no-padding-left"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-1"> 需求状态： </label>
				<div class="col-xs-10 col-sm-4">
					<select class="form-control" id="status" name="status" data-placeholder="需求状态..">
						<%
						String status = ((Requirement) request.getAttribute("requirement")).getStatus();
						%>
						<option value="未完成" <%if (status.equals("未完成")) {%> selected <%}%>>未完成</option>
						<option value="已完成" <%if (status.equals("已完成")) {%> selected <%}%>>已完成</option>
					</select>
				</div>
			</div>
			<%
			int urgency = ((Requirement) request.getAttribute("requirement")).getUrgency();
			%>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-1"> 是否紧急需求： </label>
				<div class="col-xs-10 col-sm-5">
					<div class="radio">
						<label> <input id="urgency" name="urgency" type="radio"
							class="ace" value="1" <%if (urgency == 1) {%> checked="checked"
							<%}%> /> <span class="lbl"> 是紧急需求 o(︶︿︶)o</span>
						</label> <label> <input id="urgency" name="urgency" type="radio"
							class="ace" value="0" <%if (urgency == 0) {%> checked="checked"
							<%}%> /> <span class="lbl"> 不是紧急需求ヽ(✿ﾟ▽ﾟ)ノ</span>
						</label>
					</div>
				</div>
			</div>
			<%
			int relate_hw = ((Requirement) request.getAttribute("requirement")).getRelate_hw();
			%>
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-1"> 是否涉及核心平台： </label>
				<div class="col-xs-10 col-sm-5">
					<div class="radio">
						<label> <input id="relate_hw" name="relate_hw"
							type="radio" class="ace" value="1" <%if (relate_hw == 1) {%>
							checked="checked" <%}%> /> <span class="lbl">
								涉及核心平台o(︶︿︶)o</span>
						</label> <label> <input id="relate_hw" name="relate_hw"
							type="radio" class="ace" value="0" <%if (relate_hw == 0) {%>
							checked="checked" <%}%> /> <span class="lbl">
								不涉及核心平台ヽ(✿ﾟ▽ﾟ)ノ</span>
						</label>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right"
					for="form-field-1"> 需求描述： </label>
				<div class="col-xs-10 col-sm-5">
					<input id="description" name="description"
						class="autosize-transition form-control"
						value="${requirement.description}" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="note">添加备注：</label>
				<div class="col-sm-9">
					<div class="inline">
						<input type="text" name="note" id="note"
							value="${requirement.note }" placeholder="添加备注" />
					</div>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="note">上传文件：</label>
				<div class="col-xs-10 col-sm-5">
					<input multiple="multiple" type="file" id="uploadFile"
						name="uploadFile" />
				</div>
			</div>

			<div class="clearfix form-actions">
				<div class="col-md-offset-4 col-md-9">
					<button class="btn btn-info"  type="submit" id="submit"  onclick="checkAll();">
						<i class="ace-icon fa fa-check bigger-110"></i> 提交
					</button>
					&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
					<button class="btn" type="reset" onclick="clearAllCss();">
						<i class="ace-icon fa fa-undo bigger-110"></i> 重置
					</button>
					&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
					<a href="javascript:deleteRe(${requirement.id})"><button class="btn btn-danger" type="button">
						<i class="ace-icon fa fa-trash-o bigger-110"></i>删除
					</button></a>
				</div>
			</div>
		</form:form>
	</div>
</div>
<!-- 修改需求工单部分结束 -->

<script type="text/javascript">
function checkAll(){
	var onlineDate =$.trim($("#onlineDate").val());
	var requirement_num = $.trim($("#requirement_num").val());
	var version =$.trim($("#version").val());
	var title =$.trim($("#title").val());
	var initiator =$.trim($("#initiator").val());
	var manager =$.trim($("#manager").val());
	
	
	
	if(onlineDate!="" && requirement_num!="" && version !="" && title !="" && initiator !="" &&  manager !=""){
		$("#submit").attr("type","submit");
	}else{
		$("#submit").attr("type","button");
		alert("必填项不能为空!");
		if(onlineDate ==""){
			$("#showResult6").html("<font color='red'>不能为空</font>");
		}
		if(requirement_num ==""){
			$("#showResult").html("<font color='red'>不能为空</font>");
		}
		if(version ==""){
			$("#showResult3").html("<font color='red'>不能为空</font>");
		}
		
		if(title==""){
			$("#showResult2").html("<font color='red'>不能为空</font>");
		}
		
		if(initiator==""){
			$("#showResult4").html("<font color='red'>不能为空</font>");
		}
		
		if(manager==""){
			$("#showResult5").html("<font color='red'>不能为空</font>");
		}
	}
	
}


function clearAllCss() {
    $("#showResult,#showResult2,#showResult3,#showResult4,#showResult5,#showResult6").html("");
}

function clearCss() {
    $("#showResult").html("");
}

function clearCss2() {
    $("#showResult2").html("");
}

function clearCss3() {
    $("#showResult3").html("");
}

function clearCss4() {
    $("#showResult4").html("");
}

function clearCss5() {
    $("#showResult5").html("");
}

function clearCss6() {
    $("#showResult6").html("");
}

function checkTitle() {
    var title = $.trim($("#title").val());
    if (title == "") {
        $("#showResult2").html("<font color='red'>不能为空</font>");
        $("#submit").attr("disabled", true);
    } else {
        $("#submit").attr("disabled", false);
    }
}

function checkVersion() {
    var version = $.trim($("#version").val());
    var reg = /^(\d)+(\.[0-9]+)*$/;
    if (version == "") {
        $("#showResult3").html("<font color='red'>不能为空</font>");
        $("#submit").attr("disabled", true);
    } else {
        if (!version.match(reg)) {
            $("#submit").attr("disabled", true);
            $("#showResult3").html("<font color='red'>格式不正确</font>");
        } else {
            $("#submit").attr("disabled", false);
        }
    }
}

function checkInitiator() {
    var initiator = $.trim($("#initiator").val());
    if (initiator == "") {
        $("#showResult4").html("<font color='red'>不能为空</font>");
        $("#submit").attr("disabled", true);
    } else {
        $("#submit").attr("disabled", false);
    }
}

function checkManager() {
    var manager = $.trim($("#manager").val());
    if (manager == "") {
        $("#showResult5").html("<font color='red'>不能为空</font>");
        $("#submit").attr("disabled", true);
    } else {
        $("#submit").attr("disabled", false);
    }
}


function checkRequirmentNumAndId() {
    var requirement_num = $.trim($("#requirement_num").val());
    var id = $.trim($("#id").val());
    var reg = /^(\d)*$/;
    if (requirement_num == "") {
        $("#showResult").html("<font color='red'>不能为空</font>");
        $("#submit").attr("disabled", true);
    } else {
        if (!requirement_num.match(reg)) {
            $("#showResult").html("<font color='red'>格式不正确</font>");
            $("#submit").attr("disabled", true);
        } else {
            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/requirement/checkRequirementNumAndId",
                data: {
                    "requirement_num": requirement_num,
                    "id": id
                },
                dataType: "json",
                complete: function(data) {
                    var result = eval("(" + data.responseText + ")");
                    if (result) {
                        $("#showResult").html("");
                        $("#submit").attr("disabled", false);
                    } else {
                        $("#showResult").html("<font color='red'>工单号存在</font>");
                        $("#submit").attr("disabled", true);
                    }
                }
            });
        }

    }
}
function deleteRe(id){
	if(window.confirm('你确定要删除该需求吗？')){
		window.location.href = "/Emagdm/index/home#ajax/requirement/deleteRequirement?id=" + id
	}
}
function deleteSchedule(id) {
	if(window.confirm('你确定要删除数据吗？')){
		  $.ajax({
		        type: "GET",
		        url: "/Emagdm/schedule/deleteSchedule2",
		        data: "id=" + id,
		        dataType: "json",
		        complete: function(data) {
		            var result = eval("(" + data.responseText + ")");
		            if (result) {
		                $("#" + id).attr("style", "display:none");
		            } else {
		                alert("您不能删除其他模块的上线工单");
		            }
		        },
		    });
	}
}
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
		
		$('#uploadFile').ace_file_input({
			style:'well',
			btn_choose:'单击上传文件,可一次多选(总大小不能超过5M)',
			btn_change:null,
			no_icon:'ace-icon fa fa-cloud-upload',
			droppable:true,
			thumbnail:'small'//large | fit
			//,icon_remove:null//set null, to hide remove/reset button
			/**,before_change:function(files, dropped) {
				//Check an example below
				//or examples/file-upload.html
				return true;
			}*/
			/**,before_remove : function() {
				return true;
			}*/
			,
			maxSize:5000000,
			preview_error : function(file,filename, error_code) {
				//name of the file that failed
				//error_code values
				//1 = 'FILE_LOAD_FAILED',
				//2 = 'IMAGE_LOAD_FAILED',
				//3 = 'THUMBNAIL_FAILED'
				alert(file);
			}
	
		}).on('change', function(){
			//console.log($(this).data('ace_input_files'));
			//console.log($(this).data('ace_input_method'));
		});
		
		
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
	
		var tag_input = $('#note');
		try{
			tag_input.tag(
			  {
				placeholder:tag_input.attr('placeholder'),
				//enable typeahead by specifying the source array
				source: ace.vars['US_STATES'],//defined in ace.js >> ace.enable_search_ahead
				/**
				//or fetch data from database, fetch those that match "query"
				source: function(query, process) {
				  $.ajax({url: 'remote_source.php?q='+encodeURIComponent(query)})
				  .done(function(result_items){
					process(result_items);
				  });
				}
				*/
			  }
			)
			//programmatically add a new
			var $tag_obj = $('#note').data('tag');
			//$tag_obj.add('Programmatically Added');
		}
		catch(e) {
			//display a textarea for old IE, because it doesn't support this plugin or another one I tried!
			tag_input.after('<textarea id="'+tag_input.attr('id')+'" name="'+tag_input.attr('name')+'" rows="3">'+tag_input.val()+'</textarea>').remove();
			//$('#note').autosize({append: "\n"});
		}
		
	});
});
</script>
