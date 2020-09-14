let $j = jQuery.noConflict();
$j(document).ready(function() {
    $j('.TB').on('click', '.editarVehiculo', function() {
        let table = $j('#vehiculos').DataTable();

        $tr = $(this).closest('tr');
        if ($($tr).hasClass('child')) {
            $tr = $tr.prev('.parent')
        }

        let data = table.row($tr).data();
        console.log(data);
        $('#vehCodigoE').val(data[0]);
        $('#vehTipoE').val(data[1]);
        $('#vehModeloE').val(data[2]);
        $('#vehColorE').val(data[3]);
        $('#vehMotorE').val(data[4]);
        $('#vehCilindroE').val(data[11]);
        $('#vehcombustibleE').val(data[8]);
        $('#vehChasisE').val(data[5]);
        $('#vehVIME').val(data[6]);
        $('#vehUsoE').val(data[9]);
        $('#vehAnioE').val(data[10]);
        //$('#vehPasajerosE').html(val(data[11]));
        $("#" + data[7] + "").attr('selected', 'selected');
        $('#vehServicioE').val(data[12]);
        $('#vehPropietarioE').val(data[13]);
        $('#vehFechaE').val(data[14]);
        $('#vehCostoE').val(data[15]);

        $("#ActualizarVehiculos").attr("action", "{{route('vehiculo.edit',['catVehiculoId' => " + data[0] + "])}");

        console.log(data[5]);
    })
})