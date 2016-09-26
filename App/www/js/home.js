$(document).ready(function(){
            
            //alert("u_id: "+localStorage.getItem("u_id"));
            $(".home-tab").addClass("active-now");
            
            $(".tabs > div").click(function(){
               var target=$(this).attr('data-target');
                var $this = $(this);
                $("body").animate({
                    scrollLeft: $("#"+target).offset().left
                },300, function(){
                   $(".tabs > div").each(function(){
                   $(this).removeClass("active-now");
                   });
                   $this.addClass("active-now");
                });
            });
            var cogClickVal=0;
                
                
                $.ajax({
                   url: localStorage.getItem("ip")+"/eztrack/UserTrackingList.jsp",
                    type:"GET",
                    data:{
                    u_id: localStorage.getItem("u_id")      
                },
                    success: function(result){
                                //alert("success" + result);
                                var out='<ul class="list-group" style="padding:0px;">';
//                                if(result.trim().length == 0)
//                                        {
//                                            console.log("length 0");
//                                            out='<h3>no data</h3>';
//                                            $("#section1").html(out);
//                                            return;
//                                        }
                                
                                res = JSON.parse(result);
                                //alert(res.users.length);
                                for(i=0;i<res.users.length;i++)
                                    {
                                        //console.log(i);
                                        out+=' <li class="list-group-item user_tracking" data-ud_id ='+res.users[i].ud_id+' ><span>'+res.users[i].username+'</span>';
                                        if(res.users[i].count == 0)
                                        {
                                            out+='<span class="pull-right glyphicon glyphicon-thumbs-up" style="font-size:30px;color:#008000;"></span></li>';        
                                        }
                                        else
                                        {
                                            out+='<span class="pull-right glyphicon glyphicon-thumbs-down" style="font-size:30px;color:#fb0000;"><sub>'+res.users[i].count+'</sub></span></li>';
                                        }
                                    }
                                out+='</ul>';
                                $("#section1").html(out);
                                $(".user_tracking").click(function(){
                                    //alert("clicked!");
                                    var ud_id = $(this).attr("data-ud_id");
                                    localStorage.setItem("track_ud_id",ud_id);
                                    window.location.replace("tracking-details.html");
                                    //alert(ud_id);
                                    
                                    
                                });
                            },
                    error: function(e){
                                alert("error" +e);
                            }
                   //complete: function(){alert("complete!")}
                    
                });

                $.ajax({
                   url: localStorage.getItem("ip")+"/eztrack/UserTrackingRequests.jsp",
                    type:"GET",
                    data:{
                    u_id:localStorage.getItem("u_id")      
                },
                    success: function(result){
                                //alert("success" + result);
                                var out='<ul class="list-group" style="padding:0px;">';
                                if(result.trim().length == 0)
                                        {
                                            console.log("length 0");
                                            out='<div class="col-xs-12 text-center dev-text">No requests for now! </div>';
                                            $("#section2").html(out);
                                            return;
                                        }
                                    else {
                                        alert("here :" + result.trim().length);
                                    }
                                
                                res = JSON.parse(result);
                                //alert(res.users.length);
                                for(i=0;i<res.users.length;i++)
                                    {
                                        //console.log(i);
                                        out+=' <li class="list-group-item"><span>'+res.users[i].username+'</span> <div class="actions pull-right">                    <button class="btn btn-md action-button" data-ty=remove data-dat = '+res.users[i].u_id+'><span class="glyphicon glyphicon-remove"></span></button>                    <button class="btn btn-md action-button" data-ty=accept data-dat = '+res.users[i].u_id+'><span class="glyphicon glyphicon-ok"></span></button>               </div> </li> ';
                                    }
                                out+='</ul>';
                               // alert(out);
                                $("#section2").html(out);
                            },
                    error: function(e){
                                alert("error" +e);
                        
                    },
                    complete: function(){
                          $(".action-button").click(function(){
                                   // alert("here!");
                                    var fromUser= $(this).attr("data-dat");
                                    var action = $(this).attr("data-ty");
                                    //alert(fromUser);
                                    $.ajax({
                                       url: localStorage.getItem("ip")+"/eztrack/RequestTrackingAction.jsp",
                                        type:"POST",
                                        data:{
                                            u_id:localStorage.getItem("u_id"),
                                            from:fromUser,
                                            action:action
                                        },
                                        success:function(e)
                                                {
                                                    console.log("update successful");
                                                },
                                        complete: function(e)
                                                {
                                                    window.location.replace("test2.html");
                                                }
                                        
                                    });
                                });
                    }
                    
                });
            $("#addImei").click(function(){
                $.ajax({
                    url : localStorage.getItem("ip")+"/eztrack/SendTrackingRequest.jsp",
                    type:"POST",
                    data:{
                            u_id:localStorage.getItem("u_id"),
                            imei : $("#imei").val()
                        },
                    success:function(e)
                            {
                                if(e.trim() == "fail")
                                {
                                    //alert("failed!");
                                }
                                else
                                    {
                                       // alert("success");
                                    }
                                
                              
                            }
                });
            });
    
        
            
});