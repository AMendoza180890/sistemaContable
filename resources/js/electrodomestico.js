$(document).ready(function() {
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

    $('.TBDeshablitado').on('click', '.eliminarElectrodomestico', function() {
        let codelectrodomesticoEliminar = $(this).attr('valor');
        let descelectrodomesticoEliminar = $(this).attr('descripcion');

        let opcion = confirm("Desea deshabilitar el electrodomestico " + descelectrodomesticoEliminar);

        if (opcion) {
            $.ajax({
                url: 'recuperarElectrodomesticos/' + codelectrodomesticoEliminar,
                type: "get",
                headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
                success: function() {
                    window.location = 'electrodomesticos';
                }
            })
        } else {
            console.log('no se deshabilito el electrodomestico ' + descelectrodomesticoEliminar + ' fecha ' + Date.now().toString());
        }
    })
})