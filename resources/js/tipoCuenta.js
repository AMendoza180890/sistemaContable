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
                // se agrega la accion enrutando a la direccion de actualizar Tipo Cuenta.
                $('Form').attr('Action', 'actualizarTipocuenta/' + datoTipocuenta["idActivofijo"]);
            }
        })
    })

    $('.TB').on('click', '.eliminarCuenta', function() {
        let codTipoCuentaEliminar = $(this).attr('valor');
        let descTipoCuentaEliminar = $(this).attr('descripcion');

        let opcion = confirm("Desea eliminar la cuenta " + descTipoCuentaEliminar);

        if (opcion) {
            $.ajax({
                url: 'eliminarTipocuenta/' + codTipoCuentaEliminar,
                type: "get",
                headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
                success: function() {
                    window.location = 'tipoCuentas';
                }
            })
        } else {
            console.log('no se elimino la cuenta ' + descTipoCuentaEliminar + ' fecha ' + Date.now().toString());
        }
    })

    // modulo de habilitar Cuentas.
    $('.TBDeshabilitado').on('click', '.habilitarCuenta', function() {
        let codTipoCuentaHabilitar = $(this).attr('valor');
        let descTipoCuentaHabilitar = $(this).attr('descripcion');

        let opcion = confirm("Desea habilitar la cuenta " + descTipoCuentaHabilitar);

        if (opcion) {
            $.ajax({
                url: 'recuperarTipocuenta/' + codTipoCuentaHabilitar,
                type: "get",
                headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
                success: function() {
                    window.location = 'tipoCuentas';
                }
            })
        } else {
            console.log('no se desactivo la cuenta ' + descTipoCuentaHabilitar + ' fecha ' + Date.now().toString());
        }
    })


})