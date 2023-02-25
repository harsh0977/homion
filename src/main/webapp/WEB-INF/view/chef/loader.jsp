<div id="loader" class="center" style="border: 12px solid #f3f3f3; 
     border-radius: 50%; 
     border-top: 12px solid #5e2572; 
     width: 70px; 
     height: 70px; 
     animation: spin 1s linear infinite;
     position: absolute; 
     top: 0; 
     bottom: 0; 
     left: 0; 
     right: 0; 
     margin: auto;">
</div>
            
<script>
	document.onreadystatechange = function() { 
	    if (document.readyState !== "complete") { 
	        document.querySelector("body").style.visibility = "hidden"; 
	        document.querySelector("#loader").style.visibility = "visible"; 
	    } else { 
	        document.querySelector("#loader").style.display = "none"; 
	        document.querySelector("body").style.visibility = "visible"; 
	    } 
	};
</script>