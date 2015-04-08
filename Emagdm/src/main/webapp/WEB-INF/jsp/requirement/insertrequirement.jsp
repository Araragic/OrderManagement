 <%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<title>添加需求</title>

<!-- 添加需求的css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/jquery-ui.custom.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/datepicker.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/bootstrap-timepicker.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/daterangepicker.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/dropzone.css" />


<!-- ajax layout which only needs content area -->
<div class="page-header">
	<h1>
		添加需求工单
		<small>
			<i class="ace-icon fa fa-angle-double-right"></i>
			&nbsp;&nbsp;请仔细添加每一项
		</small>
	</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form:form class="form-horizontal" ModelAttibute="insertRequirement"  method="post" action="/Emagdm/requirement/insertRequirement" enctype="multipart/form-data">
		
			<!-- #section:elements.form -->
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 需求工单编号：<font color='red'>*</font></label>
				<div class="col-sm-9">
					<input type="text" id="requirement_num" name="requirement_num" 
						onfocus="clearCss();" onblur="checkRequirmentNum();"
						placeholder="录入需求工单编号" class="col-xs-10 col-sm-5" />
					<span id="showResult" class="col-sm-2 control-label no-padding-left"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 需求标题： <font color='red'>*</font></label>
				<div class="col-sm-9">
					<input type="text" id="title" name="title" 
						onblur="checkTitle();"  onfocus="clearCss2();"
						placeholder="录入需求标题" class="col-xs-10 col-sm-5" />
					<span id="showResult2"
						class="col-sm-2 control-label no-padding-left"></span>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 版本： <font color='red'>*</font></label>
				<div class="col-sm-9">
					<input type="text" id="version" name="version" 
						onblur="checkVersion();" onfocus="clearCss3();"
						placeholder="版本" class="col-xs-10 col-sm-5" />
					<span id="showResult3"
						class="col-sm-2 control-label no-padding-left"></span>
				</div>
			</div>
			
			
			<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 需求预定完成日期：<font color='red'>*</font> </label>
				<div class="col-xs-10 col-sm-4">
					<div class="input-group">
						<input class="form-control date-picker" id="onlineDate"  
							 onfocus="clearCss6();"
							name="onlineDate" type="text" data-date-format="yyyy-mm-dd" />
							<span class="input-group-addon">
								<i class="fa fa-calendar bigger-110"></i>
							</span>
							<span id="showResult6"
								class="col-sm-10 control-label no-padding-right">
							</span>
					</div>
				</div>
			</div>
			
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 发起人：<font color='red'>*</font> </label>
				<div class="col-sm-9">
					<input type="text" id="initiator" name="initiator" 
						onblur="checkInitiator();" onfocus="clearCss4();"
						placeholder="发起人" class="col-xs-10 col-sm-5" />
					<span id="showResult4"
						  class="col-sm-2 control-label no-padding-left"></span>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 负责人：<font color='red'>*</font> </label>
				<div class="col-sm-9">
					<input type="text" id="manager" name="manager"
						onblur="checkManager();" onfocus="clearCss5();"
						 placeholder="负责人" class="col-xs-10 col-sm-5" />
					 <span id="showResult5"
						class="col-sm-2 control-label no-padding-left"></span>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 需求状态： </label>
					<div class="col-xs-10 col-sm-5">
						<select class="form-control" id="status" name="status" data-placeholder="需求状态..">
							<option value="未完成" selected>未完成</option>
							<option value="已完成">已完成</option>
						</select>
					</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 是否紧急需求： </label>
					<div class="col-xs-10 col-sm-5">
						<div class="radio">
							<label>
								<input id="urgency" name="urgency" type="radio" class="ace" value="1"/>
								<span class="lbl"> 是紧急需求 o(︶︿︶)o</span>
							</label>
							<label>
								<input id="urgency" name="urgency" type="radio" class="ace" checked="checked" value="0"/>
								<span class="lbl"> 不是紧急需求ヽ(✿ﾟ▽ﾟ)ノ</span>
							</label>
						</div>
					</div>
			 </div>
			 
			 <div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 是否涉及核心平台： </label>
					<div class="col-xs-10 col-sm-5">
						<div class="radio">
							<label>
								<input id="relate_hw" name="relate_hw" type="radio" class="ace" value="1"/>
								<span class="lbl"> 涉及核心平台o(︶︿︶)o</span>
							</label>
							<label>
								<input id="relate_hw" name="relate_hw" type="radio" class="ace" checked="checked" value="0"/>
								<span class="lbl"> 不涉及核心平台ヽ(✿ﾟ▽ﾟ)ノ</span>
							</label>
						</div>
					</div>
			 </div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 需求描述： </label>
				<div class="col-xs-10 col-sm-5">
				<textarea id="description" name="description" class="autosize-transition form-control"></textarea>
				</div>
			</div>
			
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="note">添加备注：</label>
				<div class="col-sm-9">
					<div class="inline">
						<input type="text" name="note" id="note" value="删除该条进行添加备注" placeholder="回车可添加多条备注" />
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="note">上传文件：</label>
				<div class="col-xs-10 col-sm-5">
					<input multiple="multiple" type="file" id="uploadFile" name="uploadFile"/>
				</div>
			</div>
		
			<div class="clearfix form-actions" >
				<div class="col-md-offset-4 col-md-9">
					<button class="btn btn-info" type="button" id="submit"   onclick="checkAll();"> 
						<i class="ace-icon fa fa-check bigger-110"></i>
						提交
					</button>
					&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
					<button class="btn" type="reset" onclick="clearAllCss();">
						<i class="ace-icon fa fa-undo bigger-110"></i>
						重置
					</button>
				</div>
			</div>
		</form:form>
		<!-- PAGE CONTENT ENDS -->
	</div><!-- /.col -->
</div><!-- /.row -->

<!-- page specific plugin scripts -->

<!--[if lte IE 8]>
  <script src="<%=request.getContextPath()%>/assets/js/excanvas.min.js"></script>
<![endif]-->
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


function clearAllCss(){
	$("#showResult,#showResult1,#showResult2,#showResult3,#showResult4,#showResult5,#showResult6").html("");
	$("#submit").attr("disabled",false);
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

	function checkTitle(){
		var title =$.trim($("#title").val());
		if(title ==""){
			$("#showResult2").html("<font color='red'>不能为空</font>");
			$("#submit").attr("type","button");
			$("#submit").attr("disabled",true);
		}else{
			$("#submit").attr("disabled",false);
		}
	}

	function checkVersion(){
		var version =$.trim($("#version").val());
		var reg=/^(\d)+(\.[0-9]+)*$/;
		if(version==""){
			$("#submit").attr("type","button");
			$("#showResult3").html("<font color='red'>不能为空</font>");
			$("#submit").attr("disabled",true);
		}else{
			 if(!version.match(reg)){
			 	$("#submit").attr("type","button");
				$("#submit").attr("disabled",true);
				$("#showResult3").html("<font color='red'>格式不正确</font>");
			}else{
				$("#submit").attr("disabled",false);
			}
		}
	}

	function checkInitiator(){
		var initiator =$.trim($("#initiator").val());
		if(initiator==""){
			$("#showResult4").html("<font color='red'>不能为空</font>");
			$("#submit").attr("disabled",true);
		}else{
			$("#submit").attr("disabled",false);
		}
		
		var onlineDate =$.trim($("#onlineDate").val());
		if(onlineDate==""){
			$("#showResult6").html("<font color='red'>不能为空</font>");
			$("#submit").attr("disabled",true);
		}else{
			$("#submit").attr("disabled",false);
		}
	}

	function checkManager(){
		var manager =$.trim($("#manager").val());
		if(manager==""){
			$("#showResult5").html("<font color='red'>不能为空</font>");
			$("#submit").attr("disabled",true);
		}else{
			$("#submit").attr("disabled",false);
		}
	}



	function checkRequirmentNum() {  
		 var requirement_num = $.trim($("#requirement_num").val());  
		 var reg=/^(\d)*$/;
		 if(requirement_num==""){
			$("#showResult").html("<font color='red'>不能为空</font>");
			$("#submit").attr("disabled",true);
		}else{
			if( !requirement_num.match(reg)){
				$("#showResult").html("<font color='red'>格式不正确</font>");
				$("#submit").attr("disabled",true);
			}else{
	            $.ajax({  
	                type:"POST",  
	                url:"<%=request.getContextPath()%>/requirement/checkRequirementNum", 
						data : "requirement_num=" + requirement_num, 
						dataType : "json", 
						complete : function(data) {
							var result = eval("(" + data.responseText + ")");
							if (result) {
								$("#showResult").html("");
								$("#submit").attr("disabled",false);
							} else {
								$("#showResult").html("<font color='red'>需求工单号存在</font>");
								$("#submit").attr("disabled",true);
							}
						}
				});
			}
	            
	      }  
	}




var scripts = [null,
               "<%=request.getContextPath()%>/assets/js/jquery-ui.custom.min.js",
               "<%=request.getContextPath()%>/assets/js/jquery.ui.touch-punch.min.js",
               "<%=request.getContextPath()%>/assets/js/chosen.jquery.min.js",
               "<%=request.getContextPath()%>/assets/js/fuelux/fuelux.spinner.min.js",
               "<%=request.getContextPath()%>/assets/js/date-time/bootstrap-datepicker.min.js",
               "<%=request.getContextPath()%>/assets/js/date-time/bootstrap-timepicker.min.js",
               "<%=request.getContextPath()%>/assets/js/date-time/moment.min.js",
               "<%=request.getContextPath()%>/assets/js/date-time/daterangepicker.min.js",
               "<%=request.getContextPath()%>/assets/js/date-time/bootstrap-datetimepicker.min.js",
               "<%=request.getContextPath()%>/assets/js/bootstrap-colorpicker.min.js",
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
	
		$.mask.definitions['~']='[+-]';
		$('.input-mask-date').mask('99/99/9999');
		$('.input-mask-phone').mask('(999) 999-9999');
		$('.input-mask-eyescript').mask('~9.99 ~9.99 999');
		$(".input-mask-product").mask("a*-999-a999",{placeholder:" ",completed:function(){alert("You typed the following: "+this.val());}});
	
	
	
		$( "#input-size-slider" ).css('width','200px').slider({
			value:1,
			range: "min",
			min: 1,
			max: 8,
			step: 1,
			slide: function( event, ui ) {
				var sizing = ['', 'input-sm', 'input-lg', 'input-mini', 'input-small', 'input-medium', 'input-large', 'input-xlarge', 'input-xxlarge'];
				var val = parseInt(ui.value);
				$('#form-field-4').attr('class', sizing[val]).val('.'+sizing[val]);
			}
		});
	
		$( "#input-span-slider" ).slider({
			value:1,
			range: "min",
			min: 1,
			max: 12,
			step: 1,
			slide: function( event, ui ) {
				var val = parseInt(ui.value);
				$('#form-field-5').attr('class', 'col-xs-'+val).val('.col-xs-'+val);
			}
		});
	
	
		
		//"jQuery UI Slider"
		//range slider tooltip example
		$( "#slider-range" ).css('height','200px').slider({
			orientation: "vertical",
			range: true,
			min: 0,
			max: 100,
			values: [ 17, 67 ],
			slide: function( event, ui ) {
				var val = ui.values[$(ui.handle).index()-1] + "";
	
				if( !ui.handle.firstChild ) {
					$("<div class='tooltip right in' style='display:none;left:16px;top:-6px;'><div class='tooltip-arrow'></div><div class='tooltip-inner'></div></div>")
					.prependTo(ui.handle);
				}
				$(ui.handle.firstChild).show().children().eq(1).text(val);
			}
		}).find('a').on('blur', function(){
			$(this.firstChild).hide();
		});
		
		
		$( "#slider-range-max" ).slider({
			range: "max",
			min: 1,
			max: 10,
			value: 2
		});
		
		$( "#slider-eq > span" ).css({width:'90%', 'float':'left', margin:'15px'}).each(function() {
			// read initial values from markup and remove that
			var value = parseInt( $( this ).text(), 10 );
			$( this ).empty().slider({
				value: value,
				range: "min",
				animate: true
				
			});
		});
		
		$("#slider-eq > span.ui-slider-purple").slider('disable');//disable third item
	
		
		$('#id-input-file-1 , #id-input-file-2').ace_file_input({
			no_file:'No File ...',
			btn_choose:'Choose',
			btn_change:'Change',
			droppable:false,
			onchange:null,
			thumbnail:false //| true | large
			//whitelist:'gif|png|jpg|jpeg'
			//blacklist:'exe|php'
			//onchange:''
			//
		});
		//pre-show a file name, for example a previously selected file
		//$('#id-input-file-1').ace_file_input('show_file_list', ['myfile.txt'])
		
	
		//dynamically change allowed formats by changing allowExt && allowMime function
		$('#id-file-format').removeAttr('checked').on('change', function() {
			var whitelist_ext, whitelist_mime;
			var btn_choose
			var no_icon
			if(this.checked) {
				btn_choose = "Drop images here or click to choose";
				no_icon = "ace-icon fa fa-picture-o";
	
				whitelist_ext = ["jpeg", "jpg", "png", "gif" , "bmp"];
				whitelist_mime = ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp"];
			}
			else {
				btn_choose = "Drop files here or click to choose";
				no_icon = "ace-icon fa fa-cloud-upload";
				
				whitelist_ext = null;//all extensions are acceptable
				whitelist_mime = null;//all mimes are acceptable
			}
			var file_input = $('#uploadFile');
			file_input
			.ace_file_input('update_settings',
			{
				'btn_choose': btn_choose,
				'no_icon': no_icon,
				'allowExt': whitelist_ext,
				'allowMime': whitelist_mime
			})
			file_input.ace_file_input('reset_input');
			
			file_input
			.off('file.error.ace')
			.on('file.error.ace', function(e, info) {
				//console.log(info.file_count);//number of selected files
				//console.log(info.invalid_count);//number of invalid files
				//console.log(info.error_list);//a list of errors in the following format
				
				//info.error_count['ext']
				//info.error_count['mime']
				//info.error_count['size']
				
				//info.error_list['ext']  = [list of file names with invalid extension]
				//info.error_list['mime'] = [list of file names with invalid mimetype]
				//info.error_list['size'] = [list of file names with invalid size]
				
				
				/**
				if( !info.dropped ) {
					//perhapse reset file field if files have been selected, and there are invalid files among them
					//when files are dropped, only valid files will be added to our file array
					e.preventDefault();//it will rest input
				}
				*/
				
				
				//if files have been selected (not dropped), you can choose to reset input
				//because browser keeps all selected files anyway and this cannot be changed
				//we can only reset file field to become empty again
				//on any case you still should check files with your server side script
				//because any arbitrary file can be uploaded by user and it's not safe to rely on browser-side measures
			});
		
		});
	
		$('#spinner1').ace_spinner({value:0,min:0,max:200,step:10, btn_up_class:'btn-info' , btn_down_class:'btn-info'})
		.on('change', function(){
			//alert(this.value)
		});
		$('#spinner2').ace_spinner({value:0,min:0,max:10000,step:100, touch_spinner: true, icon_up:'ace-icon fa fa-caret-up', icon_down:'ace-icon fa fa-caret-down'});
		$('#spinner3').ace_spinner({value:0,min:-100,max:100,step:10, on_sides: true, icon_up:'ace-icon fa fa-plus smaller-75', icon_down:'ace-icon fa fa-minus smaller-75', btn_up_class:'btn-success' , btn_down_class:'btn-danger'});
		//$('#spinner1').ace_spinner('disable').ace_spinner('value', 11);
		//or
		//$('#spinner1').closest('.ace-spinner').spinner('disable').spinner('enable').spinner('value', 11);//disable, enable or change value
		//$('#spinner1').closest('.ace-spinner').spinner('value', 0);//reset to 0
	
	
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
	
		//or change it into a date range picker
		$('.input-daterange').datepicker({autoclose:true});
	
	
		//to translate the daterange picker, please copy the "examples/daterange-fr.js" contents here before initialization
		$('input[name=date-range-picker]').daterangepicker({
			'applyClass' : 'btn-sm btn-success',
			'cancelClass' : 'btn-sm btn-default',
			locale: {
				applyLabel: 'Apply',
				cancelLabel: 'Cancel',
			}
		})
		.prev().on(ace.click_event, function(){
			$(this).next().focus();
		});
	
	
		$('#timepicker1').timepicker({
			minuteStep: 1,
			showSeconds: true,
			showMeridian: false
		}).next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		
		$('#date-timepicker1').datetimepicker().next().on(ace.click_event, function(){
			$(this).prev().focus();
		});
		
	
		$('#colorpicker1').colorpicker();
	
		$('#simple-colorpicker-1').ace_colorpicker();
		//$('#simple-colorpicker-1').ace_colorpicker('pick', 2);//select 2nd color
		//$('#simple-colorpicker-1').ace_colorpicker('pick', '#fbe983');//select #fbe983 color
		//var picker = $('#simple-colorpicker-1').data('ace_colorpicker')
		//picker.pick('red', true);//insert the color if it doesn't exist
	
	
		$(".knob").knob();
		
		
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
		
		
		//////////
		
		//typeahead.js
		//example taken from plugin's page at: https://twitter.github.io/typeahead.js/examples/
		var substringMatcher = function(strs) {
			return function findMatches(q, cb) {
				var matches, substringRegex;
			 
				// an array that will be populated with substring matches
				matches = [];
			 
				// regex used to determine if a string contains the substring `q`
				substrRegex = new RegExp(q, 'i');
			 
				// iterate through the pool of strings and for any string that
				// contains the substring `q`, add it to the `matches` array
				$.each(strs, function(i, str) {
					if (substrRegex.test(str)) {
						// the typeahead jQuery plugin expects suggestions to a
						// JavaScript object, refer to typeahead docs for more info
						matches.push({ value: str });
					}
				});
	
				cb(matches);
			}
		 }
	
		 $('input.typeahead').typeahead({
			hint: true,
			highlight: true,
			minLength: 1
		 }, {
			name: 'states',
			displayKey: 'value',
			source: substringMatcher(ace.vars['US_STATES'])
		 });
			
	
	
		/////////
		$('#modal-form input[type=file]').ace_file_input({
			style:'well',
			btn_choose:'Drop files here or click to choose',
			btn_change:null,
			no_icon:'ace-icon fa fa-cloud-upload',
			droppable:true,
			thumbnail:'large'
		})
		
		//chosen plugin inside a modal will have a zero width because the select element is originally hidden
		//and its width cannot be determined.
		//so we set the width after modal is show
		$('#modal-form').on('shown.bs.modal', function () {
			$(this).find('.chosen-container').each(function(){
				$(this).find('a:first-child').css('width' , '210px');
				$(this).find('.chosen-drop').css('width' , '210px');
				$(this).find('.chosen-search input').css('width' , '200px');
			});
		})
		/**
		//or you can activate the chosen plugin after modal is shown
		//this way select element becomes visible with dimensions and chosen works as expected
		$('#modal-form').on('shown', function () {
			$(this).find('.modal-chosen').chosen();
		})
		*/
	});
	});
</script>
