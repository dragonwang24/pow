var MyValidator = function() {  
    var handleSubmit = function() {  
        $('#coserForm').validate({  
            errorElement : 'span',  
            errorClass : 'help-block',  
            focusInvalid : false,  
            rules : {  
            	birthday : {  
                    required : true  
                }
            },  
            messages : {  
            	birthday : {  
                    required : "birthday is required."  
                } 
            },  
  
            highlight : function(element) {  
                $(element).closest('.form-group').addClass('has-error');  
            },  
  
            success : function(label) {  
                label.closest('.form-group').removeClass('has-error');  
                label.remove();  
            },  
  
            errorPlacement : function(error, element) {  
                element.parent('div').append(error);  
            },  
  
            submitHandler : function(form) {  
                //form.submit();  
            }  
        });  
  
//        $('#coserForm input').keypress(function(e) {  
//            if (e.which == 13) {  
//                if ($('.form-horizontal').validate().form()) {  
//                    $('.form-horizontal').submit();  
//                }  
//                return false;  
//            }  
//        });  
    }  
    return {  
        init : function() {  
            handleSubmit();  
        }  
    };  
  
}();  

MyValidator.init();