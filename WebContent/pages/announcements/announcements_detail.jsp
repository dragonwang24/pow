<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<%@include file="/pages/common/common.jsp" %>
  	<title>通告详情</title>
  	<style>
  		.nav .col-xs-3, .nav .col-sm-3{
  			padding-left:0px;
  			padding-right:0px;
  			
  		}
  		#tab_1_3 .col-xs-6{
  			padding-left:0px;
  			padding-right:0px;
  		}
  		.nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover{
  			background-color:#535353;
  		}
  		.nav-pills>li{
  			/* border-right:1px solid #eee;	
  			border-top:1px solid #eee;	 */
  			border-bottom:1px solid #eee;	
  		}
  		.nav>li>a {
		    position: relative;
		    display: block;
		    padding: 10px 10px;
		    background-color: #dbdbdb;
		    color:#ffffff;
		}
		.nav>li>a:focus, .nav>li>a:hover{
			background-color: #dbdbdb;
		}
		.nav>li {
		    text-align:center
		}
  		.nav-pills>li+li{
  			margin-left:0px;
  		}
  		.nav-pills>li>a {
		    border-radius: 0px;
		}
		.llabel{
			/* font-family: 'SimSun', '宋体';
		    font-weight: 400;
		    font-style: normal;
		    font-size: 12px; */
		    color: #626262;
		}
		.lvalue{
		    font-family: 'ArialMT', 'Arial';
		    color: #313131;
		    text-align: left;
		}
		.thumbnail .lvalue{
			font-size: 13px;
		}
		.thumbnail{
			border:0px;
		}
		.row{
			margin-top: 10px;
			margin-right: 0px;
    		margin-left: 0px;
		}
  		.amlImg{
  			width:13px;
  			margin-bottom: 3px;
  		}
  		.sexImg{
  			height:13px;
  			margin-bottom: 3px;
  		}
  		.tabDiv{
  			padding-top:110px;
  			margin-left:-7p;
  			margin-right:-7px;
  		}
  	</style>
</head>
<body data-spy="scroll" data-target="#myScrollspy">
	<div class="col-xs-12 col-sm-12 div_col_12" id="myScrollspy" data-spy="affix" style="z-index:1999;padding:0px;background:#f2f2f2">
		<div style="text-align:center;background:#1b1b1b;padding:10px 0px;">
			<span id="title" style="color:#ffc107;font-size:18px;">通告</span>
		</div>
	  	<ul class="nav nav-pills" >
			<li class="col-xs-3 col-sm-3">
				<a href="#tab_1_1" >
				通告详情 </a>
			</li>
			<li class="col-xs-3 col-sm-3">
				<a href="#tab_1_2" onclick="test()">
				角色介绍 </a>
			</li>
			<li class="col-xs-3 col-sm-3">
				<a href="#tab_1_3" >
				相关作品 </a>
			</li>
			<li class="col-xs-3 col-sm-3">
				<a href="#tab_1_4" >
				项目背景 </a>
			</li>
		</ul>
	</div>
	<div class="tab-content" style="padding-left:10px;padding-right:10px;">
		<div class="tabDiv active in" id="tab_1_1">
			<div class="col-xs-12 col-sm-12 div_col_12" style="padding-left:0px !important;padding-right:0px !important;text-align:center;padding-bottom:10px;">
           		<img id="logoFile" src="" style="max-width:100%;"/>
       		</div>
       		<div class="row center-block" style="padding-top:20px;">
				<div class="col-xs-12 col-sm-12" style="text-align:left;padding-left:3px;margin-top: 1px;">
					发布方：<span class="lvalue" id="companyName">英雄联盟【腾讯科技股份有限公司】</span>
				</div>
				<p class="col-xs-12 col-sm-12 col-md-12" style="border:1px solid #eee; margin-top: 5px; margin-bottom: 5px;"></p>
				<div class="col-xs-12 col-sm-12" style="text-align:left;padding-left:3px;margin-top: 1px;">
					合作需求：<span class="lvalue" id="cooperationType">平面拍摄</span>
				</div>
				<p class="col-xs-12 col-sm-12 col-md-12" style="border:1px solid #eee; margin-top: 5px; margin-bottom:0px"></p>
				<div class="col-xs-6 col-sm-6" style="text-align:left;padding-left:3px;padding-right:0px;margin-top: 0px;padding-top:5px;padding-bottom:5px;border-right:1px solid #eee;">
					活动时间：<span class="lvalue" id="activityTime">12/30 - 12/31</span>
				</div>
				<div class="col-xs-6 col-sm-6" style="text-align:left;padding-left:3px;padding-right:0px;margin-top: 0px;padding-top:5px;padding-bottom:5px;">
					报名时间：<span class="lvalue" id="signUpTime">12/30 - 12/31</span>
				</div>
				<p class="col-xs-12 col-sm-12 col-md-12" style="border:1px solid #eee; margin-bottom:0px"></p>
				<div class="col-xs-3 col-sm-3" style="padding:5px 0px;border-right: 1px solid #eee;text-align:center">
               		<img src="<%=contextPath %>/pages/announcements/images/list/2.png" class="amlImg"/>
               		<span class="lvalue" id="needPersonNum"></span>
           		</div>
           		<div class="col-xs-6 col-sm-6" style="padding:5px 0px;border-right: 1px solid #eee;text-align:center">
               		<img src="<%=contextPath %>/pages/announcements/images/list/3.png" class="amlImg"/>
               		<span class="lvalue" id="activityLocation"></span>
           		</div>
                <div class="col-xs-3 col-sm-3" style="padding:5px 0px;text-align:center">
                    <img src="<%=contextPath %>/pages/announcements/images/list/4.png" class="sexImg"/>
                    <span class="lvalue" id="needPersonSex"></span>
                </div>
				<p class="col-xs-12 col-sm-12 col-md-12" style="border:1px solid #eee; margin-bottom:0px"></p>
                <span class="col-xs-12 col-sm-12 lvalue" id="content" class="lvalue" style="padding-top:10px;">
					这里是详情内容这里是详情内容这里是详情内容这里是
				</span>
				<!-- <div class="col-xs-12 col-sm-12" style="text-align:center;padding-top:20px;">
				    <button type="button" class="btn btn-success">邀请小伙伴来报名</button>
				</div> -->
				<div class="col-xs-12 col-sm-12 col-md-12" style="padding:20px 50px 0px 50px;text-align:center">
					<a type="button" class="" onclick="signup()" style="padding: 5px 20px;background: #39b9c2;color: #ffffff;font-size: 16px;/text-decoration: inherit;border-radius: 5px;">邀请小伙伴来报名</a>
				</div>
			</div>
		</div>
		<div class="tabDiv" id="tab_1_2" >
			<ul id="roleTemplate" style="display:none">
				<li class="media" style="margin-left:0px;margin-right:0px;padding-right:10px;padding-top:10px;padding-bottom: 10px;
					background: url('<%=contextPath %>/pages/announcements/images/u17.png');
				  	background-repeat: no-repeat;background-size: 100% 100%;">
					<a class="col-xs-7 col-sm-7" style="padding-left:0px;padding-right:0px;" href="#">
						{imageFile}
					</a>
					<div class="media-body" style="border-left: 1px solid #eee;padding: 0px;background: #eeeeee;">
		      			<div class="col-xs-12 col-sm-12 div_col_12" style="padding-left:0px !important;padding-right:0px !important;">
			      			<div class="col-xs-12 col-sm-12" style="text-align:left;padding-left:3px;padding-right:0px;margin-top: 1px;border-bottom:1px solid #ffffff">
								<span class="llabel">角色:</span><span class="lvalue">{name}</span>
							</div>
			      			<p class="col-xs-12 col-sm-12 div_col_12" style="border:1px dashed #eee"></p>
			      			<div class="col-xs-12 col-sm-12" style="text-align:left;padding-left:3px;padding-right:0px;margin-top: 1px;">
								<span class="llabel">介绍:</span><span class="lvalue">{description}</span>
							</div>
		      			</div>
		     		</div>
		   		</li>
			</ul>
			<div class="col-xs-12 col-sm-12 " style="text-align:center;padding-left:0px;padding-right:0px;">
			    <img src="<%=contextPath %>/pages/announcements/images/detail/circle.png" style="margin-left:-7px;margin-top:-4px;height:12px;"/>
			    <span style="font-size:16px;font-weight:500px">角色介绍</span>
			    <p class="col-xs-12 col-sm-12 col-md-12" style="border-bottom:1px solid #eee; margin:15px 0px"></p>
			</div>
			<ul class="media-list" id="roleList" style="padding-top:15px;">
			</ul>
		</div>  
		<div class="tabDiv" id="tab_1_3">
			<div class="col-xs-12 col-sm-12 " style="text-align:center;padding-left:0px;padding-right:0px;">
			    <img src="<%=contextPath %>/pages/announcements/images/detail/circle.png" style="margin-left:-7px;margin-top:-4px;height:12px;"/>
			    <span style="font-size:16px;font-weight:500px">产品以往作品介绍</span>
			    <p class="col-xs-12 col-sm-12 col-md-12" style="border-bottom:1px solid #eee; margin:15px 0px"></p>
			</div>
			<div class="row center-block" id="worksRow" style="margin-right: 0px; margin-left: 0px; ">
			</div>
		</div>
		<div class="tabDiv" style="padding-bottom:100px;margin-bottom:400px"  id="tab_1_4">
			<div class="col-xs-12 col-sm-12 " style="text-align:center;padding-left:0px;padding-right:0px;">
			    <img src="<%=contextPath %>/pages/announcements/images/detail/circle.png" style="margin-left:-7px;margin-top:-4px;height:12px;"/>
			    <span style="font-size:16px;font-weight:500px">项目背景介绍</span>
			    <p class="col-xs-12 col-sm-12 col-md-12" style="border-bottom:1px solid #eee; margin:15px 0px"></p>
			</div>
			<div class=" col-xs-12 col-sm-12" id="background" style="overflow:scroll">
			</div>
		</div>
	</div>
	<div id="footer" class="container">
			<nav class="navbar navbar-default navbar-fixed-bottom">
			    <div class="navbar-inner navbar-content-center">
			        <div class="col-xs-12 col-sm-12" style="text-align:center;padding:10px;">
							    <!-- <button type="button" style="background:red;border-color:red;font-size:18px;" class="btn btn-success">报名即将开启</button> -->
							    <button type="button" onclick="signup()" style="background:red;border-color:red;font-size:18px;" class="btn btn-success">立即报名</button>
					</div>
			    </div>
		</nav>
	</div>
	<div id="worksTemplate" style="display:none">
			<div class="col-xs-6 col-sm-6 col-md-4" style="padding:0px">
			    <div class="thumbnail">
			    	<div style="width:100%;height:180px;background: #eeeeee;">
			    	{imageFile}
			    	</div>
			      		<div style="width:100%;background: #eeeeee;padding:0px" class="col-xs-12 col-sm-12 col-md-4">
			        		<p style="margin:0px"><span class="llabel">角色名：</span><span class="lvalue">{roleName}</span></p>
			        		<p style="margin:0px"><span class="llabel">CN：</span><span class="lvalue">{CN}</span></p>
			      		</div>
			    	</div>
				</div>
			</div>
	<script>
	
		var cooperationTypeArray = ['微博转发','微博直发','线下活动','平面拍摄','视频拍摄','活动主持'];
		var needPersonSexArray = ['男','女','不限'];
		
		var cnid = '<%=request.getParameter("cnid")%>';
		
		var announcementId = '<%=request.getParameter("id")%>';
		$(function(){
			
			if(announcementId && announcementId != 'null'){
				$.ajax({
					url:contextPath+'/rest/announcements/'+announcementId,
					type:'POST',
					dataType:'json',
					success:function(announcement){
						if(announcement){
							var roles = announcement.roles;
							var workses = announcement.workses;
							
							renderRoles(roles);
							renderWorkses(workses);
							
							$("#title").html(announcement.title);
							
							var logoPath = announcement.logoPath;
							if(logoPath){
								$("#logoFile").attr("src",contextPath+logoPath);
							}
							
							$("#companyName").html(announcement.companyName);
							$("#activityLocation").html(announcement.activityLocation);
							$("#cooperationType").html(cooperationTypeArray[announcement.cooperationType]);
							$("#needPersonSex").html(needPersonSexArray[announcement.needPersonSex]);
							$("#needPersonNum").html(announcement.needPersonNum);
							
							var activityStartTime = announcement.activityStartTime;
							var activityEndTime = announcement.activityEndTime;
							var signUpStartTime = announcement.signUpStartTime;
							var signUpEndTime = announcement.signUpEndTime;
							
							$("#signUpTime").html(getTimeRange(signUpStartTime,signUpEndTime));
							$("#activityTime").html(getTimeRange(activityStartTime,activityEndTime));
							
							$("#content").html(announcement.content);
							
							$("#background").html(announcement.activityBackground);
							
						}
					}
				});
			}
		});
		
		function renderRoles(roles){
			if(roles && roles.length){
				var rolesHtml = [];
				for(var i = 0 ; i < roles.length; i++){
					var role = roles[i];
					var name = role.name;
					var description = role.description;
					var imagePath = role.imagePath;
					if(!imagePath){
						imagePath = "/pages/announcements/images/detail/u151.png";
					}
					imagePath = contextPath + imagePath;
					var templateHtml = $("#roleTemplate").html();
					
					var imageFileHtml = '<img class="media-object" style="max-width: 100%;max-height: 180px;margin: auto;" src="'+imagePath+'" >';
					
					templateHtml = templateHtml.replace(/{name}/,name).replace(/{description}/,description).replace(/{imageFile}/,imageFileHtml);
					
					rolesHtml.push(templateHtml);
				}
				$("#roleList").html(rolesHtml);
			}
		}
		
		function renderWorkses(workses){
			if(workses && workses.length){
				var worksesHtml = [];
				for(var i = 0; i < workses.length;  i++){
					var works = workses[i];
					var roleName = works.roleName;
					var cn = works.cn;
					var imagePath = works.imagePath;
					if(!imagePath){
						imagePath = "/pages/announcements/images/detail/u151.png";
					}
					imagePath = contextPath + imagePath;
					
					var templateHtml = $("#worksTemplate").html();
					
					var imageFileHtml = '<img style="max-width: 100%;max-height: 180px;margin: auto;" src="'+imagePath+'">';
					
					templateHtml = templateHtml.replace(/{roleName}/,roleName).replace(/{CN}/,cn).replace(/{imageFile}/,imageFileHtml);
					worksesHtml.push(templateHtml);
					
				}
				$("#worksRow").html(worksesHtml);
			}
		}
		
		function getTimeRange(startTime, endTime){
			if(!startTime || !endTime){
				return '未知时间';
			}
			return getMonthAndDay(startTime)+"-"+getMonthAndDay(endTime);
		}
		
		function getMonthAndDay(time){
			var arr = time.split(" ");
			if(arr && arr.length > 0){
				var nArr = arr[0].split("-");
				if(nArr && nArr.length == 3){
					return nArr[1] + "/" + nArr[2];
				}
			}
			return "";
		}
		
		function signup(){
			if(!cnid || cnid == 'null' || cnid=='undefined'){
				window.location.href=contextPath+"/pages/signup/signup_not.jsp";
			}
			$.ajax({
				url:contextPath+'/rest/cosers/signup/'+announcementId,
				type:'POST',
				contentType:'application/json',
				data:JSON.stringify({coserId:cnid}),
				success:function(ret){
					if(ret){
						var isPerfect = true;
						for (var key in ret) { 
				        	if(!ret[key] && typeof(ret[key])!="undefined" && ret[key]!=0){
				        		isPerfect = false;
				        		break;
				        	} 
				       	}
						if(isPerfect){
							window.location.href=contextPath+"/pages/signup/signup_perfect.jsp?cnid="+cnid+"&title="+$("#title").html();
						}else{
			        		window.location.href=contextPath+"/pages/signup/signup_not_perfect.jsp?cnid="+cnid;
						}
					}
				}
			})
		}
	</script>
</body>
</html>