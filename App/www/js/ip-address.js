$(document).ready(function(){
      if (typeof(Storage) !== "undefined") 
        {
            // Store
            localStorage.setItem("ip", "http://192.168.1.102:8080");
            // Retrieve

        } 
        else {
            alert("No IP Detected!");
        }
});