// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

$(function() {
  //$(document).foundation();
  $('#status').click(function(event){
		var searchIDs = $(".chnagevalue input:checkbox:checked").map(function(){
      return $(this).val();
    }).get();
		var that = this;
		$.ajax({
			url: "users/change",
			type: "GET",
			data: {id : searchIDs,status: $('#statuss').val()},
			success: function(response){
                        window.location.href = 'users';
                    },
			error: function(jqXHR){
				console.log(jqXHR.responseText+' :: '+jqXHR.statusText);
			}
		});
}); });
$(function() {
  //$(document).foundation();
  $('#statuspage').click(function(event){
		var searchIDs = $(".chnagevalue input:checkbox:checked").map(function(){
      return $(this).val();
    }).get();
		var that = this;
		$.ajax({
			url: "/pagess/change",
			type: "GET",
			data: {id : searchIDs,status: $('#status_pages').val()},
			success: function(response){
				 window.location.href = '/pagess';
                    },
			error: function(jqXHR){
				console.log(jqXHR.responseText+' :: '+jqXHR.statusText);
			}
		});
}); });
$(function() {
  //$(document).foundation();
  $('#statustesti').click(function(event){
		var searchIDs = $(".chnagevalue input:checkbox:checked").map(function(){
      return $(this).val();
    }).get();
		var that = this;
		$.ajax({
			url: "/testimonial/change",
			type: "GET",
			data: {id : searchIDs,status: $('#status_testi').val()},
			success: function(response){
				 window.location.href = '/testimonial';
                    },
			error: function(jqXHR){
				console.log(jqXHR.responseText+' :: '+jqXHR.statusText);
			}
		});
}); });
$(function() {
  //$(document).foundation();
  $('#statuscontent').click(function(event){
		var searchIDs = $(".chnagevalue input:checkbox:checked").map(function(){
      return $(this).val();
    }).get();
		var that = this;
		$.ajax({
			url: "/content/change",
			type: "GET",
			data: {id : searchIDs,status: $('#status_content').val()},
			success: function(response){
				 window.location.href = '/content';
                    },
			error: function(jqXHR){
				console.log(jqXHR.responseText+' :: '+jqXHR.statusText);
			}
		});
}); });
$(function() {
  //$(document).foundation();
  $('#statusabout').click(function(event){
		var searchIDs = $(".chnagevalue input:checkbox:checked").map(function(){
      return $(this).val();
    }).get();
		var that = this;
		$.ajax({
			url: "/about/change",
			type: "GET",
			data: {id : searchIDs,status: $('#status_about').val()},
			success: function(response){
				 window.location.href = '/about';
                    },
			error: function(jqXHR){
				console.log(jqXHR.responseText+' :: '+jqXHR.statusText);
			}
		});
}); });
$(function() {
  //$(document).foundation();
  $('#statusslider').click(function(event){
		var searchIDs = $(".chnagevalue input:checkbox:checked").map(function(){
      return $(this).val();
    }).get();
		var that = this;
		$.ajax({
			url: "/slider/change",
			type: "GET",
			data: {id : searchIDs,status: $('#status_slider').val()},
			success: function(response){
				 window.location.href = '/slider';
                    },
			error: function(jqXHR){
				console.log(jqXHR.responseText+' :: '+jqXHR.statusText);
			}
		});
}); });
$(function() {
  //$(document).foundation();
  $('#statusteam').click(function(event){
		var searchIDs = $(".chnagevalue input:checkbox:checked").map(function(){
      return $(this).val();
    }).get();
		var that = this;
		$.ajax({
			url: "/team/change",
			type: "GET",
			data: {id : searchIDs,status: $('#status_team').val()},
			success: function(response){
				 window.location.href = '/team';
                    },
			error: function(jqXHR){
				console.log(jqXHR.responseText+' :: '+jqXHR.statusText);
			}
		});
}); });