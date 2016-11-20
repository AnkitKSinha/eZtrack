$(document).ready(function(){
      if (typeof(Storage) !== "undefined") 
        {
            // Store
            localStorage.setItem("ip", "http://localhost:8080");
            // Retrieve

        } 
        else {
            alert("No IP Detected!");
        }
});