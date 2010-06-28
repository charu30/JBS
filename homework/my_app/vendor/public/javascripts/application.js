// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults



function search(category) {
    	$.getJSON('/notes/category/', {category:category}, function(json) {
                alert('hi');
    	        if(json['success']) {
        	        alert('success');
        	        //alert(json['users'][0]['interests']);
        	        //display(json['users']);
            	} 
            	//alert('hi');
        	});
}

alert('hiiii');
 $(document).ready(function() {
     alert('hi');
    $('#execute-search').click(function() {
	    alert ('hssi');
        //search($('#insert-location').val());
        search($('#category').val());
                
    });
	
	
	
	});
	

	