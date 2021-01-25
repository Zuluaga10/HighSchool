$(function() {

	$("#agregar_producto").on("click",function(){
		var codigo_add=$("#codigo").val();
		var nombre_add=$("#nombre").val();
		var vehiculo_add=$("#vehiculo").val();
		var servicio_add=$("#servicio").val();
		var estado_add=$("#estado").val();
		if (codigo_add.length>0 && nombre_add.length>0 && vehiculo_add.length>0 && servicio_add.length>0) {
		$("#cantidad").removeAttr("disabled").focus();
		$("#producto").removeAttr("disabled");
		$("#agregar_detalle").removeAttr("disabled");

		$("#codigo").attr("disabled","disabled");
		$("#nombre").attr("disabled","disabled");
		$("#vehiculo").attr("disabled","disabled");
		$("#servicio").attr("disabled","disabled");
		$("#estado").attr("disabled","disabled");
		$("#agregar_producto").attr("disabled","disabled");

		$.ajax({
		dataType:'json',
		type:'post',
		url:url+"Kit/registrarKit",
		data:{codigo:codigo_add, nombre:nombre_add, vehiculo:vehiculo_add, servicio:servicio_add, estado:estado_add}
	})
       }
	});

	$("#agregar_servicio").on("click",function(){
		var cliente_add=$("#cliente").val();
		var placa_add=$("#placa").val();
		var marca_add=$("#marca").val();
		var fecha_add=$("#fecha").val();
		var tvehiculo_add=$("#tvehiculo").val();
		var empleado_add=$("#empleado").val();
		var estado_add=$("#estado").val();
		var descripcion_add=$("#descripcion").val();
		// alert (fecha_add);
		if (placa_add.length>0 && marca_add.length>0 && fecha_add.length>0 && tvehiculo_add.length>0 && empleado_add.length>0 && estado_add.length>0 && descripcion_add.length>0) {
		$("#servicios").removeAttr("disabled");
		$("#agregar_detalleOrden").removeAttr("disabled");

		$("#cliente").attr("disabled","disabled");
		$("#placa").attr("disabled","disabled");
		$("#marca").attr("disabled","disabled");
		$("#fecha").attr("disabled","disabled");
		$("#tvehiculo").attr("disabled","disabled");
		$("#empleado").attr("disabled","disabled");
		$("#estado").attr("disabled","disabled");
		$("#descripcion").attr("disabled","disabled");
		$("#agregar_servicio").attr("disabled","disabled");

		$.ajax({
		dataType:'json',
		type:'post',
		url:url+"OrdenServicio/registrarOrdenServicio",
		data:{placa:placa_add, marca:marca_add, fecha:fecha_add, tvehiculo:tvehiculo_add, empleado:empleado_add, estado:estado_add, descripcion:descripcion_add}
	})
       }
	});

	$("#agregar_detalle").on("click",function(){
		var cantidad_add=$("#cantidad").val();
		var producto_add=$("#producto").val();

		$.ajax({
		dataType:'json',
		type:'post',
		url:url+"Kit/registrarDetalle",
		data:{cantida:cantidad_add, product:producto_add}
	}).done(function(respuesta){
		$("#mytabla tbody").empty();
		for (var i = 0; i< respuesta.length; i++) {
			$("#mytabla tbody").append("<tr><td>"+respuesta[i].nombre+"</td><td>"+respuesta[i].cantidad+"</td></tr>");
		}

	}).fail(function(){})
	
	});

	$("#agregar_detalleOrden").on("click",function(){
		var servicios_add=$("#servicios").val();

		$.ajax({
		dataType:'json',
		type:'post',
		url:url+"OrdenServicio/registrarDetalleOrden",
		data:{servicios:servicios_add}
	}).done(function(respuesta){
		$("#mytabla tbody").empty();
		for (var i = 0; i< respuesta.length; i++) {
			$("#mytabla tbody").append("<tr><td>"+respuesta[i].nombre+"</td></tr>");
		}

	}).fail(function(){})
	
	});
});

function cambiarEstado(codi,esta){
	$.ajax({
		dataType:'json',
		type:'post',
		url:url+"UnidadMedida/cambiarEstado",
		data:{codigo:codi, estado:esta}
	}).done(function(respuesta){
		if (respuesta.b=="1") {
			//alert("si");
			 location.href = url+"UnidadMedida";
		}else{
			//alert("no");
			 location.href = url+"UnidadMedida";
		}

	}).fail(function(){})
}



function cambiarEstadoVehiculo(codi,esta){

	$.ajax({
		datatype:'json',
		type:'post', 
		url:url+"TipoVehiculo/cambiarEstado",
		data:{codigo:codi, estado:esta}
	}).done(function(respuesta){

		if (respuesta.b=="1") {

			location.href = url+"TipoVehiculo";
		}else{

			location.href = url+ "TipoVehiculo";
		}

	}).fail(function(){})
}


	function cambiarEstadoServicio(codi,esta){

	$.ajax({
		datatype:'json',
		type:'post', 
		url:url+"Servicio/cambiarEstado",
		data:{codigo:codi, estado:esta}
	}).done(function(respuesta){

		if (respuesta.b=="1") {

			location.href = url+"Servicio";
		}else{

			location.href = url+ "Servicio";
		}

	}).fail(function(){})
}

function cambiarEstadoCliente(codi,esta){
	$.ajax({
		dataType:'json',
		type:'POST',
		url:url+"Cliente/cambiarEstado",
		data:{documento:codi, estado:esta}
	}).done(function(respuesta){
		if (respuesta.b=="1") {
			//alert("si");
			 location.href = url+"Cliente";
		}else{
			//alert("no");
			 location.href = url+"Cliente";
		}

	}).fail(function(){})
}


function cambiarEstadoEmpleado(codi,esta){
	$.ajax({
		dataType:'json',
		type:'POST',
		url:url+"Empleado/cambiarEstado",
		data:{cedula:codi, estado:esta}
	}).done(function(respuesta){
		if (respuesta.b=="1") {
			//alert("si");
			 location.href = url+"Empleado";
		}else{
			//alert("no");
			 location.href = url+"Empleado";
		}

	}).fail(function(){})
}