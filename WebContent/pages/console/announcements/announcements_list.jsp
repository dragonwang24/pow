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
</head>
<body style="margin:auto;padding-top:20px;">
	<div class="col-md-12">
	<a class="btn btn-success btn-xs" href="<%=contextPath %>/pages/announcements_publish.jsp"><i class="glyphicon glyphicon-pencil"></i> 新增通告</a>
	<table class="table table-hover">
         <thead>
             <tr>
                 <th> # </th>
                 <th> 厂商 </th>
                 <th> 标题 </th>
                 <th> 状态 </th>
                 <th> 当前报名人数 </th>
                 <th> 创建时间 </th>
                 <th> 操作 </th>
             </tr>
         </thead>
         <tbody id="rows">
             <!-- <tr>
                 <td> 1 </td>
                 <td> 腾讯科技公司 </td>
                 <td> 二次元春晚 </td>
                 <td>
                     <span class="label label-sm label-success"> 报名中 </span>
                 </td>
                 <td> 20 </td>
                 <td> 
                 	<a class="btn btn-success btn-xs" href="#"><i class="glyphicon glyphicon-pencil"></i> 编辑</a>
                 	<a class="btn btn-success btn-xs" href="#"><i class="glyphicon glyphicon-trash"></i> 删除</a>
                 </td>
             </tr> -->
         </tbody>
    	</table>
	</div>



	<script>
		var cooperationTypeArray = ['微博转发','微博直发','线下活动','平面拍摄','视频拍摄','活动主持'];
		var needPersonSexArray = ['男','女','不限'];
		
		var statusArray = ['报名中','报名已结束','活动进行中','通告结束'];
		var statusHtmlArray = [
		                       	'<span class="label label-sm label-success"> 报名中 </span>',
		                       	'<span class="label label-sm label-success"> 报名已结束 </span>',
		                       	'<span class="label label-sm label-success"> 活动进行中 </span>',
		                       	'<span class="label label-sm label-success"> 通告结束 </span>'];
	
		//var templateHtml = $("#template").html();
		initGrid();
		function initGrid(){
			$.ajax({
				url:contextPath+'/rest/announcements/list',
				type:'POST',
				dataType:'json',
				success:function(ret){
					if(ret && ret.length > 0){
						var totalHtml = [];
						for(var i = 0; i < ret.length; i++){
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
							var companyName = announcement.companyName;
							var status = announcement.status;
							var createTime = announcement.createTime;
							var signUpNum = announcement.signUpNum == 'null' ? 0:announcement.signUpNum;
							
							var btnTdHtml = '<a class="btn btn-success btn-xs" href="'+contextPath+'/pages/console/announcements/announcements_edit.jsp?id='+announcementId+'"><i class="glyphicon glyphicon-pencil" ></i> 编辑 </a>&nbsp;&nbsp;'+
				         	'<a id="'+announcementId+'" class="btn btn-success btn-xs" href="#" onclick="deleteRow(this)"><i class="glyphicon glyphicon-trash"></i> 删除 </a>';
							
							/* <tr>
			                 <td> 1 </td>
			                 <td> 腾讯科技公司 </td>
			                 <td> 二次元春晚 </td>
			                 <td>
			                     <span class="label label-sm label-success"> 报名中 </span>
			                 </td>
			                 <td> 20 </td>
			                 <td> 2016-01-18 </td>
			                 <td> 
			                 	<a class="btn btn-success btn-xs" href="#"><i class="glyphicon glyphicon-pencil"></i> 编辑</a>
			                 	<a class="btn btn-success btn-xs" href="#"><i class="glyphicon glyphicon-trash"></i> 删除</a>
			                 </td>
			             </tr> */
							
							var _trHtml = "<tr><td> "+(i+1)+" </td><td> "+companyName+" </td><td> "+title+" </td><td> "+statusHtmlArray[status]+
											" </td><td>"+signUpNum+"</td><td>"+createTime+"</td><td>"+btnTdHtml+"</td></tr>";
							
							totalHtml.push(_trHtml);
						}
						$("#rows").html(totalHtml);
					}
				}
			});
		}
		
		function deleteRow(_row){
			var r=confirm("确定要删除该通告吗？");
			if(r == true){
				var announcementId = _row.id;
				alert(announcementId);
				if(announcementId){
					$.ajax({
						url:contextPath+'/rest/announcements/delete/'+announcementId,
						type:'POST',
						success:function(ret){
							alert("删除成功");
							initGrid();
						}
					});
				}
			}
		}
		
		function showDetail(_row){
			var announcementId = _row.id;
			if(announcementId){
				window.location.href=contextPath+"/pages/announcements/announcements_detail.jsp?id="+announcementId;
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