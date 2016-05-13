<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<%@include file="/pages/common/common.jsp" %>
  	<title>通告列表</title>
  	<style>
  		.amlImg{
  			width:13px;
  			margin-bottom: 3px;
  		}
  		.sexImg{
  			height:13px;
  			margin-bottom: 3px;
  		}
  		.little{
  			font-size:13px;
  			color:#959595;
  		}
  	</style>
</head>
<body style="margin:auto;padding-top:20px;background: #F2F2F2">
	<ul id="template" style="display:none;" >
		<li class="media" style="margin-left:10px;margin-right:10px;padding-right:10px;padding-top:10px;padding-bottom: 10px;
			background: url('<%=contextPath %>/pages/announcements/images/u17.png');
		  	background-repeat: no-repeat;background-size: 100% 100%;"  id="{announcementId}"  onclick="showDetail(this)">
			<a class="col-xs-4 col-sm-4" style="padding-left:0px;padding-right:0px;margin-right:-8px;" href="#">
				<label class="label-for font_white" style="width: 45px;color: #fff; font-size: 9px;
			     	background: url('<%=contextPath %>/pages/announcements/images/list/17.png');
			     	background-repeat: no-repeat;background-size: 100% 100%;text-align:center">{cooperationType}
			    	<!-- <span class="lf" style="color: #fff; font-size: 9px;"></span> -->
			    </label>
			    {logoImage}
			</a>
			<div class="media-body" style="border-left: 1px solid #eee;padding-left: 5px;padding-top:10px;">
      			<div class="col-xs-12 col-sm-12 div_col_12" style="padding-left:0px !important;padding-right:0px !important;">
	      			<p style="font-size:20px;color:#313131">{title}</p>
	      			<div class="col-xs-6 col-sm-6 div_col_6" style="padding-bottom:3px;padding-left:0px !important;padding-right:0px !important;border-right: 1px solid #eee;">
                		<img src="<%=contextPath %>/pages/announcements/images/list/19.png" class="amlImg"/>
                		<span class="little">{time}</span>
            		</div>
               		<div class="col-xs-6 col-sm-6" style="padding-bottom:10px;padding-left:3px;padding-right:0px !important;">
	            		<div class="col-xs-5 col-sm-5" style="padding-bottom:3px;padding-left:0px !important;padding-right:0px !important;border-right: 1px solid #eee;">
	                   		<img src="<%=contextPath %>/pages/announcements/images/list/2.png" class="amlImg"/>
	                   		<span class="little">{needPersonNum}</span>
	               		</div>
		                <div class="col-xs-7 col-sm-7" style="padding-bottom:10px;padding-left:3px;padding-right:0px !important;">
		                    <img src="<%=contextPath %>/pages/announcements/images/list/4.png" class="sexImg"/>
		                    <span class="little">{needPersonSex}</span>
		                </div>
	                </div>
               		<!-- <p class="col-xs-12 col-sm-12 div_col_12" style="border:1px solid #eee"></p> -->
               		<div class="col-xs-8 col-sm-8 top3" style="padding-left:0px !important;padding-right:0px !important;">
                    		<img src="<%=contextPath %>/pages/announcements/images/list/3.png" class="amlImg"/>
                    		<span class="little">{activityLocation}</span>
                		</div>
	                <div class="col-xs-4 col-sm-4 top3 pull-right" style="max-width:80px;padding-left:0px !important;padding-right:0px !important;text-align: center;">
	                	<a class="aDetail" style="font-size: 14px;text-decoration:none;color:#313131;float:left">查看详情</a>
	                	<a style="font-family: 'SimSun', '宋体';font-size: 14px;">></a>
	                </div>
      			</div>
     		</div>
   		</li>
   	</ul>
	<ul class="media-list" id="announcementList">
	</ul>
	<script>

		var code = '<%=request.getParameter("code")%>';
		var cnid = "";
		if(code != null){
			$.ajax({
				url:contextPath+'/rest/weixin/login',
				type:'POST',
				contentType:'application/json',
				data:JSON.stringify({code:code}),
				dataType:'json',
				success:function(ret){
					if(ret){
						cnid = ret.openid;
					}
				}
			})	
		}
	
		var cooperationTypeArray = ['微博转发','微博直发','线下活动','平面拍摄','视频拍摄','活动主持'];
		var needPersonSexArray = ['男','女','不限'];
	
		//var templateHtml = $("#template").html();
		
		$.ajax({
			url:contextPath+'/rest/announcements/list',
			type:'POST',
			dataType:'json',
			success:function(ret){
				if(ret && ret.length > 0){
					var totalHtml = [];
					for(var i = 0; i < ret.length; i++){
						var templateHtml = $("#template").html();
						var announcement = ret[i];
						var title = announcement.title;
						var startTime = announcement.activityStartTime;
						var endTime = announcement.activityEndTime;
						var time = getTimeRange(startTime, endTime);
						var cooperationType = announcement.cooperationType;
						var activityLocation = announcement.activityLocation;
						var needPersonNum = announcement.needPersonNum;
						var needPersonSex = announcement.needPersonSex;
						var logoPath = announcement.logoPath;
						if(!logoPath){
							logoPath = "/pages/announcements/images/u23.png";
						}
						logoPath = contextPath + logoPath;
						
						var logoImageHtml = '<img class="media-object" style="max-width: 90%;max-height: 80px;margin: auto;" src="'+logoPath+'" >'
						
						var announcementId = announcement.id;
						
						templateHtml = templateHtml.replace(/{announcementId}/,announcementId).replace(/{logoImage}/,logoImageHtml).replace(/{time}/,time).replace(/{title}/,title).replace(/{cooperationType}/,cooperationTypeArray[cooperationType]).replace(/{activityLocation}/,activityLocation).replace(/{needPersonNum}/,needPersonNum).replace(/{needPersonSex}/,needPersonSexArray[needPersonSex]);
						
						totalHtml.push(templateHtml);
					}
					$("#announcementList").html(totalHtml);
				}
			}
		});
		
		function showDetail(_row){
			var announcementId = _row.id;
			if(announcementId){
				window.location.href=contextPath+"/pages/announcements/announcements_detail.jsp?id="+announcementId+"&cnid="+cnid;
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
	</script>
	
</body>
</html>