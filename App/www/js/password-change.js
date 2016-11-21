$(document).ready(function(){

	$(".password-submit").click(function(){
		var curPassword = $("#cur-password").val();
		var newPassword = $("#new-password").val();
		var confirmPassword = $("#conf-password").val();
		$.ajax({
	           url: localStorage.getItem("ip")+"/eztrack/PostPassword.jsp",
	            type:"POST",
	            data:{
	            	u_id: localStorage.getItem("u_id"),
					curPassword : curPassword,
					newPassword : newPassword   
	        	},
	            success: function(result){
	                   		res = JSON.parse(result);
	                       if((res.code == 1)){
	                       		alert(res.msg);
	                       	}
	                       else{
	                       		alert(res.msg);
	                       }

	                       window.location.replace("settings.html");


	                    },
	            error: function(e){
	                        alert("error" +e);
	                        window.location.replace("index.html");
	                    }
	});
	});
});
