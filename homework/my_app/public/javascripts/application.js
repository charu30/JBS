/* 
Author:Charu Jain
Homework 11
Description: Use jquery and AJAX 
Usage: run localhost:3000/categories
*/

// function to display each row of results in a table
function toRow() {
    columns = '';
	for(var i = 0; i < arguments.length; i++) {
	    columns += '<td>' + arguments[i] + '</td>';
    }
    return '<tr>' + columns + '</tr>';
}

//function to display the results 
function display(json) {
    //create a html string
    html = '<table cellspacing =10 cellpadding=10 >';
	html += '<th>Title</th>'
    html += '<th>Description</th>'
	// for each object in json
    for(var i in json) {
	    // get the note element
        item = json[i]['note'];
		//print the title and description
	    html += toRow(item.title,item.description);
    }
    html += '</table>';
	//add it to the 'search-results' div
    $('#search-results').html(html);
}

//function to search for a particular category
function search(category) {
   //append the name of argument to the '/notes/category'
	url = '/notes/category/' + category;
	//receives JSON objects from the url 
    $.getJSON(url, function(json) {
	//call display function to display json object in html
    display(json);
	});
}


//AJAX request to check whether the response is ready or not 
 $(document).ready(function() {
    // Attach an event when div 'execute-search' is clicked
    $('#execute-search').click(function() {
	  
        // call function search with value entered in the text-box id 'category'
        search($('#category').val());
                
    });
});
	

	