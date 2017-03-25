// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.noty.packaged.min

//= require_tree .
			
		$(document).ready(function(){
			var interval=null,id=null;
			$(document).on('click','a',function(){
				var elem=$(this).attr('id');
				if(elem!==undefined && elem.substring(0,6)==="course"){
					var size=$(this).attr('id').length;
					id=parseInt(elem.substring( size-2 , size ));

					console.log(id+"  "+size);
					
						if(document.getElementById('update_form')===null){
							console.log("inside");
							interval=window.setInterval(s,100);
						}
				}
			});



			function s(){
				window.clearInterval(interval);
				var update_form = document.getElementById('update_form');
					console.log(update_form);

			    	update_form.addEventListener('submit', function(event) {
				        event.preventDefault();
				        console.log("tried submitting");
				        var url = "/update_course_post";
				        var title = document.getElementById("update_title");
				        var genre = document.querySelector('input[name = "type"]:checked').value;
				        var description = document.getElementById("update_description");
				        var commitment = document.getElementById("update_commitment");
				        var course_id=id
				        console.log(course_id);
				        console.log(genre);

				        data = {
				        	title: title.value,
				        	description: description.value,
				        	commitment: commitment.value,
				        	course_id: course_id,
				        	genre: genre
				         }

				         console.log(data);

				        $.ajax({
				            url: url,
				            method: "POST",
				            data: data,
				            success: function(result) {
				            	noty({text: "Updated", theme: "relax", type: 'success', layout: 'centerRight'});           
				            },
				            error: function(error){
				            	noty({text: "Cannot Update", theme: "relax", type: 'error', layout: 'topRight'});

				            }
				        });
				    });    
			}
		});


