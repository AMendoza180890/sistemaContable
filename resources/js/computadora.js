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
                $("#tipocuentaE").val(datoComputadora["idActivofijo"])

                $('Form').attr('Action', 'actualizarComputadora/' + datoComputadora["catEquipoCompId"]);
            }
        })
    })

    $('.TB').on('click', '.eliminarComputadora', function() {
        let codComputadoraEliminar = $(this).attr('valor');
        let descComputadoraEliminar = $(this).attr('descripcion');

        let opcion = confirm("Desea Desactivar la computadora " + descComputadoraEliminar);

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

    $('.TBDeshabilitado').on('click', '.habilitarComputadora', function() {
        let codComputadorahabilitar = $(this).attr('valor');
        let descComputadorahabilitar = $(this).attr('descripcion');

        let opcion = confirm("Desea habilitar la computadora " + descComputadorahabilitar);

        if (opcion) {
            $.ajax({
                url: 'recuperaComputadora/' + codComputadorahabilitar,
                type: "get",
                headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
                success: function() {
                    window.location = 'computadoras';
                }
            })
        } else {
            console.log('no se deshabilito la computadora ' + descComputadorahabilitar + ' fecha ' + Date.now().toString());
        }
    })

//Reportes
    $('.TB').on('click', '#verReporte', function() {
        let codComputadora = $(this).attr('valor');

        $.ajax({
            url: 'RptComputadoraPDF/' + codComputadora,
            type: 'get',
            headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
            success: function() {
                window.location = 'RptComputadoraPDF/' + codComputadora;
            }
        })
    });

    $('.TBDeshabilitado').on('click','#verReporteBajas',function(){
        let codComputadora = $(this).attr('valor');

        $.ajax({
            url:'RptComputadoraBajaPDF/' + codComputadora,
            type:'get',
            headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
            success: function(){
                window.location = 'RptComputadoraBajaPDF/' + codComputadora;
            }
        })
    });
})