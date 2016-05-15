var roleNum = 1;
	var worksNum = 1;
	
	var dateRangeOptions = {
			"showDropdowns": true,
	        "showWeekNumbers": true,
	        "timePicker": false,
	        "timePicker24Hour": false,
	        "autoApply": true,
	        "locale": {
	            "format": "MM/DD/YYYY",
	            "separator": " - ",
	            "applyLabel": "确认",
	            "cancelLabel": "取消",
	            "fromLabel": "开始时间",
	            "toLabel": "结束时间",
	            "customRangeLabel": "Custom",
	            "daysOfWeek": ["日", "一", "二", "三", "四", "五", "六"],
	            "monthNames": ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
	            "firstDay": 1
	        },
	        "linkedCalendars": false,
	        "autoUpdateInput": true
	}
	
	var roleFormTemplate = $("#roleDiv").html();	
	var worksFormTemplate = $("#worksDiv").html();	
	$(function(){
		if(typeof(announcementId)!="undefined" && announcementId){
			$.ajax({
				url:contextPath+'/rest/announcements/'+announcementId,
				type:'POST',
				dataType:'json',
				success:function(announcement){
					if(announcement){
						var roles = announcement.roles;
						var workses = announcement.workses;
						
						if(roles && roles.length > 0){
							$("#roleImage").fileinput({
						    	language: 'zh',
						    	uploadUrl: contextPath+"/rest/announcements/upload",
						    	uploadAsync: false,
						    	initialPreview: [
			 			    	    '<img  src="'+contextPath+"/"+roles[0].imagePath+'">'
			 			        ],
						    	uploadExtraData:function(){
						    		return {
						    			relativePath: $("#"+this.id).parentsUntil("form").last().find("#imagePath").val()
						    		}
						    	}
						    	
						    });
						   
						}
						
						if(workses && workses.length > 0){
							 $("#worksImage").fileinput({
							    	language: 'zh',
							    	uploadUrl: contextPath+"/rest/announcements/upload",
							    	uploadAsync: false,
							    	initialPreview: [
				 			    	    '<img  src="'+contextPath+"/"+workses[0].imagePath+'">'
				 			        ],
							    	uploadExtraData:function(){
							    		return {
							    			relativePath: $("#"+this.id).parentsUntil("form").last().find("#imagePath").val()
							    		}
							    	}
							    	
							    });
						}
						
						setRolesData(roles);
						setWorksesData(workses);
						
						var formHelper = new FormHelper("announcementForm");
						formHelper.setData(announcement);
						
						var signUpStartTime = announcement.signUpStartTime;
						var signUpEndTime = announcement.signUpEndTime;
						if(signUpStartTime && signUpEndTime){
							dateRangeOptions.startDate = new Date(signUpStartTime);
							dateRangeOptions.endDate = new Date(signUpEndTime);
						}
						
						$('#signupTime').daterangepicker(dateRangeOptions, function(start, end, label) {
					    	var startTime = start.format('YYYY-MM-DD');
					    	var endTime = end.format('YYYY-MM-DD');
					      	$("#signUpStartTime").val(startTime);
					      	$("#signUpEndTime").val(endTime);
					    });
						
						var activityStartTime = announcement.activityStartTime;
						var activityEndTime = announcement.activityEndTime;
						
						if(activityStartTime && activityEndTime){
							dateRangeOptions.startDate = new Date(activityStartTime);
							dateRangeOptions.endDate = new Date(activityEndTime);
						}
						
						$('#activityTime').daterangepicker(dateRangeOptions, function(start, end, label) {
					    	var startTime = start.format('YYYY-MM-DD');
					    	var endTime = end.format('YYYY-MM-DD');
					    	$("#activityStartTime").val(startTime);
					    	$("#activityEndTime").val(endTime);
					    });
						
						
						$('#editor').html(announcement.activityBackground);
						$('#contentEditor').html(announcement.content);
						
						$("#logoFile").fileinput({
					    	language: 'zh',
					    	uploadUrl: contextPath+"/rest/announcements/upload",
					    	uploadAsync: false,
					    	showCaption: false,
					    	showUpload:false,
					    	initialPreview: [
		 			    	    '<img  src="'+contextPath+"/"+announcement.logoPath+'">'
		 			        ],
					    	uploadExtraData:function(){
					    		return {
					    			relativePath: $("#logoPath").val()
					    		}
					    	}
					    });
					    
						initListener();
						
					}
				}
			});
		}else{
			$("#logoFile").fileinput({
		    	language: 'zh',
		    	uploadUrl: contextPath+"/rest/announcements/upload",
		    	uploadAsync: false,
		    	showCaption: false,
		    	showUpload:false,
		    	uploadExtraData:function(){
		    		return {
		    			relativePath: $("#logoPath").val()
		    		}
		    	}
		    });
		    
		    $("#roleImage").fileinput({
		    	language: 'zh',
		    	uploadUrl: contextPath+"/rest/announcements/upload",
		    	uploadAsync: false,
		    	uploadExtraData:function(){
		    		return {
		    			relativePath: $("#"+this.id).parentsUntil("form").last().find("#imagePath").val()
		    		}
		    	}
		    	
		    });
		    
		    $("#worksImage").fileinput({
		    	language: 'zh',
		    	uploadUrl: contextPath+"/rest/announcements/upload",
		    	uploadAsync: false,
		    	uploadExtraData:function(){
		    		return {
		    			relativePath: $("#"+this.id).parentsUntil("form").last().find("#imagePath").val()
		    		}
		    	}
		    	
		    });
		    
		    initListener();
		    
		    $('#signupTime').daterangepicker(dateRangeOptions, function(start, end, label) {
		    	var startTime = start.format('YYYY-MM-DD');
		    	var endTime = end.format('YYYY-MM-DD');
		    	//$('#signupTime').val(startTime + ' 至 ' + endTime);
		    	$("#signUpStartTime").val(startTime);
		    	$("#signUpEndTime").val(endTime);
		    });
		    
		    $('#activityTime').daterangepicker(dateRangeOptions, function(start, end, label) {
		    	var startTime = start.format('YYYY-MM-DD');
		    	var endTime = end.format('YYYY-MM-DD');
		    	//$('#activityTime').val(startTime + ' 至 ' + endTime);
		    	$("#activityStartTime").val(startTime);
		    	$("#activityEndTime").val(endTime);
		    });
		}
	    
	    
	    initToolbarBootstrapBindings();
	    $("#editor").wysiwyg();
	    $("#contentEditor").wysiwyg();
	});
	
	function initListener(){
		 $('#logoFile').on('filebatchselected', function(event, files) {
		    	if(files && files.length > 0){
				    var filename = files[0].name;
				    var imagePath = "/images/announcement_logos/"+Math.uuidFast()+filename.substring(filename.indexOf("."));
				    $("#logoPath").val(imagePath);
		    	}
			});
		    
		    $('#roleImage').on('filebatchselected', function(event, files) {
		    	if(files && files.length > 0){
				    var filename = files[0].name;
				    var imagePath = "/images/roles/"+Math.uuidFast()+filename.substring(filename.indexOf("."));
				    
				    $("#"+this.id).parentsUntil("form").last().find("#imagePath").val(imagePath);
		    	}
			});
		    
		    $('#worksImage').on('filebatchselected', function(event, files) {
		    	if(files && files.length > 0){
				    var filename = files[0].name;
				    var imagePath = "/images/works/"+Math.uuidFast()+filename.substring(filename.indexOf("."));
				    $("#"+this.id).parentsUntil("form").last().find("#imagePath").val(imagePath);
		    	}
			});
	}
	
	function initToolbarBootstrapBindings() {
	      var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier', 
	            'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
	            'Times New Roman', 'Verdana'],
	            fontTarget = $('[title=Font]').siblings('.dropdown-menu');
	      $.each(fonts, function (idx, fontName) {
	          fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
	      });
	      $('a[title]').tooltip({container:'body'});
	    	$('.dropdown-menu input').click(function() {return false;})
			    .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
	        .keydown('esc', function () {this.value='';$(this).change();});

	      $('[data-role=magic-overlay]').each(function () { 
	        var overlay = $(this), target = $(overlay.data('target')); 
	        overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width('36px').height('30px');
	      });
	      if ("onwebkitspeechchange"  in document.createElement("input")) {
	        var editorOffset = $('#editor').offset();
	        $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
	      } else {
	        $('#voiceBtn').hide();
	      }
		};
	
	
	function publish(){
		$("#logoFile").fileinput('upload');
		$("#tab_1_2").find("[name='uploadedFile']").each(function(index,element){
				$(this).fileinput('upload');
		});
		$("#tab_1_3").find("[name='uploadedFile']").each(function(index,element){
			$(this).fileinput('upload');
		});
		
		saveForm();
		
	}
	
	function update(){
		if($("#logoFile").fileinput('getFileStack') && $("#logoFile").fileinput('getFileStack').length > 0){
			$("#logoFile").fileinput('upload');
		}
		
		$("#tab_1_2").find("[name='uploadedFile']").each(function(index,element){
				$(this).fileinput('upload');
		});
		$("#tab_1_3").find("[name='uploadedFile']").each(function(index,element){
			$(this).fileinput('upload');
		});
		
		updateForm();
	}
	
	/* var totalRoleNum;
	function test(){
		//$("#logoFile").fileinput('upload');
		totalRoleNum = roleNum;
		alert(totalRoleNum);
		$("#tab_1_2").find("[name='uploadedFile']").each(function(index,element){
				$(this).fileinput('upload');
		});
	} */
	
	function saveForm(){
		var formHelper = new FormHelper("announcementForm");
		var announcement = formHelper.getData();
		
		announcement.roles = getRolesData();
		announcement.workses = getWorksesData();
		announcement.activityBackground = $('#editor').html();
		announcement.content = $('#contentEditor').html();
		
		$.ajax({
			url:contextPath+'/rest/announcements/create',
			type:'POST',
			contentType:'application/json',
			data:JSON.stringify({"announcement":announcement}),
			success:function(ret){
				alert("保存成功");
				window.location.href=contextPath+"/pages/console/announcements/announcements_list.jsp";
			},
			error:function(ret){
				alert("保存失败");
			}
		})
	}
	
	function updateForm(){
		var formHelper = new FormHelper("announcementForm");
		var announcement = formHelper.getData();
		
		announcement.roles = getRolesData();
		announcement.workses = getWorksesData();
		announcement.activityBackground = $('#editor').html();
		announcement.content = $('#contentEditor').html();
		
		$.ajax({
			url:contextPath+'/rest/announcements/update',
			type:'POST',
			contentType:'application/json',
			data:JSON.stringify({"announcement":announcement}),
			success:function(ret){
				alert("保存成功");
				window.location.href=contextPath+"/pages/console/announcements/announcements_list.jsp";
			},
			error:function(ret){
				alert("保存失败");
			}
		})
	}
	
	function getRolesData(){
		var roleForms = $("form[name='roleForm']");
		var roles = [];
		if(roleForms){
			roleForms.each(function(index,element){
				var controls = $(this).find(".form-control");
				if(controls){
					var roleData = {};
					controls.each(function(index,element){
						var name = $(this).attr("name");
						if(name){
							roleData[name] = $(this).val();
						}
					});
					roles.push(roleData);
				}
			});
		}
		return roles;
	}
	
	function setRolesData(roles){
		if(roles && roles.length > 0){
			for(var i = 1; i < roles.length  ; i++){
				$("#tab_1_2").append($(roleFormTemplate));
				
				var thisControl = $("#tab_1_2").find("[name='uploadedFile']").last();
				thisControl.fileinput({
			    	language: 'zh',
			    	uploadUrl: contextPath+"/rest/announcements/upload",
			    	uploadAsync: false,
			    	initialPreview: [
 			    	    '<img  src="'+contextPath+"/"+roles[i].imagePath+'">'
 			        ],
			    	uploadExtraData:function(){
			    		return {
			    			relativePath: thisControl.parentsUntil("form").last().find("#imagePath").val()
			    		}
			    	}
			    });
				
				thisControl.on('filebatchselected', function(event, files) {
			    	if(files && files.length > 0){
					    var filename = files[0].name;
					    var imagePath = "/images/roles/"+Math.uuidFast()+filename.substring(filename.indexOf("."));
					    thisControl.parentsUntil("form").last().find("#imagePath").val(imagePath);
			    	}
				});
			}
			var roleForms = $("form[name='roleForm']");
			if(roleForms && roles){
				roleForms.each(function(i,element){
					var controls = $(this).find(".form-control");
					if(controls){
						controls.each(function(index,element){
							var name = $(this).attr("name");
							if(name){
								$(this).val(roles[i][name]);
							}
						});
					}
				});
			}
		}
	}
	
	function getWorksesData(){
		var worksForms = $("form[name='worksForm']");
		var workses = [];
		if(worksForms){
			worksForms.each(function(index,element){
				var controls = $(this).find(".form-control");
				if(controls){
					var worksData = {};
					controls.each(function(index,element){
						var name = $(this).attr("name");
						if(name){
							worksData[name] = $(this).val();
						}
					});
					workses.push(worksData);
				}
			});
		}
		return workses;
	}
	
	function setWorksesData(workses){
		if(workses && workses.length > 0){
			for(var i = 1; i < workses.length; i++){
				$("#tab_1_3").append($(worksFormTemplate));
				
				var thisControl = $("#tab_1_3").find("[name='uploadedFile']").last();
				
				thisControl.fileinput({
			    	language: 'zh',
			    	uploadUrl: contextPath+"/rest/announcements/upload",
			    	uploadAsync: false,
			    	initialPreview: [
			    	    '<img  src="'+contextPath+"/"+workses[i].imagePath+'">'
			        ],
			    	uploadExtraData:function(){
			    		return {
			    			relativePath: thisControl.parentsUntil("form").last().find("#imagePath").val()
			    		}
			    	}
			    });
				
				thisControl.on('filebatchselected', function(event, files) {
			    	if(files && files.length > 0){
					    var filename = files[0].name;
					    var imagePath = "/images/works/"+Math.uuidFast()+filename.substring(filename.indexOf("."));
					    thisControl.parentsUntil("form").last().find("#imagePath").val(imagePath);
			    	}
				});
			}
			var worksForms = $("form[name='worksForm']");
			if(worksForms && workses){
				worksForms.each(function(i,element){
					var controls = $(this).find(".form-control");
					if(controls){
						controls.each(function(index,element){
							var name = $(this).attr("name");
							if(name){
								$(this).val(workses[i][name]);
							}
						});
					}
				});
			}
		}
	}
	
	function addRoleHtml(){
		if(roleNum >= 9){
			alert("最多只能添加9个角色");
			return;
		}
		$("#tab_1_2").append($(roleFormTemplate));
		
		var thisControl = $("#tab_1_2").find("[name='uploadedFile']").last();
		thisControl.fileinput({
	    	language: 'zh',
	    	uploadUrl: contextPath+"/rest/announcements/upload",
	    	uploadAsync: false,
	    	uploadExtraData:function(){
	    		return {
	    			relativePath: thisControl.parentsUntil("form").last().find("#imagePath").val()
	    		}
	    	}
	    });
		
		thisControl.on('filebatchselected', function(event, files) {
	    	if(files && files.length > 0){
			    var filename = files[0].name;
			    var imagePath = "/images/roles/"+Math.uuidFast()+filename.substring(filename.indexOf("."));
			    thisControl.parentsUntil("form").last().find("#imagePath").val(imagePath);
	    	}
		});
		
		roleNum++;
	}
	
	function addWorksHtml(){
		if(worksNum >= 10){
			alert("最多只能添加10个作品");
			return;
		}
		$("#tab_1_3").append($(worksFormTemplate));
		
		var thisControl = $("#tab_1_3").find("[name='uploadedFile']").last();
		
		thisControl.fileinput({
	    	language: 'zh',
	    	uploadUrl: contextPath+"/rest/announcements/upload",
	    	uploadAsync: false,
	    	uploadExtraData:function(){
	    		return {
	    			relativePath: thisControl.parentsUntil("form").last().find("#imagePath").val()
	    		}
	    	}
	    });
		
		thisControl.on('filebatchselected', function(event, files) {
	    	if(files && files.length > 0){
			    var filename = files[0].name;
			    var imagePath = "/images/works/"+Math.uuidFast()+filename.substring(filename.indexOf("."));
			    thisControl.parentsUntil("form").last().find("#imagePath").val(imagePath);
	    	}
		});
		
		worksNum++;
	}