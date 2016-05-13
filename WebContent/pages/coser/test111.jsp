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
<body style="width:80%;margin:auto;padding-top:20px;/* background:#D1DAD1 */">
  	<ul class="nav nav-tabs" style="">
		<li class="active">
			<a href="#tab_1_1" data-toggle="tab">
			通告详情 </a>
		</li>
		<li>
			<a href="#tab_1_2" data-toggle="tab">
			角色介绍 </a>
		</li>
		<li>
			<a href="#tab_1_3" data-toggle="tab">
			相关作品 </a>
		</li>
		<li>
			<a href="#tab_1_4" data-toggle="tab">
			游戏背景 </a>
		</li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane fade active in" id="tab_1_1">
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
						<input id="logoFile" type="file" name="uploadedFile" class="file-loading">
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
						<!-- <textarea class="form-control" name="content" rows="10"></textarea> -->
						<div id="contentEditor" class="form-control" style="height:120px;" ></div>
			      </div>
			   </div>
			</form>
		</div>
		<div class="tab-pane fade" id="tab_1_2">
			<input type="button" class="btn btn-success" value="新增角色" onclick="addRoleHtml()">
			<div id="roleDiv">
				<fieldset>
					<legend>角色</legend>
					<form class="form-horizontal" role="form" id="roleForm" name="roleForm">
						<input class="form-control" name="id" type="hidden" >
						<input class="form-control" name="announcementId" type="hidden" >
						<div class="form-group">
							<div class="col-sm-4">
						   		<input id="roleImage" name="uploadedFile" type="file" class="file-loading">
								<input id="imagePath" name="imagePath" class="form-control" type="hidden" />
						   	</div>
						   	<div class="col-sm-8">
						   		<div class="form-group">
						     		<label class="col-sm-2 control-label">角色名称</label>
						     		<div class="col-sm-8">
						        		<input class="form-control" name="name" type="text" >
						     		</div>
						  		</div>
						  		<div class="form-group">
						     		<label class="col-sm-2 control-label">职业</label>
						     		<div class="col-sm-8">
										<input class="form-control" name="career" type="text" />
						     		</div>
						  		</div>
						  		<div class="form-group">
						     		<label class="col-sm-2 control-label">描述</label>
						     		<div class="col-sm-8">
										<textarea class="form-control" name="description" rows="10"></textarea>
						     		</div>
						  		</div>
						   	</div>
						</div>
					</form>
			   </fieldset>
		   </div>
		</div>  
		<div class="tab-pane fade" id="tab_1_3">
			<input type="button" class="btn btn-success" value="新增作品" onclick="addWorksHtml()">
			<div id="worksDiv">
				<fieldset>
					<legend>作品</legend>
					<form class="form-horizontal" role="form" id="worksForm" name="worksForm">
						<input class="form-control" name="id" type="hidden" >
						<input class="form-control" name="announcementId" type="hidden" >
						<div class="form-group">
							<div class="col-sm-4">
						   		<input id="worksImage" name="uploadedFile" type="file" class="file-loading">
								<input id="imagePath" name="imagePath" class="form-control" type="hidden" />
						   	</div>
						   	<div class="col-sm-8">
						   		<div class="form-group">
						     		<label class="col-sm-2 control-label">角色名称</label>
						     		<div class="col-sm-8">
						        		<input class="form-control" name="roleName" type="text" >
						     		</div>
						  		</div>
						  		<div class="form-group">
						     		<label class="col-sm-2 control-label">CN</label>
						     		<div class="col-sm-8">
										<input class="form-control" name="cn" type="text" />
						     		</div>
						  		</div>
						  		<div class="form-group">
						     		<label class="col-sm-2 control-label">描述</label>
						     		<div class="col-sm-8">
										<textarea class="form-control" name="description" rows="10"></textarea>
						     		</div>
						  		</div>
						   	</div>
						</div>
					</form>
			   </fieldset>
		   </div>
		</div>
		<div class="tab-pane fade" id="tab_1_4">
			<div id="alerts"></div>
		    <div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
		      <div class="btn-group">
		        <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="icon-font"></i><b class="caret"></b></a>
		          <ul class="dropdown-menu">
		          </ul>
		        </div>
		      <div class="btn-group">
		        <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="icon-text-height"></i>&nbsp;<b class="caret"></b></a>
		          <ul class="dropdown-menu">
		          <li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
		          <li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
		          <li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
		          </ul>
		      </div>
		      <div class="btn-group">
		        <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="icon-bold"></i></a>
		        <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>
		        <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="icon-strikethrough"></i></a>
		        <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="icon-underline"></i></a>
		      </div>
		      <div class="btn-group">
		        <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="icon-list-ul"></i></a>
		        <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="icon-list-ol"></i></a>
		        <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="icon-indent-left"></i></a>
		        <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="icon-indent-right"></i></a>
		      </div>
		      <div class="btn-group">
		        <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>
		        <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>
		        <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>
		        <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
		      </div>
		      <!-- <div class="btn-group">
				  <a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="icon-link"></i></a>
				    <div class="dropdown-menu input-append">
					    <input class="span2" placeholder="URL" type="text" data-edit="createLink"/>
					    <button class="btn" type="button">Add</button>
		        </div>
		        <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="icon-cut"></i></a>
		
		      </div> -->
		      
		      <div class="btn-group">
		        <a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="icon-picture"></i></a>
		        <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
		      </div>
		      <div class="btn-group">
		        <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a>
		        <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
		      </div>
		      <input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="">
		    </div>
			<div id="editor"></div>
		</div>
	</div>
	
	<div style="text-align:center">
		<input type="button" class="btn btn-success" value="更新通告" onclick="update()">
		<!-- <input type="button" class="btn btn-success" value="重置信息"> -->
	</div>
	<script>
	var announcementId = '<%=request.getParameter("id")%>';
	</script>
	<script type="text/javascript" src="<%=contextPath %>/pages/js/announcement_publish.js"></script>
	<script type="text/javascript" >
	/* $(function(){
		
		if(announcementId && announcementId != 'null'){
			$.ajax({
				url:contextPath+'/rest/announcements/'+announcementId,
				type:'POST',
				dataType:'json',
				success:function(announcement){
					if(announcement){
						var roles = announcement.roles;
						var workses = announcement.workses;
						
						setRolesData(roles);
						setWorksesData(workses);
						
						var formHelper = new FormHelper("announcementForm");
						formHelper.setData(announcement);
						
						$('#editor').html(announcement.activityBackground);
					}
				}
			});
		}
	}); */
	</script>
</body>
</html>