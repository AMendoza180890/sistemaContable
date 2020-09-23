$(document).ready(function() {
    $('.TB').on('click', '.editarcomputadoras', function() {
        let codComputadora = $(this).attr('valor');

        $.ajax({
            url: "editarComputadora/" + codComputadora + "/edit",
            contentType: false,
            processData: false,
            cache: false,
            dataType: "json",
            success: function(datoComputadora) {
                $("#compIdE").val(datoComputadora["catEquipoCompId"]);
                $("#cantTotalRamE").val(datoComputadora["catEquipoCantidadRAM"]);
                $("#compCostoE").val(datoComputadora["catEquipoCostoEquipo"]);
                $("#compFechaCompraE").val(datoComputadora["catEquipoFechaCompra"]);
                $("#inputMarcaE").val(datoComputadora["catEquipoMarca"]);
                $("#inputModeloE").val(datoComputadora["catEquipoModelo"]);
                $("#inputSerieE").val(datoComputadora["catEquipoNumeroSerie"]);
                $("#inputAlmacenamientoE").val(datoComputadora["catEquipoTamanioAlmacenamiento"]);
                $("#compTipoSOE").val(datoComputadora["catEquipoTipoSO"]);
                $("#InputTipoMemoriaE").val(datoComputadora["TipoMemoriaRAM"]);
            }
        })
    })

    $('.TB').on('click', '.eliminarComputadora', function() {
        let codComputadoraEliminar = $(this).attr('valor');
        let descComputadoraEliminar = $(this).attr('descripcion');

        let opcion = confirm("Desea eliminar la computadora " + descComputadoraEliminar);

        if (opcion) {
            $.ajax({
                url: 'eliminarComputadora/' + codComputadoraEliminar,
                type: "get",
                headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
                success: function() {
                    window.location = 'computadoras';
                }
            })
        } else {
            console.log('no se elimino la cuenta ' + descComputadoraEliminar + ' fecha ' + Date.now().toString());
        }
    })
})