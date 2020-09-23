$(document).ready(function() {
    $('.TB').on('click', '.editarVehiculo', function() {
        let codVehiculo = $(this).attr('valor');

        $.ajax({
            url: "editarvehiculo/" + codVehiculo + "/edit",
            contentType: false,
            processData: false,
            cache: false,
            dataType: "json",
            success: function(datosVehiculo) {
                console.log(datosVehiculo)
                $('#vehCodigoE').val(datosVehiculo["catVehiculoid"]);
                $('#vehTipoE').val(datosVehiculo["catVehiculoTipo"]);
                $('#vehModeloE').val(datosVehiculo["catVehiculoModelo"]);
                $('#vehColorE').val(datosVehiculo["catVehiculoColor"]);
                $('#vehMotorE').val(datosVehiculo["catVehiculoMotor"]);
                $('#vehCilindroE').val(datosVehiculo["catVehiculoCilindro"]);
                $('#vehcombustibleE').val(datosVehiculo["catVehiculoCombustible"]);
                $('#vehChasisE').val(datosVehiculo["catVehiculoChasis"]);
                $('#vehVIME').val(datosVehiculo["catVehiculoVIM"]);
                $('#vehUsoE').val(datosVehiculo["catVehiculoUso"]);
                $('#vehAnioE').val(datosVehiculo["catVehiculoAnio"]);
                $('#vehPasajerosE').val(datosVehiculo["catVehiculoCantPasajeros"]);
                // $("#" + datosVehiculo[7] + "").attr('selected', 'selected');
                $('#vehServicioE').val(datosVehiculo["catVehiculoServicio"]);
                $('#vehPropietarioE').val(datosVehiculo["catVehiculoPropietario"]);
                $('#vehFechaE').val(datosVehiculo["catVehiculoFechaCompra"]);
                $('#vehCostoE').val(datosVehiculo["catVehiculoCosto"]);
            }
        })
    })

    $('.TB').on('click', '.eliminarvehiculo', function() {
        let codVehiculoEliminar = $(this).attr('valor');
        let descVehiculoEliminar = $(this).attr('descripcion');

        let opcion = confirm("Desea eliminar el vehiculo " + descVehiculoEliminar);

        if (opcion) {
            $.ajax({
                url: 'eliminarVehiculo/' + codVehiculoEliminar,
                type: "get",
                headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
                success: function() {
                    window.location = 'vehiculo';
                }
            })
        } else {
            console.log('no se elimino el vehiculo ' + descVehiculoEliminar + ' fecha ' + Date.now().toString());
        }
    })
})