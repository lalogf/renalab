var depo, depid;
var ready = function(){
	$.ajax({
		url: "https://powerful-hollows-4606.herokuapp.com/departamentos.json",
		headers: {
			'Accept': 'application/json',
			'Content-Type': 'application/json'
		},
		type: "GET",
		success: function(data) {
			$("#paciente_departamento").empty();
			depo = data;
			$(data).each(function (i) {
				$("#paciente_departamento").append("<option value=\""+data[i].departamento +"\" number=\""+data[i].id+"\" id=\""+i+"\" >"+data[i].departamento+"</option>");
			});
			$("#paciente_provincia").empty();
			$(data[0].provincias).each(function(i){
				$("#paciente_provincia").append("<option value= \""+ data[0].provincias[i].provincia.nombre + "\" number = \"" + data[0].provincias[i].provincia.id + "\" id=\""+i+"\"  >" + data[0].provincias[i].provincia.nombre + "</option>");
			});
			$("#paciente_distrito").empty();
			$(data[0].provincias[0].distritos).each(function(i){
				$("#paciente_distrito").append("<option value= \""+ data[0].provincias[0].distritos[i].nombre + "\" number = \"" + data[0].provincias[0].distritos[i].id + "\" id=\""+i+"\" >" + data[0].provincias[0].distritos[i].nombre + "</option>");
				
			});	

		},
		error: function() {
			alert("something went wrong ..."); 
		}
	});

	$("#paciente_departamento").change(function(){
		depid = $("#paciente_departamento").find(':selected').attr('id');
		var provs = depo[depid].provincias;
		var distritos_op1 = provs[0].distritos
		$("#paciente_provincia").empty();
		$(provs).each(function(i){
				$("#paciente_provincia").append("<option value= \""+ provs[i].provincia.nombre + "\" number = \"" + provs[i].provincia.id + "\" id=\""+ i +"\" >" + provs[i].provincia.nombre + "</option>");
			});
			$("#paciente_distrito").empty();
			$(distritos_op1).each(function(i){
				$("#paciente_distrito").append("<option value= \""+ distritos_op1[i].nombre + "\">" + distritos_op1[i].nombre + "</option>");
			});
	});

	$("#paciente_provincia").change(function(){
		var provid = $("#paciente_provincia").find(':selected').attr('id');
		var distritos_provincia_selected = depo[depid].provincias[provid].distritos;
		$("#paciente_distrito").empty();
		$(distritos_provincia_selected).each(function(i){
			$("#paciente_distrito").append("<option value= \""+ distritos_provincia_selected[i].nombre + "\">" + distritos_provincia_selected[i].nombre +   "</option>");
		});
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);
