<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<%@include file="/pages/common/common.jsp" %>
  	<title>Coser列表</title>
</head>
<body style="margin:auto;padding-top:20px;">
	<div class="col-md-12">
	<table class="table table-hover">
         <thead>
             <tr>
                 <th> # </th>
                 <th> 名称 </th>
                 <th> 性别 </th>
                 <th> 操作 </th>
             </tr>
         </thead>
         <tbody id="rows">
         </tbody>
    	</table>
	</div>



	<script>
	
		var sexArray = ['男','女'];
		
		initGrid();
		function initGrid(){
			$.ajax({
				url:contextPath+'/rest/cosers/list',
				type:'POST',
				dataType:'json',
				success:function(ret){
					if(ret && ret.length > 0){
						var totalHtml = [];
						for(var i = 0; i < ret.length; i++){
							
							var coser = ret[i];
							
							var btnTdHtml = '<a class="btn btn-success btn-xs" href="'+contextPath+'/pages/coser/coser_edit.jsp?cnid='+coser.cnId+'"><i class="glyphicon glyphicon-pencil" ></i> 编辑 </a>&nbsp;&nbsp;'+
				         	'<a id="'+coser.cnId+'" class="btn btn-success btn-xs" href="#" onclick="deleteRow(this)"><i class="glyphicon glyphicon-trash"></i> 删除 </a>';
							
							var _trHtml = "<tr><td> "+(i+1)+" </td><td> "+coser.cnName+" </td><td> "+sexArray[coser.sex]+" </td><<td>"+btnTdHtml+"</td></tr>";
							
							totalHtml.push(_trHtml);
						}
						$("#rows").html(totalHtml);
					}
				}
			});
		}
		
		function deleteRow(_row){
			var r=confirm("确定要删除该coser吗？");
			if(r == true){
				var coserId = _row.id;
				if(coserId){
					$.ajax({
						url:contextPath+'/rest/cosers/delete/'+coserId,
						type:'POST',
						success:function(ret){
							alert("删除成功");
							initGrid();
						}
					});
				}
			}
		}
		
	</script>
	
</body>
</html>