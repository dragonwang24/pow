<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<%@include file="/pages/common/common.jsp" %>
	<link href="<%=contextPath %>/pages/signup/signup_perfect.css" rel="stylesheet">
	<link href="<%=contextPath %>/pages/share/share.css" rel="stylesheet">
	<%
		String coserId = request.getParameter("cnid");
		String url = request.getScheme()+"://"+ request.getServerName()+request.getRequestURI()+"?"+request.getQueryString();
		if(coserId == null){
			coserId = "";
		}
		String title = request.getParameter("title");
		if(title == null){
			title = "";
		}
		title = new String(title.getBytes("ISO-8859-1"),"UTF-8"); 
	%>
  	<title>提交成功</title>
</head>
<body style="margin:auto;background: #1B1B1B">
<div style="margin-top: 3rem;">
    <div class="center4">
	    <img id="headimgurl" src="" class="img23"/>
	    <div id="cnName" class="font10" style="padding-top:10px"></div>
	</div>
    <div class="center3">
        <img src="<%=contextPath %>/pages/images/godown_perfect/24.png" class="width60">
    </div>

    <div class="center">
        <button type="button" class="btn_invite" onclick="_system._guide(true)">
            <img src="<%=contextPath %>/pages/images/godown_perfect/44.png" class="gd_p_img44"/>
            <span class="font14">邀请小伙伴为我助威</span>
        </button>
    </div>
    <div class="font15">
        已得到小伙伴助威的coser
    </div>

    <div class="container" style="width:95%">
        <div class="row">
            <div class="col-xs-12 col-sm-12 div_col_12">
                <div class="col-xs-3 col-sm-3 div_col_3" ng-repeat="item in coser.card">
                    <img ng-src="{{item.url}}" class="width60">
                    <hr class="hr"/>
                    <p class="p6">已有</p>

                    <p><span class="font_red">0</span>人推荐</p>
                </div>
                <div class="col-xs-12 col-sm-12 div_col_12 center" style="padding: 0; margin-top: 10px; margin-bottom: 10px;">
	                <button type="button" class="btn_watch" onclick="window.location.href='../vote/vote.html?user_id=5'">
	                    <span class="font15 font_white">查看人气排行</span>
	                </button>
	            </div>
            </div>
            
        </div>
    </div>
</div>
<div id="cover"></div>
<div id="guide"><img src="<%=contextPath %>/pages/images/share/share.png"></div>
	<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script src="<%=contextPath %>/pages/share/share.js"></script>
	<script src="<%=contextPath %>/pages/common/mp.js"></script>
	<script>
		var coserId = '<%=coserId%>';
		var title = '<%=title%>'
		if(coserId){
			$.ajax({
				url:contextPath+'/rest/weixin/getUserInfo/'+coserId,
				type:'POST',
				dataType:'json',
				success:function(userInfo){
					if(userInfo){
						if(userInfo.headimgurl){
							$("#headimgurl").attr("src",userInfo.headimgurl);
							$mpShare.imgUrl=userInfo.headimgurl;
						}
						if(userInfo.cnName){
							$("#cnName").html(userInfo.cnName);
							$mpShare.title=userInfo.cnName;
							$mpShare.timelineTitle=userInfo.cnName+"报名参加了["+title+"]COSER招募，快来为TA助威！";
						}
					}
				}
			});
			
			$.ajax({
				url:contextPath+'/rest/weixin/getjssdkconfig',
				type:'POST',
				contentType:'application/json',
				dataType:'json',
				data:JSON.stringify({url:location.href.split("#")[0]}),
				success:function(ret){
					if(ret){
						initWX(ret);
					}
				}
				
			})
		}
		
		/* $.ajax({
			url:contextPath+'/rest/weixin/getjssdkconfig',
			type:'POST',
			contentType:'application/json',
			dataType:'json',
			data:JSON.stringify({url:location.href.split("#")[0]}),
			success:function(ret){
				if(ret){
					initWX(ret);
				}
			}
			
		}) */
		
		function initWX(config){
			wx.config({
                debug: false,
                appId: config['appid'], // 必填，公众号的唯一标识
                appid: config['appid'], // 必填，公众号的唯一标识
                timestamp: config['timestamp'], // 必填，生成签名的时间戳，切记时间戳是整数型，别加引号
                nonceStr: config['noncestr'], // 必填，生成签名的随机串
                signature: config['signature'], // 必填，签名，见附录1
                jsApiList: [
                    'checkJsApi',
                    'onMenuShareTimeline',
                    'onMenuShareAppMessage',
                    'onMenuShareQQ',
                    'onMenuShareWeibo',
                ]
            });
		}
	</script>
</body>
</html>