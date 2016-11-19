$(document).ready(function(){

	$(".alerts-tab").addClass("active-now");
            
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
   // alert(localStorage.getItem("track_ud_id"));
     $.ajax({
         url: localStorage.getItem("ip")+"/eztrack/HistoricalData.jsp",
          type:"GET",
          data:{
            ud_id: parseInt(localStorage.getItem("track_ud_id")),
            type : 1      
          },
          success: function(result){
                      //alert("success" + result);
                      var out='';
                      //alert("here");

                      res = JSON.parse(result);
                      //alert(res.users.length);
                      //alert("res "+res);
                      $(".logo-text").text(res.name);
                      if(!res.data){
                        return;
                      }
                      for(i=0;i<res.data.length;i++)
                          {
                              //console.log(i);
                              out+=('<div class="col-xs-12 text-center">'+
                                        '<span class="label label-primary">'+res.data[i].date+'</span>'+
                                        '</div>'+
                                        ''+
                                      '<div class="panel panel-default col-xs-12">'+
                                        '<div class="panel-heading col-xs-12 text-center">'+
                                            '<span class="font-helvetica">'+res.data[i].time+'</span>'+
                                        '</div>'+
                                        '<div class="panel-body">');

                                          for(var j = 0; j<res.data[i].sensors.length; j++){

                                            out+= '<li>'+res.data[i].sensors[j].type+'   :'+res.data[i].sensors[j].value+' </li>';
                                          }
                                          
                                        out+='</div></div></div>';
                          }
                      //alert(out);
                      $("#section2").html(out);
                       
                  },
          error: function(e){
                      alert("error" +e);
                  }
         //complete: function(){alert("complete!")}
          
      });
     $.ajax({
         url: localStorage.getItem("ip")+"/eztrack/HistoricalData.jsp",
          type:"GET",
          data:{
            ud_id: parseInt(localStorage.getItem("track_ud_id")),
            type : 2      
          },
          success: function(result){
                      //alert("success" + result);
                      var out='';
                      //alert("here");

                      res = JSON.parse(result);
                      //alert(res.users.length);
                      //alert("res "+res);
                      $(".logo-text").text(res.name);
                      if(!res.data){
                        return;
                      }
                      for(i=0;i<res.data.length;i++)
                          {
                              //console.log(i);
                              out+=('<div class="col-xs-12 text-center">'+
                                        '<span class="label label-danger">'+res.data[i].date+'</span>'+
                                        '</div>'+
                                        ''+
                                      '<div class="panel panel-default col-xs-12">'+
                                        '<div class="panel-heading col-xs-12 text-center">'+
                                            '<span class="font-helvetica">'+res.data[i].time+'</span>'+
                                        '</div>'+
                                        '<div class="panel-body">');

                                          for(var j = 0; j<res.data[i].sensors.length; j++){

                                            out+= '<li>'+res.data[i].sensors[j].type+'   :'+res.data[i].sensors[j].value+' </li>';
                                          }
                                          
                                        out+='</div></div></div>';
                          }
                      //alert(out);
                      $("#section1").html(out);
                       
                  },
          error: function(e){
                      alert("error" +e);
                  }
         //complete: function(){alert("complete!")}
          
      });
    
});