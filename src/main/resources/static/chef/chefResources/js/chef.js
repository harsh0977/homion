
function openFileDialog() {
	document.getElementById("file").click();
}

function setImage(event) {
	var filePath = URL.createObjectURL(event.target.files[0]);
	var image = document.getElementById("image");
	image.src = filePath;
}

function setPincode(area) {
	  var areaName = area.options[area.selectedIndex].text;
	  document.getElementById("pincode").value = area.value;
	  document.getElementById("hiddenArea").value = areaName;
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

function setForm(addressId, type, homeNo, societyName, landmark, area, pincode) {
	document.getElementById("addressId").value = addressId;
	document.getElementById("homeNo").value = homeNo;
	document.getElementById("societyName").value = societyName;
	document.getElementById("landmark").value = landmark;
	document.getElementById("area").value = pincode;
	document.getElementById("pincode").value = pincode;
  	document.getElementById("Home").classList.remove("active");
  	document.getElementById("Work").classList.remove("active");
  	document.getElementById("Other").classList.remove("active");
  	document.getElementById(type).classList.add("active");
}

function resetForm() {
	document.getElementById("addressForm").reset();
}

function reload(){
  var delay = 100000;
  var refreshId = setInterval(function () {
      $('#new-orders').fadeOut("slow").load(" #new-orders > * ").fadeIn("slow");
  }, delay);
}

function ongoing(){
  document.getElementById("new-orders").style.display="none";
}

function countItems(id){
  var htp=new XMLHttpRequest();
  var count;
  htp.onreadystatechange = function() {
    if(htp.readyState==4){
      document.getElementById("items"+id).innerHTML = "ITEMS - "+htp.responseText;
    }
  }
  htp.open("get","countItems?orderId="+id,true);
  htp.send();  
}

function setModalDetails(orderId,userName,userMobileNo,timestamp,amount){
  document.getElementById("orderId").innerHTML = 'Order id : #'+ new Date(timestamp).getTime();
  document.getElementById("userName").innerHTML = userName;
  document.getElementById("userMobileNo").innerHTML = userMobileNo;
  document.getElementById("userAddress").innerHTML = document.getElementById("address"+orderId).innerHTML;
  
  var htp=new XMLHttpRequest();
  htp.onreadystatechange = function() {
    if(htp.readyState==4){
      $("#modalItems").load(" #modalItems > * ");
    }
  }
  htp.open("get","getItems?orderId="+orderId,true);
  htp.send();
  
  document.getElementById("totalAmount").innerHTML = amount;
}

function setOrderId(id,timestamp){
  document.getElementById("orderId"+id).innerHTML = 'Order: #'+ new Date(timestamp).getTime();
}

function setInvoiceId(id,timestamp){
  document.getElementById("invoiceId"+id).innerHTML = 'Invoice&nbsp;&nbsp;#INV-'+ new Date(timestamp).getTime();
}

function setOrderItems(orderId){
  var orderItemDiv = document.getElementById("orderItemsList"+orderId);
  var htp=new XMLHttpRequest();
  htp.onreadystatechange = function() {
    if(htp.readyState==4){
      var data = JSON.parse(htp.responseText);
      for(var i=0; i<data.length; i++)
        orderItemDiv.innerHTML += '<p class="text- font-weight-bold mb-0">' + data[i].product.name + ' x ' + data[i].count + '</p>';
      document.getElementById("productImage"+orderId).src = data[data.length-1].product.image;
    }
  }
  htp.open("get","getOrderItemsList?orderId="+orderId,true);
  htp.send();
}


function setOrderIdInBusinessHistory(type,id,timestamp){
	  document.getElementById("orderId"+type+id).innerHTML = 'Order: #'+ new Date(timestamp).getTime();
	}

	function setOrderItemsInBusinessHistory(type,orderId){
	  var orderItemDiv = document.getElementById("orderItemsList"+type+orderId);
	  var htp=new XMLHttpRequest();
	  htp.onreadystatechange = function() {
	    if(htp.readyState==4){
	      var data = JSON.parse(htp.responseText);
	      for(var i=0; i<data.length; i++)
	        orderItemDiv.innerHTML += '<p class="text- font-weight-bold mb-0">' + data[i].product.name + ' x ' + data[i].count + '</p>';
	      document.getElementById("productImage"+type+orderId).src = data[data.length-1].product.image;
	    }
	  }
	  htp.open("get","getOrderItemsList?orderId="+orderId,true);
	  htp.send();
}