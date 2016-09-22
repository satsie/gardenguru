var AUTH_TOKEN = $('meta[name=csrf-token]').attr('content');

var submit;

submit = function() {
	var list1 = document.getElementById('list1');
	var list2 = document.getElementById('list2');
	var plants = $('#list2').sortable('toArray');
	var json = JSON.stringify(plants);

	$.ajax({
		url: "/permutations?authenticity_token=" + AUTH_TOKEN,
		type: "post",
		data: {plants: json},
		success: function(result){
		  var resultsList = "";
		  for (var i = 0; i < result.length; i++) {
		  	resultsList = resultsList + result[i] + "\n";
		  }
		  resultsList = resultsList.substring(0, resultsList.length - 2);
          alert("Found " +  result.length + " results!\n" + resultsList);

        },
        error:function(){
          alert('Error');
        }
	})
}

var ready;

ready = function () {
  // $('.gg-icon').draggable();

  $('#list1, #list2').sortable({
  	connectWith: ".to-plant"
  })

  $('#submit-button').click(submit);
}

$(document).ready(ready);

$(document).on('page:load',ready);


