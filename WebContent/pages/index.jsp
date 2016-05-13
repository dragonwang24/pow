<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<%
	String contextPath = request.getContextPath();
	%>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
  	<title>Bootstrap 101 Template</title>

  	<link href="<%=contextPath %>/resources/bootstrap-3.3.5/css/bootstrap.min.css" rel="stylesheet">
  	<link href="<%=contextPath %>/resources/bootstrap-fileinput/css/fileinput.min.css" rel="stylesheet">

  	<script src="<%=contextPath %>/resources/jquery/jquery.min-1.11.1.js"></script>
  	<script src="<%=contextPath %>/resources/bootstrap-3.3.5/js/bootstrap.min.js"></script>
  	<script src="<%=contextPath %>/resources/bootstrap-fileinput/js/fileinput.min.js"></script>
  	<script src="<%=contextPath %>/resources/bootstrap-fileinput/js/fileinput_locale_zh.js"></script>
  	<script src="<%=contextPath %>/resources/bootstrap-fileinput/js/plugins/canvas-to-blob.min.js"></script>
</head>
<body>
  	<!-- <input id="input-701" name="kartik-input-701" type="file" multiple=false class="file-loading">
	<script>
	$("#input-701").fileinput({
	    uploadUrl: "http://localhost/file-upload-batch/1", // server upload action
	    uploadAsync: true,
	    maxFileCount: 5
	});
	</script> -->
	
	
	
	<style>
.kv-avatar .file-preview-frame,.kv-avatar .file-preview-frame:hover {
    margin: 0;
    padding: 0;
    border: none;
    box-shadow: none;
    text-align: center;
}
.kv-avatar .file-input {
    display: table-cell;
    max-width: 220px;
}
</style>
 
	<!-- <div id="kv-avatar-errors" class="center-block text-center" style="width:800px;display:none"></div> -->
	    <div class="kv-avatar center-block" style="width:200px">
	        <input id="avatar" name="uploadedFile" type="file" class="file-loading">
	    </div>
	    <button type="button" class="btn btn-primary" onclick="doUpload()">上传</button>
	<!-- <form class="text-center" action="/avatar_upload.php" method="post" enctype="multipart/form-data">
	    include other inputs if needed and include a form submit (save) button
	</form> -->
	<script>
	$("#avatar").fileinput({
		uploadUrl: "<%=contextPath%>/rest/product/upload", // server upload action
	    uploadAsync: false,
	    overwriteInitial: true,
	    maxFileSize: 15000,
	    showClose: false,
	    showCaption: false,
	    browseLabel: '',
	    removeLabel: '',
	    uploadLabel: '',
	    browseIcon: '<i class="glyphicon glyphicon-folder-open"></i>',
	    removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
	    removeTitle: 'Cancel or reset changes',
	    uploadIcon: '<i class="glyphicon glyphicon-upload"></i>',
	    elErrorContainer: '#kv-avatar-errors',
	    msgErrorClass: 'alert alert-block alert-danger',
	    defaultPreviewContent: '<img src="/uploads/default_avatar_male.jpg" alt="Your Avatar" style="width:160px;height:160px;">',
	    layoutTemplates: {main2: '{preview} {remove} {browse}'}
	    //allowedFileExtensions: ["jpg", "png", "gif"]
	});
	
	$('#avatar').on('fileuploaded', function(event, data, previewId, index) {
	    //alert(data.response.success);
	    alert("fileuploaded");
	    //console.log('File uploaded triggered');
	});
	
	$('#avatar').on('filebatchuploadsuccess', function(event, data, previewId, index) {
	    //alert(data.response.success);
	    alert("filebatchuploadsuccess");
	    //console.log('File uploaded triggered');
	});

	
	function doUpload(){
		$("#avatar").fileinput('upload');
		alert(123);
	}
	</script>
	
	
</body>
</html>