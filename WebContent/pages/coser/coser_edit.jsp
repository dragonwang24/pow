<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
  	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<%@include file="/pages/common/common.jsp" %>
	<style>
	.btn-default.active.focus, .btn-default.active:focus, .btn-default.active:hover, .btn-default:active.focus, .btn-default:active:focus, .btn-default:active:hover, .open>.dropdown-toggle.btn-default.focus, .open>.dropdown-toggle.btn-default:focus, .open>.dropdown-toggle.btn-default:hover {
	    color: #333;
	    background-color: #fece07;
	    border-color: #fece07;
    }
	</style>
	<style>
  		.leftTitle{
  			font-size: 18px;
		    padding: 0;
		    margin: 0px;
		    font-weight: bold;
		    border-bottom:1px solid #eee;
  		}
  		.rightTitle{
	  		font-size: 16px;
		    color: #999;
		    font-weight: normal;
  		}
  		.file-drop-zone {
  			margin:0;
  		}
  		.file-drop-zone-title{
  			padding:0;
  		}
  		.col-xs-4.col-sm-4.col-md-4,.col-xs-5.col-sm-5.col-md-5 {
  			padding:0;
  		}
  		.page2 input.form-control,.page3 input.form-control{
  			height:25px !important;
  		}
  		select.form-control{
  			height:25px !important;
  		}
  		.checkbox .btn-default:hover{
  			background:none;
  			border-color: #fff;
  		}
  		.btn-default.active, .btn-default:active, .open>.dropdown-toggle.btn-default {
		    color: #333;
		    background-color: #fece07 !important;
		    border-color: #fff;
		}
		.checkbox .btn-default{
			border-color: #fff;
			border-radius:0px;
		}
		.checkbox label, .radio label{
			padding-left:12px
		}
		.left_label{
			font-weight: normal;padding:0px;margin-top:4px;margin-bottom:0px;
		}
		.right_label{
			color:#A5A1A1;font-weight: normal;padding:0px;margin-top:4px;margin-bottom:0px
		}
		
		.file-preview-frame{
			height:50px;margin: 6px;border: 0px;padding: 0px;
		}
		.btn.active, .btn:active {
		    -webkit-box-shadow: none;
		    box-shadow: none;
		}
		#uploadControl .btn-primary , #uploadControl .btn-primary:hover{
		    color: #949090 !important;
		    background-color: #ccc !important;
		    border-color: #ccc !important;
		}
  	</style>
  	<title>个人资料</title>
</head>
<body style="margin:auto;padding-top:10px;background: #F2F2F2">
	<form role="form" id="coserForm" class="form-horizontal col-xs-12 col-sm-12 col-md-12" style="padding-right:10px;padding-left:10px;">
		<div style="background:#ffffff;padding:30px 10px;border-top-right-radius:5px;border-top-left-radius:5px;">
			<div class="form-group">
				<div class="col-xs-2 col-sm-2 col-md-2" style="max-width:50px;">
					<img src="<%=contextPath%>/pages/images/perfect_info1/57.png" style="width:30px;">
				</div>
				<div class="col-xs-10 col-sm-10 col-md-10">
					<input type="text" class="form-control" id="cnName" name="cnName" placeholder="CN">
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-2 col-sm-2 col-md-2" style="max-width:50px;text-align:right;">
					<img src="<%=contextPath%>/pages/images/perfect_info1/58.png" style="width:30px;">
				</div>
				<div class="col-xs-10 col-sm-10 col-md-10">
					<div class="btn-group col-xs-12 col-sm-12 col-md-12" data-toggle="buttons" style="padding:0px;">
					   <label class="btn btn-default col-xs-6 col-sm-6 col-md-6">
					      <input type="radio" name="sex" id="male" value="0"> 男
					   </label>
					   <label class="btn btn-default col-xs-6 col-sm-6 col-md-6">
					      <input type="radio" name="sex" id="female" value="1"> 女
					   </label>
					</div>	
				</div>
			</div>
			<div class="form-group" >
				<div class="col-xs-2 col-sm-2 col-md-2" style="max-width:50px;">
					<img src="<%=contextPath%>/pages/images/perfect_info1/59.png" style="width:30px;">
				</div>
				<div class="col-xs-10 col-sm-10 col-md-10">
					<input type="text" class="form-control" id="birthday" name="birthday" placeholder="请填写生日yyyy-MM-dd">
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-2 col-sm-2 col-md-2" style="max-width:50px;">
					<img src="<%=contextPath%>/pages/images/perfect_info1/60.png" style="width:30px;">
				</div>
				<div class="col-xs-10 col-sm-10 col-md-10">
					<input type="text" class="form-control" id="location" name="location" placeholder="请填写所在地">
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-2 col-sm-2 col-md-2" style="max-width:50px;">
					<img src="<%=contextPath%>/pages/images/perfect_info1/61.png" style="width:30px;">
				</div>
				<div class="col-xs-10 col-sm-10 col-md-10">
					<input type="text" class="form-control" id="weiboName" name="weiboName" placeholder="微博昵称（选填）">
				</div>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-12 page2" style="background:#ffffff;height:100%;padding:0 5px;">
		<p class="col-xs-12 col-sm-12 col-md-12 leftTitle" >个人作品<span class="rightTitle">(限5-9张)</span></p>
		<div id="uploadControl" class="col-xs-12 col-sm-12 col-md-12" style="padding:10px 0px">
			<input id="works" type="file" name="uploadedFile" multiple="true" class="file-loading">
	    </div>
	    <p class="col-xs-12 col-sm-12 col-md-12 leftTitle" >coser资料<span class="rightTitle">(选填，仅合作方可见)</span></p>
		<div class="col-xs-12 col-sm-12 col-md-12" style="padding:10px 0px">
			<div class="col-xs-4 col-sm-4 col-md-4" style="text-align:center">
				<label class="col-xs-4 col-sm-4 col-md-4 left_label">身高:</label>
				<div class="col-xs-5 col-sm-5 col-md-5 ">
					<input class="form-control"  style="padding:0px" type="text" name="height" id="height" />
				</div>
				<label class="col-xs-3 col-sm-3 col-md-3 right_label">cm</label>
			</div>
			<div class="col-xs-4 col-sm-4 col-md-4" style="text-align:center">
				<label class="col-xs-4 col-sm-4 col-md-4 left_label" >体重:</label>
				<div class="col-xs-5 col-sm-5 col-md-5 ">
					<input class="form-control"  style="padding:0px" type="text" name="weight" id="weight" />
				</div>
				<label class="col-xs-3 col-sm-3 col-md-3 right_label" >kg</label>
			</div>
			<div class="col-xs-4 col-sm-4 col-md-4" style="text-align:center">
				<label class="col-xs-4 col-sm-4 col-md-4 left_label" >鞋码:</label>
				<div class="col-xs-5 col-sm-5 col-md-5 ">
					<input class="form-control"  style="padding:0px" type="text" name="footSize" id="footSize" />
				</div>
				<label class="col-xs-3 col-sm-3 col-md-3 right_label" >码</label>
			</div>
	    </div>
		<div class="col-xs-12 col-sm-12 col-md-12" style="padding:10px 0px">
			<div class="col-xs-4 col-sm-4 col-md-4" style="text-align:center">
				<label class="col-xs-4 col-sm-4 col-md-4 left_label" >胸围:</label>
				<div class="col-xs-5 col-sm-5 col-md-5 ">
					<input class="form-control"  style="padding:0px" type="text" name="bust" id="bust" />
				</div>
				<label class="col-xs-3 col-sm-3 col-md-3 right_label">cm</label>
			</div>
			<div class="col-xs-4 col-sm-4 col-md-4" style="text-align:center">
				<label class="col-xs-4 col-sm-4 col-md-4 left_label" >腰围:</label>
				<div class="col-xs-5 col-sm-5 col-md-5  ">
					<input class="form-control"  style="padding:0px" type="text" name="waist" id="waist" />
				</div>
				<label class="col-xs-3 col-sm-3 col-md-3 right_label" >cm</label>
			</div>
			<div class="col-xs-4 col-sm-4 col-md-4" style="text-align:center">
				<label class="col-xs-4 col-sm-4 col-md-4 left_label">臀围:</label>
				<div class="col-xs-5 col-sm-5 col-md-5 ">
					<input class="form-control"  style="padding:0px" type="text" name="hip" id="hip" />
				</div>
				<label class="col-xs-3 col-sm-3 col-md-3 right_label" >cm</label>
			</div>
	    </div>
	    <p class="col-xs-12 col-sm-12 col-md-12 leftTitle" style="padding-top:10px;">个人风格<span class="rightTitle">(可多选)</span></p>
		<div class="col-xs-12 col-sm-12 col-md-12" style="padding:10px 0px">
			<div class="btn-group checkbox" data-toggle="buttons" style="padding:0 15px;">
			   <label class="btn btn-default col-xs-2 col-sm-2 col-md-2" style="width:20%;">
			      <input type="checkbox" name="styles" value="萝莉"> 萝莉
			   </label>
			   <label class="btn btn-default col-xs-2 col-sm-2 col-md-2" style="width:20%;">
			      <input type="checkbox" name="styles" value="正太"> 正太
			   </label>
			   <label class="btn btn-default col-xs-2 col-sm-2 col-md-2" style="width:20%;">
			      <input type="checkbox" name="styles" value="大叔"> 大叔
			   </label>
			   <label class="btn btn-default col-xs-2 col-sm-2 col-md-2" style="width:20%;">
			      <input type="checkbox" name="styles" value="御姐"> 御姐
			   </label>
			   <label class="btn btn-default col-xs-2 col-sm-2 col-md-2" style="width:20%;">
			      <input type="checkbox" name="styles" value="古风"> 古风
			   </label>
			   <label class="btn btn-default col-xs-2 col-sm-2 col-md-2" style="width:20%;">
			      <input type="checkbox" name="styles" value="日系"> 日系
			   </label>
			   <label class="btn btn-default col-xs-2 col-sm-2 col-md-2" style="width:20%;">
			      <input type="checkbox" name="styles" value="欧系"> 欧系
			   </label>
			   <label class="btn btn-default col-xs-2 col-sm-2 col-md-2" style="width:20%;">
			      <input type="checkbox" name="styles" value="其他"> 其他
			   </label>
			</div>
	    </div>
	    <p class="col-xs-12 col-sm-12 col-md-12 leftTitle" style="padding-top:10px;">个人特长<span class="rightTitle">(可多选)</span></p>
		<div class="col-xs-12 col-sm-12 col-md-12" style="padding:10px 0px">
			<div class="btn-group checkbox" data-toggle="buttons" style="padding:0 15px;">
			   <label class="btn btn-default col-xs-2 col-sm-2 col-md-2" style="width:20%;">
			      <input type="checkbox" name="features" value="化妆"> 化妆
			   </label>
			   <label class="btn btn-default col-xs-2 col-sm-2 col-md-2" style="width:20%;">
			      <input type="checkbox" name="features" value="后期"> 后期
			   </label>
			   <label class="btn btn-default col-xs-2 col-sm-2 col-md-2" style="width:20%;">
			      <input type="checkbox" name="features" value="服装"> 服装
			   </label>
			   <label class="btn btn-default col-xs-2 col-sm-2 col-md-2" style="width:20%;">
			      <input type="checkbox" name="features" value="道具"> 道具
			   </label>
			   <label class="btn btn-default col-xs-2 col-sm-2 col-md-2" style="width:20%;">
			      <input type="checkbox" name="features" value="绘画"> 绘画
			   </label>
			   <label class="btn btn-default col-xs-2 col-sm-2 col-md-2" style="width:20%;">
			      <input type="checkbox" name="features" value="跳舞"> 跳舞
			   </label>
			   <label class="btn btn-default col-xs-2 col-sm-2 col-md-2" style="width:20%;">
			      <input type="checkbox" name="features" value="摄影"> 摄影
			   </label>
			   <label class="btn btn-default col-xs-2 col-sm-2 col-md-2" style="width:20%;">
			      <input type="checkbox" name="features" value="表演"> 表演
			   </label>
			</div>
	    </div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-12 page3" style="background:#ffffff;height:100%;padding:2px 5px 20px 5px;border-bottom-right-radius:5px;border-bottom-left-radius:5px;">
		<div class="col-xs-12 col-sm-12 col-md-12" id="mainDiv" style="padding:0;">
			<p class="col-xs-12 col-sm-12 col-md-12 leftTitle" >合作类型<span class="rightTitle">(可多选)</span></p>
			<div class="col-xs-12 col-sm-12 col-md-12" name="cooperationTypeRows" style="margin:0;padding:10px 0;">
				<div class="col-xs-6 col-sm-6 col-md-6" style="padding:0 0px">
					<select id="cooperationType" class="form-control">
						<option value="0">微博转发(每条)</option>
						<option value="1">微博直发(每条)</option>
						<option value="2">线下活动(每天)</option>
						<option value="3">平面拍摄(每张)</option>
						<option value="4">视频拍摄(每天)</option>
						<option value="5">活动主持(每场)</option>
					</select>
			     </div>
			     <div class="col-xs-4 col-sm-4 col-md-4" style="padding:0">
			     	<input type="text" class="form-control pull-left" style="width:80px;" id="money" placeholder="填写"><label class="right_label">元</label>
			     </div>
			     <div class="col-xs-2 col-sm-2 col-md-2" style="padding:0;margin-top:4px;">
			     	<a href="#" onclick="addRow()" style="color: #fece07;text-decoration: blink;">添加+</a>
			     </div>
		     </div>
		</div>
		<div class="form-group col-xs-12 col-sm-12 col-md-12" style="padding:0;padding-top:30px;margin-right:0px;margin-left:0px;">
			<p class="col-xs-12 col-sm-12 col-md-12 leftTitle" >coser经历</p>
			<div class="col-xs-12 col-sm-12 col-md-12" style="padding:10px 0px">
				<textarea class="form-control" id="experience" name="experience" rows="5" placeholder="请填写cos经历，限1000字以内" maxlength="1000"></textarea>
			</div>
		</div>
		<div class="form-group col-xs-12 col-sm-12 col-md-12" style="padding:0;padding-top:30px;margin-right:0px;margin-left:0px;">
			<p class="col-xs-12 col-sm-12 col-md-12 leftTitle" >个人介绍</p>
			<div class="col-xs-12 col-sm-12 col-md-12" style="padding:10px 0px">
				<textarea class="form-control" id="description" name="description" rows="5" placeholder="请填写个人介绍，限1000字以内" maxlength="1000"></textarea>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-12" style="padding-top:50px;text-align:center;">
			<a type="button" class="btn btn_warning col-xs-12 col-sm-12 col-md-12" onclick="dosave()" style="padding: 5px 30px; background: #fece07;color: black;font-size: 18px; font-weight: bold;">提交</a>
		</div>
	</div>
	<div id="template" style="display:none">
		<div class="form-group" name="cooperationTypeRows" style="margin:0;padding:0;padding-top:10px;">
		     <div class="col-xs-6 col-sm-6 col-md-6" style="padding:0px">
				<select id="cooperationType"  class="form-control">
					<option value="0">微博转发(每条)</option>
					<option value="1">微博直发(每条)</option>
					<option value="2">线下活动(每天)</option>
					<option value="3">平面拍摄(每张)</option>
					<option value="4">视频拍摄(每天)</option>
					<option value="5">活动主持(每场)</option>
				</select>
		     </div>
		     <div class="col-xs-4 col-sm-4 col-md-4" style="padding:0">
		     	<input type="text" class="form-control pull-left" style="width:80px;" id="money" placeholder="填写"><label class="right_label">元</label>
		     </div>
		     <div class="col-xs-2 col-sm-2 col-md-2" style="padding:0;margin-top:4px;">
		     	<a onclick="removeThisRow(this)" style="color:gray">删除</a>
		     </div>
	     </div>
	</div>
	</form>
	
</body>
<script>

	var coserId = '<%=request.getParameter("cnid")%>';
	var initialPreview = [];
	var workImages = [];
	function initData(){
		$.ajax({
			url:contextPath+'/rest/cosers/'+coserId,
			type:'POST',
			dataType:'json',
			success:function(coser){
				if(!coser){
					return;
				}
				var formHelper = new DivFormHelper("coserForm");
				if(coser.birthday){
					coser.birthday = coser.birthday.substring(0,10);
				}
				formHelper.setData(coser);
				$("input[name='sex'][value="+coser.sex+"]").parent().addClass("active"); 
				var features = coser.features;
				if(features){
					features = features.split(",")
					for(var i = 0;i < features.length; i++){
						if(features[i]){
							$("input[name='features'][value="+features[i]+"]").parent().addClass("active"); 
						}
					}
				}
				var styles = coser.styles;
				if(styles){
					styles = styles.split(",")
					for(var i = 0;i < styles.length; i++){
						if(styles[i]){
							$("input[name='styles'][value="+styles[i]+"]").parent().addClass("active"); 
						}
					}
				}
				var cooperation_types = JSON.parse(coser.cooperation_type);
				if(cooperation_types && cooperation_types.length > 0){
					for(var i = 0; i < cooperation_types.length; i++){
						if(i == 0){
							$("#cooperationType").val(cooperation_types[i].cooperationType);
							$("#money").val(cooperation_types[i].money);
						}else{
							$("#mainDiv").append(templateRow.replace('id="cooperationType"','id="cooperationType" value="'+cooperation_types[i].cooperationType+'"').replace('id="money"','id="money" value="'+cooperation_types[i].money+'"'));
						}
					}
				}
				var initialPreviewConfig = [];
				workImages = coser.workImages;
				if(workImages){
					workImages = workImages.split(",");
					for(var i = 0; i < workImages.length; i++){
						initialPreview.push("<img class='file-preview-image' style='width:50px;height:50px;' src='"+contextPath+"/"+workImages[i]+"'>");
						initialPreviewConfig.push({url: contextPath+"/rest/cosers/workses/delete", key: workImages[i]});
					}
					$("#works").fileinput({
				    	language: 'zh',
				    	uploadUrl: contextPath+"/rest/cosers/upload",
				    	uploadAsync: false,
				    	//minFileCount: 5,
				    	maxFileCount: 9,
				    	resizeImage: true,
				    	showClose: false,
				    	showRemove:false,
				    	showUpload:false,
				    	overwriteInitial: false,
				    	initialPreview: initialPreview,
				        initialPreviewConfig: initialPreviewConfig,
				        browseIcon:'<i class="glyphicon glyphicon-plus-sign"></i>',
				    	/* layoutTemplates:{footer : '<div class="file-thumbnail-footer" style="position:relative">\n' +
				    		'<button type="button" class="kv-file-remove btn btn-xs btn-default pull-right" style="-webkit-box-shadow: none !important; background: #eee; position: absolute;bottom: 0px;right:0px;border: 0px;padding: 0px;margin-right:-6px;margin-bottom:-6px;" title="删除文件"><i class="glyphicon glyphicon-trash text-danger"></i></button>\n' +
				    		'</div>'},
				    	previewTemplates:{image: '<div class="file-preview-frame" style="height:50px;margin: 6px;border: 0px;padding: 0px;" id="{previewId}" data-fileindex="{fileindex}">\n' +
				            '   <img src="{data}" class="file-preview-image" style="width:50px;height:50px;" title="{caption}" alt="{caption}" >\n' +
				            '   {footer}\n' +
				            '</div>\n',}, */
			            layoutTemplates:{
			        		footer: '<div class="file-thumbnail-footer" style="position:relative">\n' +
			                '    {actions}\n' +
			                '</div>',
			        		actions: '<div class="file-actions" style="margin-top:-2px;">\n' +
			                '    <div class="file-footer-buttons">\n' +
			                '        {delete}' +
			                '    </div>\n' +
			                '    <div class="clearfix"></div>\n' +
			                '</div>',
			            	actionDelete: '<button type="button" onclick="deleteWorkses(this)" style="-webkit-box-shadow: none !important; background: #eee; position: absolute;bottom: 0px;right:0px;border: 0px;padding: 0px;margin-right:-6px;margin-bottom:-6px;" class="kv-file-remove {removeClass}" title="{removeTitle}"{dataUrl}{dataKey}>{removeIcon}</button>\n',
			        	},
			        	previewTemplates:{image: '<div class="file-preview-frame" style="height:50px;margin: 6px;border: 0px;padding: 0px;" id="{previewId}" data-fileindex="{fileindex}">\n' +
			                '   <img src="{data}" class="file-preview-image" style="width:50px;height:50px;" title="{caption}" alt="{caption}" >\n' +
			                '   {footer}\n' +
			                '</div>\n',} ,
				        allowedFileExtensions: ["jpg","jpeg","png", "gif"]
				    });
					
					$('#works').on('filebatchuploadsuccess', function(event, data, previewId, index) {
				        var response = data.response;
				        if(response && response.imagePaths){
				        	var imagePaths = response.imagePaths;
				        	
				        	save(imagePaths);
				        }
				        console.log('File batch upload success');
				    });
					
					$('#works').on('filebatchuploaderror', function(event, data, msg) {
					    var form = data.form, files = data.files, extra = data.extra,
					        response = data.response, reader = data.reader;
					    console.log('File batch upload error');
					   alert(msg);
					});
					
					$('#works').on('fileerror', function(event, data, msg) {
						   console.log(data.id);
						   console.log(data.index);
						   console.log(data.file);
						   console.log(data.reader);
						   console.log(data.files);
						   // get message
						   alert(msg);
					});
					
					$('#coserForm').validate({  
			            errorElement : 'span',  
			            errorClass : 'help-block',  
			            focusInvalid : false,  
			            rules : {  
			            	cnName : {  
			                    required : true  
			                },
			            	birthday : {  
			                    required : true  
			                },
			                location : {  
			                    required : true  
			                },
			                experience : {  
			                    required : true  
			                },
			                description : {  
			                    required : true  
			                }
			            },  
			            messages : {  
			            	cnName : {  
			                    required : "Coser名称不能为空."  
			                },
			            	birthday : {  
			                    required : "生日不能为空."  
			                },
			                location : {  
			                    required : "所在地不能为空."  
			                },
			                experience : {  
			                    required : "coser经历不能为空."  
			                },
			                description : {  
			                    required : "个人简介不能为空."  
			                }
			            },  
			  
			            highlight : function(element) {  
			                $(element).closest('.form-group').addClass('has-error');  
			            },  
			  
			            success : function(label) {  
			                label.closest('.form-group').removeClass('has-error');  
			                label.remove();  
			            },  
			  
			            errorPlacement : function(error, element) {  
			                element.parent('div').append(error);  
			            },  
			  
			            submitHandler : function(form) {  
			                //form.submit();  
			            }  
			        });  
			  
				}
			}
		})
	}
	
	$(function(){
		
		initData();
	    
	});
	
	function removeThisRow(row){
		$(row).parent().parent().remove();
	}
	
	var templateRow = $("#template").html();
	function addRow(){
		$("#mainDiv").append(templateRow);
	}
	
	function dosave(){
		if ($('#coserForm').validate().form()) {  
        }else{
        	alert("信息填写不完整!");
        	return;
        }
		
		var styles=[];
		$("[name=styles]").each(function(index,element){
			if($(this).parent().hasClass("active")){
				styles.push($(this).val());
			}
		});
		if(styles.length == 0){
			alert("个人风格不能为空！")
			return;
		}
		
		var features = [];
		$("[name=features]").each(function(index,element){
			if($(this).parent().hasClass("active")){
				features.push($(this).val());
			}
		});
		if(features.length == 0){
			alert("个人特长不能为空！")
			return;
		}
		var needUploadFiles = $('#works').fileinput('getFileStack');
		if(needUploadFiles && needUploadFiles.length > 0){
			$('#works').fileinput('upload');
		}else{
			save();
		}
	}
	
	function save(imagesPaths){
		if ($('#coserForm').validate().form()) {  
        }else{
        	alert("信息填写不完整!");
        	return;
        }
		
		var styles=[];
		$("[name=styles]").each(function(index,element){
			if($(this).parent().hasClass("active")){
				styles.push($(this).val());
			}
		});
		if(styles.length == 0){
			alert("个人风格不能为空！")
			return;
		}
		
		var features = [];
		$("[name=features]").each(function(index,element){
			if($(this).parent().hasClass("active")){
				features.push($(this).val());
			}
		});
		if(features.length == 0){
			alert("个人特长不能为空！")
			return;
		}
		if(workImages && imagesPaths){
			workImages.push(imagesPaths);
		}
		var formHelper = new DivFormHelper("coserForm");
		var coser = formHelper.getData();
		coser.cnId = coserId;
		coser.sex = $("input[name=sex]:checked").val();
		coser.features = features.join(",");
		coser.styles = styles.join(",");
		coser.workImages = workImages.join(",");
		
		var cooperationTypes = [];
		var cooperationTypeRows = $("#mainDiv").find("[name=cooperationTypeRows]");
		var hasNullMoney =false;
		cooperationTypeRows.each(function(index,element){
			var money = $(this).find("#money").val();
			if(!money || money == ""){
				hasNullMoney = true;
			}
			var type = {
					cooperationType:$(this).find("#cooperationType").val(),
					money:money
			};
			cooperationTypes.push(type);
		});
		if(hasNullMoney){
			alert("合作类型金额不能为空！");
			return;
		}
		coser.cooperation_type = JSON.stringify(cooperationTypes);
		coser.experience = $("#experience").val();
		coser.description = $("#description").val();
		
		$.ajax({
			url:contextPath+'/rest/cosers/update',
			type:'POST',
			contentType:'application/json',
			data:JSON.stringify({coser:coser}),
			success:function(ret){
				window.location.href=contextPath+"/pages/coser/coser_submit_success.jsp?cnid="+coserId;
			},
			error:function(ret){
				alert("信息保存失败");
			}
		})
	}
	
	function deleteWorkses(_button){
		if(workImages){
			for(var i = 0; i < workImages.length; i++){
				if(workImages[i] && workImages[i] == _button.getAttribute("data-key")){
					workImages.splice(i,1);
					break;
				}
			}
		}
	}
	
</script>
</html>