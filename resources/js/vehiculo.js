$(document).ready(function() {

    $('#tipocuenta').show(function() {
        $.ajax({
            type: 'get',
            dataType: 'json',
            url: "catalogoTipocuenta",
            success: function(data) {

                $('#tipocuenta').empty();
                for (var i = 0; i < data.length; i++) {

                    $('#tipocuenta').append('<option value="' + data[i]['idActivofijo'] + '">' + data[i]['descripcionActivoFjo'] + '</option>');
                }
                //         console.log(data);
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert(textStatus);
            }
        })
    })

    $('#tipocuentaE').show(function() {
        $.ajax({
            type: 'get',
            dataType: 'json',
            url: "catalogoTipocuenta",
            success: function(data) {

                $('#tipocuentaE').empty();
                for (var i = 0; i < data.length; i++) {

                    $('#tipocuentaE').append('<option value="' + data[i]['idActivofijo'] + '">' + data[i]['descripcionActivoFjo'] + '</option>');
                }
                //         console.log(data);
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert(textStatus);
            }
        })
    })

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
                $('#vehCodigoE').val(datosVehiculo["catVehiculoId"]);
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
                $('#catVehiculoPlacaE').val(datosVehiculo["catVehiculoPlaca"]);
                $('#tipocuentaE').val(datosVehiculo["idActivofijo"]);

                $('Form').attr('Action', 'actualizarVehiculo/' + datosVehiculo["catVehiculoId"]);
            }
        })
    })

    $('.TB').on('click', '.eliminarvehiculo', function() {
        let codVehiculoEliminar = $(this).attr('valor');
        let descVehiculoEliminar = $(this).attr('descripcion');

        let opcion = confirm("Desea Desactivar el vehiculo " + descVehiculoEliminar);

        if (opcion) {
            $.ajax({
                url: 'eliminarVehiculo/' + codVehiculoEliminar,
                type: "get",
                headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
                success: function() {
                    window.location = 'vehiculos';
                }
            })
        } else {
            console.log('no se deshabilito el vehiculo ' + descVehiculoEliminar + ' fecha ' + Date.now().toString());
        }
    })

    $('.TBDeshabilitado').on('click', '.habilitarVehiculo', function() {
        let codVehiculoEliminar = $(this).attr('valor');
        let descVehiculoEliminar = $(this).attr('descripcion');

        let opcion = confirm("Desea habilitar el vehiculo " + descVehiculoEliminar);

        if (opcion) {
            $.ajax({
                url: 'recuperarVehiculos/' + codVehiculoEliminar,
                type: "get",
                headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
                success: function() {
                    window.location = 'vehiculos';
                }
            })
        } else {
            console.log('no se habilito el vehiculo ' + descVehiculoEliminar + ' fecha ' + Date.now().toString());
        }
    })
})