<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<%@include file="/pages/common/common.jsp" %>
  	<title>新增Coser</title>
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
  		input.form-control{
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
		.btn-default{
			border-color: #fff;
			border-radius:0px;
		}
		#uploadControl .btn-primary , #uploadControl .btn-primary:hover{
		    color: #949090 !important;
		    background-color: #eee !important;
		    border-color: #eee !important;
		    padding: 10px 20px;
		    font-size:20px;
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
  	</style>
</head>
<body style="margin:10px;background: #F2F2F2">
	<form id="form" class="col-xs-12 col-sm-12 col-md-12" style="background:#ffffff;height:100%;padding:0 5px;border-radius:5px">
		<p class="col-xs-12 col-sm-12 col-md-12 leftTitle" >个人作品<span class="rightTitle">(限5-9张)</span></p>
		<div id="uploadControl" class="col-xs-12 col-sm-12 col-md-12" style="padding:10px 0px">
			<input id="works" type="file" name="uploadedFile" multiple="true" class="file-loading">
	    </div>
	    <p class="col-xs-12 col-sm-12 col-md-12 leftTitle" >coser资料<span class="rightTitle">(选填，仅合作方可见)</span></p>
		<div class="col-xs-12 col-sm-12 col-md-12" style="padding:10px 0px">
			<div class="col-xs-4 col-sm-4 col-md-4" style="text-align:center">
				<label class="col-xs-4 col-sm-4 col-md-4 left_label">身高:</label>
				<div class="col-xs-5 col-sm-5 col-md-5 ">
					<input class="form-control"  style="padding:0px" type="text" name="height" />
				</div>
				<label class="col-xs-3 col-sm-3 col-md-3 right_label">cm</label>
			</div>
			<div class="col-xs-4 col-sm-4 col-md-4" style="text-align:center">
				<label class="col-xs-4 col-sm-4 col-md-4 left_label" >体重:</label>
				<div class="col-xs-5 col-sm-5 col-md-5 ">
					<input class="form-control"  style="padding:0px" type="text" name="weight" />
				</div>
				<label class="col-xs-3 col-sm-3 col-md-3 right_label" >kg</label>
			</div>
			<div class="col-xs-4 col-sm-4 col-md-4" style="text-align:center">
				<label class="col-xs-4 col-sm-4 col-md-4 left_label" >鞋码:</label>
				<div class="col-xs-5 col-sm-5 col-md-5 ">
					<input class="form-control"  style="padding:0px" type="text" name="footSize" />
				</div>
				<label class="col-xs-3 col-sm-3 col-md-3 right_label" >码</label>
			</div>
	    </div>
		<div class="col-xs-12 col-sm-12 col-md-12" style="padding:10px 0px">
			<div class="col-xs-4 col-sm-4 col-md-4" style="text-align:center">
				<label class="col-xs-4 col-sm-4 col-md-4 left_label" >胸围:</label>
				<div class="col-xs-5 col-sm-5 col-md-5 ">
					<input class="form-control"  style="padding:0px" type="text" name="bust" />
				</div>
				<label class="col-xs-3 col-sm-3 col-md-3 right_label">cm</label>
			</div>
			<div class="col-xs-4 col-sm-4 col-md-4" style="text-align:center">
				<label class="col-xs-4 col-sm-4 col-md-4 left_label" >腰围:</label>
				<div class="col-xs-5 col-sm-5 col-md-5  ">
					<input class="form-control"  style="padding:0px" type="text" name="waist" />
				</div>
				<label class="col-xs-3 col-sm-3 col-md-3 right_label" >cm</label>
			</div>
			<div class="col-xs-4 col-sm-4 col-md-4" style="text-align:center">
				<label class="col-xs-4 col-sm-4 col-md-4 left_label">臀围:</label>
				<div class="col-xs-5 col-sm-5 col-md-5 ">
					<input class="form-control"  style="padding:0px" type="text" name="hip" />
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
			   <label class="btn btn-default col-xs-2 col-sm-2 col-md-2" onclick="onOtherStyleClick(this)" style="width:20%;">
			      <input type="checkbox" name="styles" value="其他" > 其他
			   </label>
			   <input id="styles_other" class="btn btn-default col-xs-2 col-sm-2 col-md-2"  style="width:35%;border-color:#eee;display:none;margin-left:5px;" value="AAA"/>
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
			      <input type="checkbox" name="features" value="表演" > 表演
			   </label>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-12" style="padding-top:50px;text-align:center">
				<a type="button" class="btn btn_warning col-xs-12 col-sm-12 col-md-12" onclick="doNext()" style="padding: 5px 30px; background:#fece07;color: #ffffff;font-size: 18px; font-weight: bold;">下一步</a>
			</div>
	    </div>
	</form>
</body>
<script>
var coserId = '<%=request.getParameter("id")%>';
var workImages = [];

var styles_other = $("#styles_other");

function onOtherStyleClick(dom){
	if(dom.className.indexOf("active") > 0){
		styles_other.hide();
	}else{
		styles_other.show();
	}
}
$(function(){
	$.ajax({
		url:contextPath+'/rest/cosers/'+coserId,
		type:'POST',
		dataType:'json',
		success:function(coser){
			if(!coser){
				return;
			}
			var formHelper = new DivFormHelper("form");
			if(coser.birthday){
				coser.birthday = coser.birthday.substring(0,10);
			}
			formHelper.setData(coser);
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
			var initialPreviewConfig = [];
			var initialPreview = [];
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
			    	showCaption: false,
			    	showUpload:false,
			    	minFileCount: 5,
			    	maxFileCount: 9,
			    	resizeImage: true,
			    	showClose: false,
			    	overwriteInitial: false,
			    	dropZoneEnabled:false,
			    	showRemove:false,
			    	initialPreview: initialPreview,
			        initialPreviewConfig: initialPreviewConfig,
			    	browseIcon:'<i class="glyphicon glyphicon-plus-sign"></i>',
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
			        	actionDelete: '<button type="button" style="-webkit-box-shadow: none !important; background: #eee; position: absolute;bottom: 0px;right:0px;border: 0px;padding: 0px;margin-right:-6px;margin-bottom:-6px;" class="kv-file-remove {removeClass}" title="{removeTitle}"{dataUrl}{dataKey}>{removeIcon}</button>\n',
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
			        	var imagePaths = response.imagePaths.join(",");
			        	
			        	doSaveForm(imagePaths);
			        }
			        console.log('File batch upload success');
			    });
			}
		}
	});
    
});

function doNext(){
	if(!coserId){
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
		doSaveForm();
	}
}

function doSaveForm(imagePaths){
	var styles=[];
	$("[name=styles]").each(function(index,element){
		if($(this).parent().hasClass("active")){
			styles.push($(this).val());
			if($(this).val()=='其它'){
				data.otherStyles=styles_other.val();
			}
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
	
	var formHelper = new DivFormHelper("form");
	var data = formHelper.getData();
	data.features = features.join(",");
	data.styles = styles.join(",");
	if(workImages && imagePaths){
		workImages.push(imagePaths);
	}
	//data.workImages = imagePaths;
	data.cnId = coserId;
	if(!coserId){
		return;
	}
	$.ajax({
		url:contextPath+'/rest/cosers/update',
		type:'POST',
		contentType:'application/json',
		data:JSON.stringify({coser:commitData}),
		success:function(ret){
			window.location.href=contextPath+"/pages/coser/coser_join_step4.jsp?id="+coserId;
		},
		error:function(ret){
			alert("信息保存失败");
		}
	})
	
}

</script>
</html>