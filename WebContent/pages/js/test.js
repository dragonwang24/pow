	
	var footerTemplate = '<div class="file-thumbnail-footer">\n' +
		'   <div style="margin:5px 0">\n' +
		'       <input class="kv-input kv-new form-control input-sm {TAG_CSS_NEW}" value="{caption}" placeholder="Enter caption...">\n' +
		'       <input class="kv-input kv-init form-control input-sm {TAG_CSS_INIT}" value="{TAG_VALUE}" placeholder="Enter caption...">\n' +
		'   </div>\n' +
		'   {actions}\n' +
		'</div>';


	$(function(){
		
		
		
	    $("#logoFile").fileinput({
	    	language: 'zh',
	    	uploadUrl: contextPath+"/rest/announcements/upload",
	    	uploadAsync: false,
	    	showCaption: false,
	    	showUpload:false,
	    	maxFileCount: 10,
	    	resizeImage: true,
	    	showClose: false,
	    	overwriteInitial: false,
////	    	layoutTemplates:{actions: '<div class="file-actions">\n' +
//	        '    <div class="file-footer-buttons">\n' +
//	        '        {upload}{delete}' +
//	        '    </div>\n' +
//	        '    <div class=""  >+</div>\n' +
//	        '    <div class="clearfix"></div>\n' +
//	        '</div>'},
	    	layoutTemplates:{footer : '<div class="file-thumbnail-footer" style="position:relative">\n' +
	    		//'    <div class="file-caption-name pull-left">{caption}</div>'+
	    		'<button type="button" class="kv-file-remove btn btn-xs btn-default pull-right" style="-webkit-box-shadow: none !important; background: #eee; position: absolute;bottom: 0px;right:0px;border: 0px;padding: 0px;margin-right:-6px;margin-bottom:-6px;" title="删除文件"><i class="glyphicon glyphicon-trash text-danger"></i></button>\n' +
	    		'</div>'},
	    	previewTemplates:{image: '<div class="file-preview-frame" style="height:50px;margin: 6px;border: 0px;padding: 0px;" id="{previewId}" data-fileindex="{fileindex}">\n' +
	            '   <img src="{data}" class="file-preview-image" style="width:50px;height:50px;" title="{caption}" alt="{caption}" >\n' +
	            '   {footer}\n' +
	            '</div>\n',},
	    	uploadExtraData:function(){
	    		return {
	    			relativePath: $("#logoPath").val()
	    		}
	    	}
	    });
	    
	    
	    $('#logoFile').on('filebatchselected', function(event, files) {
	    	if(files && files.length > 0){
			    var filename = files[0].name;
			    var imagePath = "/images/announcement_logos/"+Math.uuidFast()+filename.substring(filename.indexOf("."));
			    $("#logoPath").val(imagePath);
	    	}
		});
	    
	});
	
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
		$.ajax({
			url:contextPath+'/rest/announcements/create',
			type:'POST',
			contentType:'application/json',
			data:JSON.stringify({"announcement":announcement}),
			success:function(ret){
				alert("保存成功");
			},
			error:function(ret){
				
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