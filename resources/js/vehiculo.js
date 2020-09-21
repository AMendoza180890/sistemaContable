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
})