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
                $("#tipocuentaE").val(datoImpresora["idActivofijo"])

                $('Form').attr('Action', 'actualizarImpresora/' + datoImpresora["catImpresorasId"]);
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

    $('.TB').on('click', '.eliminarImpresora', function() {
        let codImpresoraEliminar = $(this).attr('valor');
        let descImpresoraEliminar = $(this).attr('descripcion');

        let opcion = confirm("Desea Desactivar la impresora " + descImpresoraEliminar);

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

    $('.TBDeshabilitado').on('click', '.habilitarImpresora', function() {
        let codImpresorahabilitar = $(this).attr('valor');
        let descImpresorahabilitar = $(this).attr('descripcion');

        let opcion = confirm("Desea deshabilitar la impresora " + descImpresorahabilitar);

        if (opcion) {
            $.ajax({
                url: 'recuperarImpresora/' + codImpresorahabilitar,
                type: "get",
                headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
                success: function() {
                    window.location = 'impresoras';
                }
            })
        } else {
            console.log('no se deshabilito la impresora ' + descImpresorahabilitar + ' fecha ' + Date.now().toString());
        }
    })
})