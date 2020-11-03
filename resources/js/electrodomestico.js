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

    $('.TB').on('click', '.editarElectrodomestico', function() {
        let codElectrodomestico = $(this).attr('valor');

        $.ajax({
            url: "editarElectrodomestico/" + codElectrodomestico + "/edit",
            contentType: false,
            processData: false,
            cache: false,
            dataType: "json",
            success: function(datoElectrodomestico) {
                $("#idElectE").val(datoElectrodomestico["CatElectId"]);
                $("#electdescripcionE").val(datoElectrodomestico["CatElectDescripcion"]);
                $("#electFechaE").val(datoElectrodomestico["CatElectFechaIngreso"]);
                $("#electmarcaE").val(datoElectrodomestico["CatElectMarca"]);
                $("#electmodeloE").val(datoElectrodomestico["CatElectModelo"]);
                $("#electcostoE").val(datoElectrodomestico["CatElectCosto"]);
                $("#tipocuentaE").val(datoElectrodomestico["idActivofijo"]);

                $('Form').attr('Action', 'actualizarElectrodomestico/' + datoElectrodomestico["CatElectId"]);
            }
        })
    })

    $('.TB').on('click', '.eliminarElectrodomestico', function() {
        let codelectrodomesticoEliminar = $(this).attr('valor');
        let descelectrodomesticoEliminar = $(this).attr('descripcion');

        let opcion = confirm("Desea Desactivar el electrodomestico " + descelectrodomesticoEliminar);

        if (opcion) {
            $.ajax({
                url: 'eliminiarElectrodomestico/' + codelectrodomesticoEliminar,
                type: "get",
                headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
                success: function() {
                    window.location = 'electrodomesticos';
                }
            })
        } else {
            console.log('no se elimino la cuenta ' + descelectrodomesticoEliminar + ' fecha ' + Date.now().toString());
        }
    })

    $('.TBDeshablitado').on('click', '.habilitarElectrodomestico', function() {
        let codelectrodomesticoHabilitar = $(this).attr('valor');
        let descelectrodomesticoHabilitar = $(this).attr('descripcion');

        let opcion = confirm("Desea deshabilitar el electrodomestico " + descelectrodomesticoHabilitar);

        if (opcion) {
            $.ajax({
                url: 'recuperarElectrodomesticos/' + codelectrodomesticoHabilitar,
                type: "get",
                headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
                success: function() {
                    window.location = 'electrodomesticos';
                }
            })
        } else {
            console.log('no se deshabilito el electrodomestico ' + descelectrodomesticoHabilitar + ' fecha ' + Date.now().toString());
        }
    });
    //reporte
    $('.TB').on('click', '#ReporteElectrodomestico', function() {
        let codElectrodomestico = $(this).attr('valor');

        $.ajax({
            url: 'RptElectrodomesticoPDF/' + codElectrodomestico,
            type: 'get',
            headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
            success: function() {
                window.location = 'RptElectrodomesticoPDF/' + codElectrodomestico;
            }
        })
    });
})