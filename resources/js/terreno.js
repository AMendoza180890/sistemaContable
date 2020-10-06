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


    $('.TB').on('click', '#mostrar', function() {
        let value = $(this).attr('valor');
        console.log('valor = ' + value);

        $.ajax({
            url: "editarTerreno/" + value + "/edit",
            method: "GET",
            cache: false,
            contentType: false,
            processData: false,
            dataType: "json",
            success: function(datos) {
                console.log(datos);
                $("#codigoTerrenoE").val(datos["catTerrenoId"]);
                $("#TerrenoPropiedadE").val(datos["catTerrenoPropietario"]);
                $("#TerrenofechaCompraE").val(datos["catTerrenoFechaCompra"]);
                $("#TerrenoCostoE").val(datos["catterrenoCosto"]);
                $('#TerrenoAreaE').val(datos['catTerrenoArea']);
                // $("#direccionE").val(decodeURIComponent(escape(mensaje_obtenido["catclicontAdress"])));
                // $("#descripcionE").val(decodeURIComponent(escape(mensaje_obtenido["catclicontMessage"])));

                $('Form').attr('Action', 'actualizarTerreno/' + datos["catTerrenoId"]);
            }
        })
    })

    $('.TB').on('click', '.eliminarTerreno', function() {
        let codTerrenoEliminar = $(this).attr('valor');
        let descTerrenoEliminar = $(this).attr('descripcion');

        let opcion = confirm("Desea Desactivar el registro terreno " + descTerrenoEliminar);

        if (opcion) {
            $.ajax({
                url: 'eliminarTerreno/' + codTerrenoEliminar,
                type: "get",
                headers: { 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content') },
                success: function() {
                    window.location = 'terrenos';
                }
            })
        } else {
            console.log('no se elimino la cuenta ' + descTerrenoEliminar + ' fecha ' + Date.now().toString());
        }
    })

    $(".TBDeshabilitado").on("click", ".habilitarTerreno", function() {
        let codTerrenoHabilitar = $(this).attr("valor");
        let descTerrenoHabilitar = $(this).attr("descripcion");

        let opcion = confirm(
            "Desea habilitar el registro terreno " + descTerrenoHabilitar
        );

        if (opcion) {
            $.ajax({
                url: "recuperarTerreno/" + codTerrenoHabilitar,
                type: "get",
                headers: {
                    "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr(
                        "content"
                    ),
                },
                success: function() {
                    window.location = "terrenos";
                },
            });
        } else {
            console.log(
                "no se deshabilito el terreno " +
                descTerrenoHabilitar +
                " fecha " +
                Date.now().toString()
            );
        }
    });
})