<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<%@include file="/pages/common/common.jsp" %>
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
  	<title>新增Coser</title>
  	<style>
  		.leftTitle{
  			font-size: 18px;
		    padding: 0;
		    margin: 0px;
		    font-weight: bold;
		    border-bottom:1px solid #eee;
  		}
  		.rightTitle{
	  		font-size: 16px;
		    color: #999;
		    font-weight: normal;
  		}
  		.file-drop-zone {
  			margin:0;
  		}
  		.file-drop-zone-title{
  			padding:0;
  		}
  		.col-xs-4.col-sm-4.col-md-4,.col-xs-5.col-sm-5.col-md-5 {
  			padding:0;
  		}
  		input.form-control{
  			height:25px !important;
  		}
  		.checkbox .btn-default:hover{
  			background:none;
  			border-color: #fff;
  		}
  		.btn-default.active, .btn-default:active, .open>.dropdown-toggle.btn-default {
		    color: #333;
		    background-color: #EBF10B !important;
		    border-color: #fff;
		}
		.btn-default{
			border-color: #fff;
			border-radius:0px;
		}
		.checkbox label, .radio label{
			padding-left:12px
		}
		.left_label{
			font-weight: normal;padding:0px;margin-top:4px;margin-bottom:0px;
		}
		.right_label{
			color:#A5A1A1;font-weight: normal;padding:0px;margin-top:4px;margin-bottom:0px
		}
		
		.file-preview-frame{
			height:50px;margin: 6px;border: 0px;padding: 0px;
		}
  	</style>
</head>
<body style="margin:10px;padding-top:10px;background: #F2F2F2">
	<div class="weui_cells_title">上传</div>
        <div class="weui_cells weui_cells_form">
            <div class="weui_cell">
                <div class="weui_cell_bd weui_cell_primary">
                    <div class="weui_uploader">
                        <div class="weui_uploader_hd weui_cell">
                            <div class="weui_cell_bd weui_cell_primary">图片上传</div>
                            <div class="weui_cell_ft">0/2</div>
                        </div>
                        <div class="weui_uploader_bd">
                            <ul class="weui_uploader_files">
                            </ul>
                            <div class="weui_uploader_input_wrp">
                                <input class="weui_uploader_input" type="file" accept="image/jpg,image/jpeg,image/png,image/gif" multiple />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	
</body>
<script>
</script>
</html>