$(document).ready(function() {
    $('.TB').on('click', '.editarCuentaActivo', function() {
        let codTipocuenta = $(this).attr('valor');

        $.ajax({
            url: "editarTipocuenta/" + codTipocuenta + "/edit",
            contentType: false,
            processData: false,
            cache: false,
            dataType: "json",
            success: function(datoTipocuenta) {
                $("#activoCodigoE").val(datoTipocuenta["idActivofijo"]);
                $("#activoDescripcionE").val(datoTipocuenta["descripcionActivoFjo"]);
                $("#activoVidaUtilE").val(datoTipocuenta["vidaUtilActivoFijo"]);
            }
        })
    })
})