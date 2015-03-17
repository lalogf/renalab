var ready = function() {
	var upre, upost, ppre, ppost;
	$("#am_hto").change(function(){
		$("#am_hb").val(($("#am_hto").val()/3.0).toFixed(2))
	});
	$("#am_peso_pre").change(function(){
		ppre = $("#am_peso_pre").val();
	});
	$("#am_peso_post").change(function(){
		ppost = $("#am_peso_post").val();
	});
	$("#am_urea_pre").change(function(){
		upre = $("#am_urea_pre").val();
	});
	$("#am_urea_post").change(function(){
		upost = $("#am_urea_post").val();
		if (upre > 0 && upost > 0 ){
			var urr = ((1-(upost/upre))*100).toFixed(2)
			var ktv = (-(Math.log((upost / upre) - 0.008*3.25)) + ((4 - 3.5*(upost / upre))*(ppre - ppost) / ppost)).toFixed(2)
			$("#am_urr").val(urr);
			$("#am_ktv").val(ktv);
		};
	});

};

$(document).ready(ready);
$(document).on('page:load', ready);
