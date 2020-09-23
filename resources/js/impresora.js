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

    $('.TB').on('click', '.eliminarImpresora', function() {
        let codImpresoraEliminar = $(this).attr('valor');
        let descImpresoraEliminar = $(this).attr('descripcion');

        let opcion = confirm("Desea eliminar la impresora " + descImpresoraEliminar);

        if (opcion) {
            $.ajax({
                url: 'eliminarImpresora/' + codImpresoraEliminar,
                type: "get",
                headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
                success: function() {
                    window.location = 'impresoras';
                }
            })
        } else {
            console.log('no se elimino la cuenta ' + descImpresoraEliminar + ' fecha ' + Date.now().toString());
        }
    })
})