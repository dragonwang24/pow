<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<%@include file="/pages/common/common.jsp" %>
	<link href="<%=contextPath %>/pages/signup/signup_not_perfect.css" rel="stylesheet">
	<%
		String coserId = request.getParameter("cnid");
		if(coserId == null){
			coserId = "";
		}
	%>
  	<title>提交成功</title>
</head>
<body style="margin:auto;background: #1B1B1B">
<div class="top">
    <div class="center4">
	    <img id="headimgurl" src="" class="img23"/>
	    <div id="cnName" class="font10" style="padding-top:10px"></div>
	</div>
    <div class="center2">
        <img src="<%=contextPath %>/pages/images/godown_perfect/24.png" class="gd_n_p_img24">
    </div>
    <div class="font">
        恭喜你，报名信息已成功提交
    </div>
    <div class="font2">信息越完善，就会有更多人注意到你呦</div>
    <div class="center3">
        <a>
            <button class="perfect_info2" onclick="gotoPerfectInfo()">
                <img src="<%=contextPath %>/pages/images/godown_not_perfect/25.png" class="gd_n_p_img25"/>
                <span class="font3">完善信息</span>
            </button>
        </a>
    </div>
</div>
	<script>
		var coserId = '<%=coserId%>';
		if(coserId){
			$.ajax({
				url:contextPath+'/rest/weixin/getUserInfo/'+coserId,
				type:'POST',
				dataType:'json',
				success:function(userInfo){
					if(userInfo){
						if(userInfo.headimgurl){
							$("#headimgurl").attr("src",userInfo.headimgurl);
						}
						if(userInfo.cnName){
							$("#cnName").html(userInfo.cnName);
						}
					}
				}
			})
		}
		
		function gotoPerfectInfo(){
			window.location.href='<%=contextPath %>/pages/coser/coser_edit.jsp?cnid='+coserId;
		}
	</script>
</body>
</html>