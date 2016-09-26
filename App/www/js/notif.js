 document.addEventListener('deviceready', function () {
    // Android customization
    cordova.plugins.backgroundMode.setDefaults({ text:'Doing heavy tasks.'});
    // Enable background mode
    cordova.plugins.backgroundMode.enable();
            var i=0;
           var interval = setInterval(function(){
           //    console.log("inside set Interval");
                $.ajax({
                   url: "http://192.168.43.189:8080/Brain_World/AlertApp.jsp",
                    type:"GET",
//                    dataType:"json",
                    beforeSend: function(){console.log("before Send")},
                    success: function(result){
                                    if(result.trim().length == 0)
                                        {
                                            console.log("length 0");
                                            return;
                                        }
                                    console.log(result.trim().length);
                                    console.log("length:"+result.length);
                                    console.log("success");
                                    res = JSON.parse(result);
                                    //alert(res);
                                   // var out=" ";
                                    console.log("this: "+res.alerts.length);
                                    for(i=1;i<res.alerts.length + 1;i++)
                                        {
                                            cordova.plugins.notification.local.schedule({
                                                    id:i,
                                                    title:"eZtrack",
                                                    text: "Alert "+res.alerts[i-1].temp + " at "+res.alerts[i-1].timestamp,
                                                    badge: i,
                                                    ongoing:true
                                                }); 
                                            console.log(i);

                                        }
//                                }
                            },
                    error: function(e){
                                alert("error" +e);
                            },
                    complete: function(){console.log("complete!")}
                    
                }); 
           },5000);
     $(".stop-interval").click(function(){
        clearInterval(interval);
     });
            
//    cordova.plugins.notification.local.on("click", function (notification) {
//        alert(notification.text);
//    }, scope);
     
    // Called when background mode has been activated
    cordova.plugins.backgroundMode.onactivate = function () {
        setTimeout(function () {
            // Modify the currently displayed notification
            cordova.plugins.backgroundMode.configure({
                text:'Running in background for more than 5s now.'
            });
        }, 5000);
    }
}, false);


$(document).ready(function(){
            
});

