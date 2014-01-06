// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.slider
//= require form_slider
//= require jquery_nested_form
//= require_tree .



$(document).ready(function(){
//Examples of how to assign the Colorbox event to elements
	$(".login").colorbox();
	$("#company tr td a").each(function(){
		$(this).on('click',function(e){
      url = $(this).attr('href');
      e.preventDefault();
      $.ajax({
            type: "GET",
            url: "/company_ratings/user_rating?company_id="+url.split("/")[2],
            success: function (dataCheck) {
                if(dataCheck=="redirect"){
                  window.location = url;
                }
                else{
                  $.colorbox({title:'',width:'900px',height:'500px',html:dataCheck});
                  // $(this).colorbox({html: dataCheck});
                }
            }
        });
    })
    
	 //$(this).colorbox({href:"/company_ratings/user_rating?company_id="+$(this).attr('href').split("/")[2]});
	 // console.log($(this).attr('href').split("/")[2]);
	});
  $(".to_date").datepicker();
  $(".from_date").datepicker();
  $(".add_nested_fields").on('click',function(){
      $(".to_date").datepicker();
      $(".from_date").datepicker();
  });
  // $("div.field input[type=text]").each(function(){
  //   $(this).on('click',function(){
  //     $(this).datepicker();
  //   })

    
  // })

});
