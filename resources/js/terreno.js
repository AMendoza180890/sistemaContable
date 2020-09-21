$(document).ready(function() {
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
            }
        })
    })
})