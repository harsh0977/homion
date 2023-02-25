function viewFeedback(chefRating, foodRating, comment) {
	
	document.getElementById('chefRating').innerHTML = fillStar(chefRating);
	document.getElementById('foodRating').innerHTML = fillStar(foodRating);
	document.getElementById('comment').innerHTML = comment;
}

function fillStar(ratingValue) {
	var rating = '';
	for(var i=0; i<5; i++) {
		if(i<ratingValue)
			rating += '<i class="mdi mdi-star rated"></i>'
		else
			rating += '<i class="mdi mdi-star-outline"></i>';
	}
	return rating;
}