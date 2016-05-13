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
</head>
<body style="margin:auto;padding-top:10px;background: #F2F2F2">
	<div class="col-xs-12 col-sm-12 col-md-12">
		<div style="text-align:center;background:#1b1b1b;padding:30px 0px;">
			<span id="title" style="color:#ffc107;font-size:18px;">加入成功，进一步完善信息吧！</span>
		</div>
		<div style="background:#ffffff;height:500px;padding:30px 10px;">
			<div class="row">
				<div class="col-xs-2 col-sm-2 col-md-2" style="max-width:50px;">
					<img src="<%=contextPath%>/pages/images/perfect_info1/57.png" style="width:30px;">
				</div>
				<div class="col-xs-10 col-sm-10 col-md-10">
					<input type="text" class="form-control" id="cnName" placeholder="CN">
				</div>
			</div>
			<p class="col-xs-12 col-sm-12 col-md-12" style="border:1px solid #eee;margin:10px 0px;"></p>
			<div class="row" style="padding-top:15px;">
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
			<div class="row" style="padding-top:15px;">
				<div class="col-xs-2 col-sm-2 col-md-2" style="max-width:50px;">
					<img src="<%=contextPath%>/pages/images/perfect_info1/59.png" style="width:30px;">
				</div>
				<div class="col-xs-10 col-sm-10 col-md-10">
					<input type="text" class="form-control" id="birthday" placeholder="请填写生日yyyy-MM-dd">
				</div>
			</div>
			<div class="row" style="padding-top:15px;">
				<div class="col-xs-2 col-sm-2 col-md-2" style="max-width:50px;">
					<img src="<%=contextPath%>/pages/images/perfect_info1/60.png" style="width:30px;">
				</div>
				<div class="col-xs-10 col-sm-10 col-md-10">
					<input type="text" class="form-control" id="location" placeholder="请填写所在市县">
				</div>
			</div>
			<div class="row" style="padding-top:15px;">
				<div class="col-xs-2 col-sm-2 col-md-2" style="max-width:50px;">
					<img src="<%=contextPath%>/pages/images/perfect_info1/61.png" style="width:30px;">
				</div>
				<div class="col-xs-10 col-sm-10 col-md-10">
					<input type="text" class="form-control" id="weiboName" placeholder="微博昵称（选填）">
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-12" style="padding-top:50px;text-align:center">
				<a type="button" class="btn btn_warning" onclick="doNext()" style="padding: 5px 30px; background:#1b1b1b;width: 200px;color: #ffffff;font-size: 18px; font-weight: bold;">下一步</a>
			</div>
		</div>
	</div>
</body>
<script>
	function doNext(){
		var birthday = $("#birthday").val();
		var location = $("#location").val();
		var weiboName = $("#weiboName").val();
		var cnName = $("#cnName").val();
		var sex = $("input[name=sex]:checked").val();
		var coser = {
			birthday:birthday,
			location:location,
			weiboName:weiboName,
			cnName:cnName,
			sex:sex
		}
		$.ajax({
			url:contextPath+'/rest/cosers/create',
			type:'POST',
			contentType:'application/json',
			data:JSON.stringify({coser:coser}),
			success:function(ret){
				if(ret && ret.cnId){
					window.location.href=contextPath+"/pages/console/coser/coser_new3.jsp?id="+ret.cnId;
				}
			},
			error:function(ret){
				alert("信息保存失败");
			}
		})
		
	}
</script>
</html>