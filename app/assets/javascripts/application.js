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
			var interval=null,id=null,lectureInterval=null,lectureId=null;

			$(document).on('click','a',function(){
				var elem=$(this).attr('id');

				if(elem!==undefined && elem.substring(0,6)==="course"){
					var size=$(this).attr('id').length;
					id=parseInt(elem.substring( 7 , size ));

					console.log(id+"  "+size);
					
						if(document.getElementById('update_form')===null){
							console.log("inside");
							interval=window.setInterval(s,100);
						}
				}

				else if(elem!==undefined && elem.substring(0,7)==="lecture"){
					var size=$(this).attr('id').length;
					lectureId=parseInt(elem.substring( 8 , size ));

					console.log(lectureId+"  "+size);
					
						// if(document.getElementById('update_lecture_form')===null){
						// 	console.log("inside it");
						// 	lectureInterval=window.setInterval(r,100);
						// }
						// else{
						// 	console.log("inside else");
						// 	r();
						// };
						lectureInterval=window.setInterval(r,100);
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
			};



			function r(){
				window.clearInterval(lectureInterval);
				var update_lecture_form = document.getElementById('update_lecture_form');
					console.log(update_lecture_form);
					console.log(lectureId);


			    	update_lecture_form.addEventListener('submit', function(event) {
				        event.preventDefault();
				        console.log("tried submitting");
				        var url = "/update_lecture_post";
				        var lectureTitle = document.getElementById("update_lecture_title");
				        var lectureContent = document.getElementById("update_lecture_content");	        
				        var lecture_id=lectureId;
				     	var course=document.getElementById("lecture");
				     	console.log(lecture_id);
				        data = {
				        	lectureTitle: lectureTitle.value,	
				        	lectureContent: lectureContent.value,		
				        	lec_id: lecture_id,			        	
				         }

				         console.log(data);

				        $.ajax({
				            url: url,
				            method: "POST",
				            data: data,
				            success: function(result) {
				            	noty({text: "Updated Lecture", theme: "relax", type: 'success', layout: 'centerRight'});           
				            },
				            error: function(error){
				            	noty({text: "Cannot Update Lecture", theme: "relax", type: 'error', layout: 'topRight'});

				            }
				        });
				    });    
			};


		});


