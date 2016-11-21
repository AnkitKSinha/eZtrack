$(document).ready(function(){

	$.ajax({
	           url: localStorage.getItem("ip")+"/eztrack/GetAccountDetails.jsp",
	            type:"GET",
	            data:{
	            	u_id: localStorage.getItem("u_id")      
	        	},
	            success: function(result){
	                       res = JSON.parse(result);
	                       if((res.name=="null")){
	                       		window.location.replace("index.html");
	                       }
	                       else{
	                       		var name = (res.name).split(" ");
	                       		$("#fname").val(name[0]);
	                       		$("#lname").val(name[1]);
	                       		$("#uname").val(res.username);
	                       }

	                    },
	            error: function(e){
	                        alert("error" +e);
	                        window.location.replace("index.html");
	                    }
	});

	$(".register-submit").click(function(){
		var fname = $("#fname").val();
		var lname = $("#lname").val();
		var username= $("#uname").val();
		alert(fname + lname + username);
		$.ajax({
	           url: localStorage.getItem("ip")+"/eztrack/PostProfile.jsp",
	            type:"POST",
	            data:{
	            	u_id: localStorage.getItem("u_id"),
	            	fname: fname,
	            	lname: lname,
	            	username: username      
	        	},
	            success: function(result){
	                   		alert(result);
	                       if((result == "success")){
	                       		alert("Your profile has been modified!");
	                       		
	                       }
	                       else{
	                       		alert("Not modified");
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
