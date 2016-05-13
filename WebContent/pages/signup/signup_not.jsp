<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<%@include file="/pages/common/common.jsp" %>
	<link href="<%=contextPath %>/pages/signup/signup_not.css" rel="stylesheet">
  	<title>提交成功</title>
</head>
<body style="margin:auto;background: #1B1B1B">
<div class="center top" style="text-align:center">

    <img src="<%=contextPath %>/pages/images/godown_not/03.png" style="width:50%"/>
    <!--<span class="font">啊哦，你还没有加入我们</span>-->

    <div class="top2">
        <img src="<%=contextPath %>/pages/images/godown_not/notjoin.gif" class="width50"/>
    </div>
 <button type="button" class="join" style="width:80%" onclick="join()">
        立即加入
    </button>
	<!-- <div class="col-xs-12 col-sm-12 col-md-12">
    <button type="button" class="col-xs-10 col-sm-10 col-md-10 join" onclick="join()">
        立即加入
    </button>
    </div> -->
    <!-- <div class="col-xs-12 col-sm-12 col-md-12" style="padding-top:50px;text-align:center">
		<a type="button" class="btn btn_warning col-xs-12 col-sm-12 col-md-12" onclick="doNext()" style="padding: 5px 30px; background:#fece07;color: #ffffff;font-size: 18px; font-weight: bold;">立即加入</a>
	</div> -->
    
</div>
</body>
</html>