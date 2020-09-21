$(document).ready(function() {
    $('.TB').on('click', '.editarImpresora', function() {
        let codImpresora = $(this).attr('valor');

        $.ajax({
            url: "editarImpresora/" + codImpresora + "/edit",
            contentType: false,
            processData: false,
            cache: false,
            dataType: "json",
            success: function(datoImpresora) {
                $("#codImpresoraE").val(datoImpresora["catImpresorasId"]);
                $("#impcostoE").val(datoImpresora["catImpresoraCosto"]);
                $("#impDescripcionE").val(datoImpresora["catImpresoraDescripcion"]);
                $("#impfechaCompraE").val(datoImpresora["catImpresoraFechaIngreso"]);
                $("#inputModeloE").val(datoImpresora["catImpresoraModelo"]);
                $("#inputMarcaE").val(datoImpresora["catImpresorasMarca"]);
                $("#inputTonnerE").val(datoImpresora["catImpresoraTipoToner"]);
            }
        })
    })
})