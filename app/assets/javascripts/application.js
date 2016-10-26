// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require turbolinks

$( document ).on("turbolinks:load",function() {
  $('#user-edit-button').on('click', function() {
    $('#user-edit').toggle();
    $('#user-info').toggle();
    $('#user-edit-button').toggle();
  });
	$('#cancel-edit-button').on('click', function() {
    $('#user-edit').toggle();
    $('#user-info').toggle();
    $('#user-edit-button').toggle();
    $
  });
  $('h1').on('click', function(){
  	$(location).attr('href', "/")
  });

	$('#post-edit-button').on('click', function() {
	  $('.edit-post-text-area').toggle();
	  $('.user-post-text').toggle();
	})

  $('.back-arrow').on('click', scrollBackThroughImages);
  $('.forward-arrow').on('click', scrollForwardThroughImages);

  $('#new_user').on('submit', function(event){
  	event.preventDefault();
  	var data = {
  		user: {
  			first_name: $('#user_first_name').val(),
  			last_name: $('#user_last_name').val(),
  			current_city: $('#user_current_city').val(),
  			profile_image: $('#user_profile_image').val(),
  			profile_image: $('#user_profile_image').val(),
  			email: $('#user_email').val(),
  			password: $('#user_password').val()
  		}
  	};
  	$.ajax({
  		url: "/users/validate_user",
  		type: "POST",
  		data: data,
  		success: function(){
  			$('#new_user')[0].submit();
  		},
  		error: function(){
  			$(':submit').removeAttr("disabled");
  			$('#sign-up-modal').find('.modal-body').prepend("<p class='error'>please fix errors in the form and resubmit</p>")
  		}
  	});
  });

  hideImagesExceptFirstOne();
});

var photoIndex = 0 
function scrollBackThroughImages(){
	var photoArray = $('.cover-photo');
	$(photoArray[photoIndex]).toggle();
	if(photoIndex > 0){
		photoIndex--;	
	}
	else{
		photoIndex = photoArray.length - 1;
	}
	$(photoArray[photoIndex]).toggle();
}

function scrollForwardThroughImages(){
	var photoArray = $('.cover-photo');
	$(photoArray[photoIndex]).toggle();
	if(photoIndex < photoArray.length - 1){
		photoIndex++;
	}
	else {
		photoIndex = 0;
	}
	$(photoArray[photoIndex]).toggle();
}

function hideImagesExceptFirstOne(){
	var photoArray = $('.cover-photo');
	if (photoArray.length > 1) {
		for (i = 0; i < photoArray.length; i++){
			if(i !== photoIndex){
				$(photoArray[i]).toggle();
			}
		}		
	}
}
	
function show_sign_up_modal(){
	$('#sign-up-modal').toggle();
	$('#sign-up-modal').toggle();
}