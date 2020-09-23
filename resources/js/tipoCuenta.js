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

    $(".TB").on("click",".eliminarCuenta",function(){
        let codTipoCuentaEliminar = $(this).attr("valor");
        let DescripcionTipoCuenta = $(this).attr("Descripcion");

        let opcion = confirm("desea eliminar cuenta " + DescripcionTipoCuenta);

        if (opcion) {
            alert("codigo a eliminar " + codTipoCuentaEliminar);
        }else{
            alert("no se eliminara ninguna cuenta");
        }

        
    })
})