var productInCart = {};
var totalAmount = 0; 

function checkout() {
	$.ajax({
	     type : "POST",
	     url :  "/user/addToCart",
	     contentType: "application/json",
	     data : JSON.stringify(productInCart),
	     success : () => {
	    	 setTimeout(() => {location.href = "/user/checkout";}, 1000);
	     }
	});
}

function addToCart(id, productName, price)
{
	document.getElementById(id).style.display = 'none';
	document.getElementById("slider"+id).style.display = 'none';
	var cart = document.getElementById("cart");
	productInCart[id] = 1;
	var html = '<div class="gold-members d-flex align-items-center justify-content-between px-3 py-2" id="div'+id+'">'+
					'<div class="media align-items-center">'+
						'<div class="mr-2 text-success">&middot;</div>'+
						'<div class="media-body">'+
							'<p class="m-0">'+ productName +'</p>'+
						'</div>'+
					'</div>'+
					'<div class="d-flex align-items-center">'+
						'<span class="count-number float-right">'+
							'<button type="button" class="btn-sm left dec btn btn-outline-secondary" onclick="minus('+id+','+price+')"> <i class="feather-minus"></i></button>'+
							'<input class="count-number-input" type="text" value="1" readonly="true" id="count'+id+'">'+
							'<button type="button" class="btn-sm right inc btn btn-outline-secondary" onclick="plus('+id+','+price+')"><i class="feather-plus"></i></button>'+
						'</span>'+
						'<p class="text-gray mb-0 float-right ml-2 text-muted small" id="price'+id+'">&#x20B9; '+ price +'</p>'+
						'<p class="text-danger mb-0 float-right ml-2 large"> <i class="feather-trash" onclick="deleteFromCart('+id+')" style="cursor: pointer;"></i> </p>'+
					'</div>'+
				'</div>';
	
	cart.innerHTML += html;
	totalAmount += price;
	document.getElementById("toPay").innerHTML = "&#x20B9; "+totalAmount;
	
	if(totalAmount > 0) {
		var element = document.getElementById("checkoutBtn");
	  	element.classList.remove("disabled");
	  	document.getElementById("cartEmptyMsg").style.display = 'none';
	}
		
}

function deleteFromCart(id) {
	delete productInCart[id];
	var priceTag = document.getElementById("price"+id).innerHTML;
	totalAmount -= parseInt(priceTag.split(' ')[1]);
	document.getElementById("toPay").innerHTML = "&#x20B9; "+totalAmount;
	document.getElementById("div"+id).remove();
	document.getElementById(id).style.display = 'inline';
	document.getElementById("slider"+id).style.display = 'inline';
	if(totalAmount == 0) {
		var element = document.getElementById("checkoutBtn");
	  	element.classList.add("disabled");
	  	document.getElementById("cartEmptyMsg").style.display = 'block';
	}
}

function plus(id, price)
{
	var priceTag = document.getElementById("price"+id);
	var count = document.getElementById("count"+id); 
	value = parseInt(count.value) + 1;
	count.value = value;
	priceTag.innerHTML = "&#x20B9; " + value*price;
	productInCart[id] = value;
	totalAmount += price;
	document.getElementById("toPay").innerHTML = "&#x20B9; "+totalAmount;
}

function minus(id, price)
{
	var priceTag = document.getElementById("price"+id);
	var count = document.getElementById("count"+id);
	value = parseInt(count.value);
	if(value > 1) {
		value -= 1;
		totalAmount -= price;
		document.getElementById("toPay").innerHTML = "&#x20B9; "+totalAmount;
	}
	count.value = value;
	priceTag.innerHTML = "&#x20B9; " + value*price;
	productInCart[id] = value;
}

function validateName(name) {
	  var mobileNo = document.getElementById(name).value;
	  console.log("invalid"+name);
	  if(mobileNo.length == 0){
	    document.getElementById("invalid"+name).style.display="";
	  return false;
	  }
	  document.getElementById("invalid"+name).style.display="none";
	  return true;
}

function validateMobile() {
	  var mobileNo = document.getElementById("mobileNumber").value.toString();
	  if(mobileNo.length != 10){
	    document.getElementById("invalidMobile").style.display="";
	  return false;
	  }
	  document.getElementById("invalidMobile").style.display="none";
	  return true;
}
  
function validatePAN() {
  var panNumber = document.getElementById("panNumber").value;
  var regex = /([A-Z]){5}([0-9]){4}([A-Z]){1}$/;
    if (!regex.test(panNumber)) {
    	document.getElementById("invalidPAN").style.display="";
      return false;
    }
    document.getElementById("invalidPAN").style.display="none";
    return true;
}

function validateEmail(){
	var email = document.getElementById("email").value;
	var regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
	 if (!regex.test(email)) {
		 document.getElementById("invalidEmail").style.display="";
	      return false;
	    }
	 document.getElementById("invalidEmail").style.display="none";
	 return true;
}

function validateForm()
{	
   if(validateName('userName') && validateName('firstName') && validateName('lastName') && validateMobile() && validateEmail() && validatePAN() )
	   document.getElementById('submitButton').disabled=false;
   else
	   document.getElementById('submitButton').disabled=true;
}

var flag=0;
function showPassword(){
    if(flag == 0)
    {
      document.getElementById('password').type='text';
      document.getElementById('eye').style.display="none";
      document.getElementById('slashEye').style.display="";
      flag=1;
    }
    else
    {
      document.getElementById('password').type='password';
      document.getElementById('eye').style.display="";
      document.getElementById('slashEye').style.display="none";
      flag=0;
    }
}

function setChefId(id) {
	document.getElementById("chefId").value = id;
	document.getElementById("myForm").submit();
}

function setAddress(addressId) {
	document.getElementById('selectedAddress').value = addressId;
}

function search(){
  var searchBar = document.getElementById("searchBar").value;
  var htp=new XMLHttpRequest();
    
  htp.onreadystatechange = function() {
    if(htp.readyState==4){
      $("#productDiv").load(" #productDiv > * ");
      $("#chefDiv").load(" #chefDiv > * ");
      }
  }
  htp.open("get","searchItem?value="+searchBar,true);
  htp.send();
}

function filter(){
  var sort = document.querySelector('input[name="sort"]:checked').value;
  var markedCheckbox = document.querySelectorAll('input[type="checkbox"]:checked');
  var checkBoxes = []
  for (var checkbox of markedCheckbox) {  
      checkBoxes.push(checkbox.value);  
  }
  var filters;
  if(typeof checkBoxes !== 'undefined' && checkBoxes.length > 0){
    filters = checkBoxes;
  }
  else{
    filters=0;
  }
  
  var htp=new XMLHttpRequest();
  
  htp.onreadystatechange = function() {
    if(htp.readyState==4){
      $("#productDiv").load(" #productDiv > * ");
      $("#chefDiv").load(" #chefDiv > * ");
      }
  }
  htp.open("get","applyFilter?sortBy="+sort+"&filterBy="+filters,true);
  htp.send();  
}

function disableModal(){
  document.getElementById("filterButton").style.display="none";
}

function enableModal(){
  document.getElementById("filterButton").style.display="";
}


function getOrderDetails(orderId, amount) {
	$.ajax({
	     type : "POST",
	     url :  "/user/orderDetails/"+orderId,
	     success : () => { 
	    	 $("#orderDetailsBody").load(" #orderDetailsBody > *");
	    	 setTimeout(() => {document.getElementById("totalAmount").innerHTML = "&#x20B9; "+amount;;}, 300);
	     }
	});
}

orderId = 0
chefRating = 0
foodRating = 0
	
function review(id) {
	orderId = id;
}

function rate(type, value) {
	if (type == 'chef')
		chefRating = value;
	else
		foodRating = value;
		
	for(var i = 1; i <= value; i++) {
		var element = document.getElementById(type+"-"+i);
	  	element.classList.remove("mdi-star-outline");
	  	element.classList.add("mdi-star", "rated");
	}
	for(var i = value+1; i <= 5; i++) {
		var element = document.getElementById(type+"-"+i);
	  	element.classList.remove("mdi-star", "rated");
	  	element.classList.add("mdi", "mdi-star-outline");
	}
}

function submitReview() {
	var comment = document.getElementById("reviewComment").value;
	var reviewData = {
		'orderId' : orderId,
		'chefRating' : chefRating,
		'foodRating' : foodRating,
		'comment' : comment
	}
	
	$.ajax({
	     type : "GET",
	     url :  "/user/submitReview",
	     contentType: "application/json",
	     data : reviewData,
	     success: setTimeout(() => { location.reload(); }, 1000)
	});
}

function reorder(id) {
	$.ajax({
	     type : "GET",
	     url :  "/user/reorder",
	     contentType: "application/json",
	     data : {'orderId' : id},
	     success : () => {
	    	 location.href = "/user/checkout"
	     }
	});
}


function favouriteProduct(typeId) {
	  
  var heart = document.getElementById(typeId);
  
  var htp = new XMLHttpRequest();
  htp.onreadystatechange = function(){ }
  
  if(heart.style.background === ""){
    heart.style.background = "yellow";
    htp.open("post","/user/addFavourite?typeId="+typeId+"&type=Product",true);
    htp.send();
  }
  else{
    heart.style.background = "";
    htp.open("delete","/user/removefavourite?typeId="+typeId,true);
    htp.send();
  }
}

function favouriteChef(typeId) {
  
  var favouriteButton = document.getElementById(typeId);
  
  var htp = new XMLHttpRequest();
  htp.onreadystatechange = function(){ }
  
  if(favouriteButton.innerHTML.split("</i>")[1] === " Add to Favourite "){
    favouriteButton.classList.remove("btn-light");
    favouriteButton.classList.add("btn-danger");
    favouriteButton.innerHTML = '<i class="feather-heart"></i> Remove from Favourite';
    htp.open("post","/user/addFavourite?typeId="+typeId+"&type=Chef",true);
    htp.send();
  }
  else{
    favouriteButton.classList.remove("btn-danger");
    favouriteButton.classList.add("btn-light");
    favouriteButton.innerHTML = '<i class="feather-heart"></i> Add to Favourite ';
    htp.open("delete","/user/removefavourite?typeId="+typeId,true);
    htp.send();
  }
}


function favourite(typeId, type) {
	  
	  var heart = document.getElementById(typeId);
	  
	  var htp = new XMLHttpRequest();
	  htp.onreadystatechange = function() {
	    if(htp.readyState==4){
	      if(type === "Chef")
	        $('#chefs').fadeOut("slow").load(" #chefs > * ").fadeIn("slow");
	      else
	        $('#dishes').fadeOut("slow").load(" #dishes > * ").fadeIn("slow");
	    }
	  }

	  if(heart.classList[2] === "mdi-heart-outline"){
	    heart.classList.remove("mdi-heart-outline");
	    heart.classList.add("mdi-heart", "favourite");
	    htp.open("post","/user/addFavourite?typeId="+typeId+"&type="+type,true);
	    htp.send();
	  }
	  else{
	    heart.classList.remove("mdi-heart", "favourite");
	    heart.classList.add("mdi-heart-outline");
	    htp.open("delete","/user/removefavourite?typeId="+typeId+"&type="+type,true);
	    htp.send();
	  }
	}

	function favouriteChef(typeId) {
	  
	  var favouriteButton = document.getElementById(typeId);
	  
	  var htp = new XMLHttpRequest();
	  
	  if(favouriteButton.innerHTML.split("</i>")[1] === " Add to Favourite "){
	    favouriteButton.classList.remove("btn-light");
	    favouriteButton.classList.add("btn-danger");
	    favouriteButton.innerHTML = '<i class="feather-heart"></i> Remove from Favourite';
	    htp.open("post","/user/addFavourite?typeId="+typeId+"&type=Chef",true);
	    htp.send();
	  }
	  else{
	    favouriteButton.classList.remove("btn-danger");
	    favouriteButton.classList.add("btn-light");
	    favouriteButton.innerHTML = '<i class="feather-heart"></i> Add to Favourite ';
	    htp.open("delete","/user/removefavourite?typeId="+typeId,true);
	    htp.send();
	  }
	}