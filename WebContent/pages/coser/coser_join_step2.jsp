<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<%@include file="/pages/common/common.jsp" %>
	<style>
	.btn-default.active.focus, .btn-default.active:focus, .btn-default.active:hover, .btn-default:active.focus, .btn-default:active:focus, .btn-default:active:hover, .open>.dropdown-toggle.btn-default.focus, .open>.dropdown-toggle.btn-default:focus, .open>.dropdown-toggle.btn-default:hover {
	    color: #333;
	    background-color: #fece07;
	    border-color: #fece07;
    }
    .btn-default.active, .btn-default:active, .open>.dropdown-toggle.btn-default {
		    color: #333;
		    background-color: #fece07 !important;
		    border-color: #fff;
		}
	</style>
  	<title>新增Coser</title>
</head>
<body style="margin:auto;padding-top:10px;background: #F2F2F2">
	<form role="form" id="coserForm">
	<div class="col-xs-12 col-sm-12 col-md-12">
		<div style="text-align:center;background:#1b1b1b;border-top-right-radius: 5px;border-top-left-radius: 5px;padding:30px 0px;">
			<span id="title" style="color:#ffc107;font-size:18px;">请进一步完善您的个人信息</span>
		</div>
		<div style="background:#ffffff;height:500px;padding:30px 10px;">
			<div class="row">
				<div class="col-xs-2 col-sm-2 col-md-2" style="max-width:50px;">
					<img src="<%=contextPath%>/pages/images/perfect_info1/57.png" style="width:30px;">
				</div>
				<div class="col-xs-10 col-sm-10 col-md-10">
					<input type="text" class="form-control" id="cnName" name="cnName" placeholder="CN">
				</div>
			</div>
			<div class="row" style="padding-top:15px;">
				<div class="col-xs-2 col-sm-2 col-md-2" style="max-width:50px;text-align:right;">
					<img src="<%=contextPath%>/pages/images/perfect_info1/58.png" style="width:30px;">
				</div>
				<div class="col-xs-10 col-sm-10 col-md-10">
					<div class="btn-group col-xs-12 col-sm-12 col-md-12" data-toggle="buttons" style="padding:0px;">
					   <label class="btn btn-default col-xs-6 col-sm-6 col-md-6 active">
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
					<input type="text" class="form-control" id="birthday" name="birthday" placeholder="请填写生日yyyy-MM-dd">
				</div>
			</div>
			<div class="row" style="padding-top:15px;">
				<div class="col-xs-2 col-sm-2 col-md-2" style="max-width:50px;">
					<img src="<%=contextPath%>/pages/images/perfect_info1/60.png" style="width:30px;">
				</div>
				<div class="col-xs-10 col-sm-10 col-md-10">
					<input type="text" class="form-control" id="location" name="location" placeholder="请填写所在地">
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
				<a type="button" class="btn btn_warning col-xs-12 col-sm-12 col-md-12" onclick="doNext()" style="padding: 5px 30px; background:#fece07;color: #ffffff;font-size: 18px; font-weight: bold;">下一页</a>
			</div>
		</div>
	</div>
	</form>
</body>
<script>
	var coserId = '<%=request.getParameter("id")%>';
	
	$(function(){
		$('#coserForm').validate({  
            errorElement : 'span',  
            errorClass : 'help-block',  
            focusInvalid : false,  
            rules : {  
            	cnName : {  
                    required : true  
                },
            	birthday : {  
                    required : true  
                },
                location : {  
                    required : true  
                }
            },  
            messages : {  
            	cnName : {  
                    required : "Coser名称不能为空."  
                },
            	birthday : {  
                    required : "生日不能为空."  
                },
                location : {  
                    required : "所在地不能为空."  
                }
            },  
  
            highlight : function(element) {  
                $(element).closest('.row').addClass('has-error');  
            },  
  
            success : function(label) {  
                label.closest('.row').removeClass('has-error');  
                label.remove();  
            },  
  
            errorPlacement : function(error, element) {  
                element.parent('div').append(error);  
            },  
  
            submitHandler : function(form) {  
                //form.submit();  
            }  
        });  
	});
	
	function doNext(){
		if ($('#coserForm').validate().form()) {  
        }else{
        	alert("信息填写不完整!");
        	return;
        }
		
		var birthday = $("#birthday").val();
		var location = $("#location").val();
		var weiboName = $("#weiboName").val();
		var cnName = $("#cnName").val();
		var sex = $("input[name=sex]:checked").val();
		if(!sex || typeof(sex) == 'undefine'){
			sex = 0;
		}
		var coser = {
			birthday:birthday,
			location:location,
			weiboName:weiboName,
			cnName:cnName,
			sex:sex,
			cnId:coserId
		}
		$.ajax({
			url:contextPath+'/rest/cosers/update',
			type:'POST',
			contentType:'application/json',
			data:JSON.stringify({coser:coser}),
			success:function(ret){
				window.location.href=contextPath+"/pages/coser/coser_join_step3.jsp?id="+coserId;
			},
			error:function(ret){
				alert("信息保存失败");
			}
		})
		
	}
</script>
</html>