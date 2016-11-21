$(document).ready(function(){

	$.ajax({
	           url: localStorage.getItem("ip")+"/eztrack/GetAccountDetails.jsp",
	            type:"GET",
	            data:{
	            	u_id: localStorage.getItem("u_id")      
	        	},
	            success: function(result){
	                       res = JSON.parse(result);
	                       if((res.name == "null")){
	                       		window.location.replace("index.html");
	                       }
	                       else{
	                       		$("#UserFullName > em").text(res.name);
	                       		$("#UserUsername > em").text(res.username);
	                       }

	                    },
	            error: function(e){
	                        alert("error" +e);
	                        window.location.replace("index.html");
	                    }
	});
});
