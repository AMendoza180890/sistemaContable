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
})