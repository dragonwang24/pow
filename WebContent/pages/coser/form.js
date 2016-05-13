var MyValidator = function() {  
    var handleSubmit = function() {  
        $('#coserForm').validate({  
            errorElement : 'span',  
            errorClass : 'help-block',  
            focusInvalid : false,  
            rules : {  
                name : {  
                    required : true  
                },  
                birthday : {  
                	required : true  
                },  
                password : {  
                    required : true  
                },  
                intro : {  
                    required : true  
                }  
            },  
            messages : {  
                name : {  
                    required : "Username is required."  
                },  
                birthday : {  
                	required : "birthday is required."  
                },  
                password : {  
                    required : "Password is required."  
                },  
                intro : {  
                    required : "Intro is required."  
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
               // form.submit();  
            }  
        });  
  
//        $('#form1 input').keypress(function(e) {  
//            if (e.which == 13) {  
//                if ($('#form1').validate().form()) {  
//                    $('#form1').submit();  
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