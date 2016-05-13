<%
	String contextPath=request.getContextPath();
%>

<script>
	var contextPath = '<%=contextPath%>';
</script>

<style>
	input.form-control{
		height:34px !important;
	}
</style>

<link href="<%=contextPath %>/resources/bootstrap-3.3.5/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=contextPath %>/resources/bootstrap-fileinput/css/fileinput.min.css" rel="stylesheet">
<link href="<%=contextPath %>/resources/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

<!-- <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css" rel="stylesheet">
 -->
<script src="<%=contextPath %>/resources/jquery/jquery.min-1.11.1.js"></script>
<script src="<%=contextPath %>/resources/bootstrap-3.3.5/js/bootstrap.min.js"></script>
<script src="<%=contextPath %>/resources/jquery-validation/js/jquery.validate.js"></script>
<script src="<%=contextPath %>/resources/bootstrap-fileinput/js/fileinput.min.js"></script>
<script src="<%=contextPath %>/resources/bootstrap-fileinput/js/fileinput_locale_zh.js"></script>
<script src="<%=contextPath %>/resources/bootstrap-fileinput/js/plugins/canvas-to-blob.min.js"></script>
<script src="<%=contextPath %>/resources/bootstrap-daterangepicker/moment.min.js"></script>
<script src="<%=contextPath %>/resources/bootstrap-daterangepicker/daterangepicker.js"></script>

<script src="<%=contextPath %>/resources/bootstrap-wysiwyg/bootstrap-wysiwyg.js"></script>
<script src="<%=contextPath %>/resources/bootstrap-wysiwyg/external/jquery.hotkeys.js"></script>
<%-- <script src="<%=contextPath %>/resources/bootstrap-wysiwyg/external/google-code-prettify/prettify.js"></script>
 --%><link href="<%=contextPath %>/resources/bootstrap-wysiwyg/index.css" rel="stylesheet">
<%-- <link href="<%=contextPath %>/resources/bootstrap-wysiwyg/external/google-code-prettify/prettify.css" rel="stylesheet">
 --%>

<script src="<%=contextPath %>/pages/common/util.js"></script>
