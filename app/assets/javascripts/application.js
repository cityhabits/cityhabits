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

//= require turbolinks
//= require bootstrap-sprockets
//= require jquery-ui-1.10.3.custom
//= require jquery.kinetic
//= require jquery.mousewheel
//= require jquery.smoothDivScroll-1.3
//= require_tree .

$(document).on("page:change", function(){
	$("#logoParade").smoothDivScroll({
		autoScrollingMode: "always",
		autoScrollingDirection: "endlessLoopRight",
		autoScrollingStep: 1,
		autoScrollingInterval: 25
	});

	$("#logoParade").smoothDivScroll("startAutoScrolling");

	$("#logoParade").bind("mouseover", function () {
		$(this).smoothDivScroll("stopAutoScrolling");
	}).bind("mouseout", function () {
		$(this).smoothDivScroll("startAutoScrolling");
	});

	bgvidHandler();
	videoHandler()
});


function bgvidHandler(){
	if($("#bgvid").length){
		$(".bgvid-mute").click( function (){
			$("#bgvid").prop('muted', !$("#bgvid").prop('muted'));

			if($("#bgvid").prop('muted')){
				$(".bgvid-mute").addClass("fa-volume-off")
				$(".bgvid-mute").removeClass("fa-volume-up")
			}else{
				$(".bgvid-mute").addClass("fa-volume-up")
				$(".bgvid-mute").removeClass("fa-volume-off")
			}
		});
	}
}

function videoHandler(){
	if($("#load-vid").length){
		var video = document.getElementById('load-vid');
		video.onended = function(e) {
			if(location.pathname == "/"){
				window.location.href = 	"/home/index";
			}

		};
	}
}
