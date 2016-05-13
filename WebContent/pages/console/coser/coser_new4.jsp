<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
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
		    padding-bottom:5px;
		    margin-bottom:10px;
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
  		select.form-control{
  			height:25px !important;
  		}
  		.checkbox .btn-default:hover{
  			background:none;
  			border-color: #fff;
  		}
  		.btn-default.active, .btn-default:active, .open>.dropdown-toggle.btn-default {
		    color: #333;
		    background-color: #EBF10B !important;
		    border-color: #fff;
		}
		.btn-default{
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
  	</style>
</head>
<body style="margin:10px;padding-top:5px;background: #F2F2F2">
	<div class="col-xs-12 col-sm-12 col-md-12" style="background:#ffffff;height:100%;padding:2px 2px 20px 2px;">
		<div class="col-xs-12 col-sm-12 col-md-12" id="mainDiv" style="padding:0;">
			<p class="col-xs-12 col-sm-12 col-md-12 leftTitle" >合作类型<span class="rightTitle">(可多选)</span></p>
			<div class="row" name="cooperationTypeRows" style="margin:0;padding:0;">
				<div class="col-xs-5 col-sm-5 col-md-5" style="padding:0 0px">
					<select id="cooperationType" class="form-control">
						<option value="0">微博转发（每条）</option>
						<option value="1">微博直发（每条）</option>
						<option value="2">线下活动（每天）</option>
						<option value="3">平面拍摄（每张）</option>
						<option value="4">视频拍摄（每天）</option>
						<option value="5">活动主持（每场）</option>
					</select>
			     </div>
			     <div class="col-xs-4 col-sm-4 col-md-4" style="padding:0">
			     	<input type="text" class="form-control pull-left" style="width:80px;" id="money" placeholder="填写"><label class="right_label">元</label>
			     </div>
			     <div class="col-xs-3 col-sm-3 col-md-3" style="padding:0;margin-top:4px;">
			     	<a href="#" onclick="addRow()">添加类型+</a>
			     </div>
		     </div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-12" style="padding:0;padding-top:30px;">
			<p class="col-xs-12 col-sm-12 col-md-12 leftTitle" >coser经历</p>
			<div class="col-xs-12 col-sm-12 col-md-12" style="padding:0">
				<textarea class="form-control" id="experience" rows="5" placeholder="请填写cos经历，限1000字以内" maxlength="1000"></textarea>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-12" style="padding:0;padding-top:30px;">
			<p class="col-xs-12 col-sm-12 col-md-12 leftTitle" >个人介绍</p>
			<div class="col-xs-12 col-sm-12 col-md-12" style="padding:0">
				<textarea class="form-control" id="description" rows="5" placeholder="请填写个人介绍，限1000字以内" maxlength="1000"></textarea>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-12" style="padding-top:50px;text-align:center">
			<a type="button" class="btn btn_warning" onclick="submit()" style="padding: 5px 30px; background: yellow;width: 200px;color: black;font-size: 18px; font-weight: bold;">提交</a>
		</div>
	</div>
	<div id="template" style="display:none">
		<div class="row" name="cooperationTypeRows" style="margin:0;padding:0;padding-top:10px;">
		     <div class="col-xs-5 col-sm-5 col-md-5" style="padding:0px">
				<select id="cooperationType" class="form-control">
					<option value="0">微博转发（每条）</option>
					<option value="1">微博直发（每条）</option>
					<option value="2">线下活动（每天）</option>
					<option value="3">平面拍摄（每张）</option>
					<option value="4">视频拍摄（每天）</option>
					<option value="5">活动主持（每场）</option>
				</select>
		     </div>
		     <div class="col-xs-4 col-sm-4 col-md-4" style="padding:0">
		     	<input type="text" class="form-control pull-left" style="width:80px;" id="money" placeholder="填写"><label class="right_label">元</label>
		     </div>
		     <div class="col-xs-3 col-sm-3 col-md-3" style="padding:0;margin-top:4px;">
		     	<a onclick="removeThisRow(this)" style="color:gray">删除</a>
		     </div>
	     </div>
	</div>
</body>
<script>
	function removeThisRow(row){
		$(row).parent().parent().remove();
	}
	
	var templateRow = $("#template").html();
	function addRow(){
		$("#mainDiv").append(templateRow);
	}
	
	var coserId = '<%=request.getParameter("id")%>';
	function submit(){
		if(!coserId){
			return;
		}
		var cooperationTypes = [];
		var cooperationTypeRows = $("[name=cooperationTypeRows]");
		cooperationTypeRows.each(function(index,element){
			var type = {
					cooperationType:$(this).find("#cooperationType").val(),
					money:$(this).find("#money").val()
			};
			cooperationTypes.push(type);
		});
		var experience = $("#experience").val();
		var description = $("#description").val();
		var data = {
				cnId:coserId,
				cooperation_type:JSON.stringify(cooperationTypes),
				experience:experience,
				description:description
		}
		$.ajax({
			url:contextPath+'/rest/cosers/update3',
			type:'POST',
			contentType:'application/json',
			data:JSON.stringify({coser:data}),
			success:function(ret){
				alert("提交成功")
			},
			error:function(ret){
				alert("信息保存失败");
			}
		})
	}
</script>
</html>