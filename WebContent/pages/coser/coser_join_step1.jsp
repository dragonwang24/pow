<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<%@include file="/pages/common/common.jsp" %>
	<link href="<%=contextPath %>/pages/coser/coser_join_step1.css" rel="stylesheet">
  	<title>加入狍圈</title>
</head>
<body style="background-color: #fece07;height:100%;width:100%;">
	<div class="center4">
	    <img id="headimgurl" src="" class="img23"/>
	    <div id="nickname" class="font10" style="padding-top:10px"></div>
	</div>
	
	<div class="container" style="margin-left:1rem;margin-right:1rem;">
    <div class="row">
        <div class="col-xs-12 col-sm-12 center5">
            <input class="input3" type="tel" placeholder="输入手机号码"  id="phone" required/>
        </div>
        <div class="col-xs-12 col-sm-12 center">
            <div class="col-xs-6 col-sm-6 div_col_6" style="padding:0px;">
                <input type="tel" id="securityCode" class="input4" />
            </div>
            <div class="col-xs-4 col-sm-4 div_col_44" style="padding:0px">
                <input type="button" class="btn_send" id="btn1" value="获取验证码" onclick="getSecurityCode()" />
            </div>
        </div>
        <div id="warningText" class="col-xs-12 col-sm-12 center" style="text-align:center;display:none">
        	<span>两分钟后重新获取验证码</span>
        </div>
    </div>
</div>

<div class="center" style="text-align:center">
        <button type="button" class="btn_done" onclick="doCheck()">
            完成
            <img src="../images/join/26.png" class="join_img26">
        </button>
</div>
</body>
<script>
	var getSecurityCodeBtn = $("#btn1");
	var phone = $("#phone");
	var securityCodeInput = $("#securityCode");
	var warningText = $("#warningText");
	
	var code = '<%=request.getParameter("code")%>';
	var coser = {};
	if(code != 'null'){
		$.ajax({
			url:contextPath+'/rest/weixin/login',
			type:'POST',
			contentType:'application/json',
			data:JSON.stringify({code:code}),
			dataType:'json',
			success:function(ret){
				if(ret){
					if(ret.hasPhone === "true"){
						alert("已注册,即将跳转到完善信息页面...");
						window.location.href=contextPath+"/pages/coser/coser_edit.jsp?cnid="+ret.openid;
					}else{
						coser = ret;
						if(ret.headimgurl){
							$("#headimgurl").attr("src",ret.headimgurl);
						}
						if(ret.nickname){
							$("#nickname").html(ret.nickname);
						}
					}
				}
			}
		})	
	}
	
	var hasGetSecurityCode =false;
	var seconds = 60;
	function getSecurityCode(){
		if(hasGetSecurityCode){
			return;
		}
		$.ajax({
			url:contextPath+'/rest/cosers/sendSecurityCode',
			type:'POST',
			contentType:'application/json',
			data:JSON.stringify({phoneNum:phone.val()}),
			success:function(ret){
			}
			
		})
		hasGetSecurityCode = true;
		seconds = 60;
		setInterval("myInterval()",1000);//1000为1秒钟
		//warningText.css("display","");
		
	}
	
	
    function myInterval()
    {
    	if(seconds == 0){
    		hasGetSecurityCode = false;
    		getSecurityCodeBtn.val("获取验证码");
    	}else{
	    	getSecurityCodeBtn.val("已发送("+seconds--+")");
    	}
     }
    
    function doCheck(){
    	$.ajax({
    		url:contextPath+'/rest/cosers/checkSecurityCode',
    		type:'POST',
    		contentType:'application/json',
    		data:JSON.stringify({phoneNum:phone.val(),securityCode:securityCodeInput.val(),openid:coser.openid}),
    		success:function(ret){
    			if(ret && ret === "true"){
    				alert("验证成功");
    				window.location.href=contextPath+"/pages/coser/coser_join_step2.jsp?id="+coser.openid;
    			}else{
    				alert("验证码错误");
    			}
    		}
    	})
    }
</script>
</html>
