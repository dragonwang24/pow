<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<%@include file="/pages/common/common.jsp" %>
	<link href="<%=contextPath %>/resources/font-awesome-3.0.2/css/font-awesome.css" rel="stylesheet">

<link href="<%=contextPath %>/resources/bootstrap-combined.no-icons.min.css" rel="stylesheet">
<link href="<%=contextPath %>/resources/bootstrap-responsive.min.css" rel="stylesheet">
  	<title>通告发布</title>
</head>
<body style="width:100%;margin:auto;padding-top:20px;/* background:#D1DAD1 */">
	<div class="col-sm-12 col-xs-12 col-md-12">
  	<form class="form-horizontal" role="form" id="announcementForm">
				<input class="form-control" name="id" type="hidden" >
				<input id="logoPath" name="logoPath" class="form-control" type="hidden" />
			   <div class="form-group">
			      <label class="col-sm-2 control-label">标题</label>
			      <div class="col-sm-8">
			         <input class="form-control" name="title" type="text" >
			      </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label">项目LOGO</label>
			      <div class="col-sm-8">
						<input id="logoFile" type="file" name="uploadedFile" multiple="true" class="file-loading">
			      </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label">公司名称</label>
			      <div class="col-sm-8">
						<input class="form-control" name="companyName" type="text" />
			      </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label">合作类型</label>
			      <div class="col-sm-8">
						<select name="cooperationType" class="form-control">
							<option value="0">微博转发</option>
							<option value="1">微博直发</option>
							<option value="2">线下活动</option>
							<option value="3">平面拍摄</option>
							<option value="4">视频拍摄</option>
							<option value="5">活动主持</option>
						</select>
			      </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label">报名时间</label>
			      <div class="col-sm-8">
						<div class="input-group">
							<input type="text" id="signupTime" class="form-control" />
							<input type="hidden" id="signUpStartTime" name="signUpStartTime" class="form-control">
							<input type="hidden" id="signUpEndTime" name="signUpEndTime" class="form-control">
							<span class="input-group-addon input-circle-left">
							<i class="glyphicon glyphicon-calendar fa fa-calendar"></i>	
							</span>
						</div>
			      </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label">活动时间</label>
			      <div class="col-sm-8">
						<div class="input-group">
							<input type="text" id="activityTime" class="form-control">
							<input type="hidden" id="activityStartTime" name="activityStartTime" class="form-control">
							<input type="hidden" id="activityEndTime" name="activityEndTime" class="form-control">
							<span class="input-group-addon input-circle-left">
							<i class="glyphicon glyphicon-calendar fa fa-calendar"></i>	
							</span>
						</div>
			      </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label">活动地点</label>
			      <div class="col-sm-8">
						<input class="form-control" name="activityLocation" type="text" />
			      </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label">COSER数量</label>
			      <div class="col-sm-8">
						<input class="form-control" name="needPersonNum" type="text" />
			      </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label">COSER性别</label>
			      <div class="col-sm-8">
						<select name="needPersonSex" class="form-control">
							<option value="0">男</option>
							<option value="1">女</option>
							<option value="2">男/女</option>
						</select>
			      </div>
			   </div>
			   <div class="form-group">
			      <label class="col-sm-2 control-label">详细信息</label>
			      <div class="col-sm-8">
						<textarea class="form-control" name="content" rows="10"></textarea>
			      </div>
			   </div>
			</form>
			</div>
	<script type="text/javascript" src="<%=contextPath %>/pages/js/test.js"></script>
</body>
</html>