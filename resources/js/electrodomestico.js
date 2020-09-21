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
            }
        })
    })
})