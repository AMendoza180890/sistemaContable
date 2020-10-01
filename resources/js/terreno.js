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

                $('Form').attr('Action', 'actualizarTerreno/' + datos["catTerrenoId"]);
            }
        })
    })

    $('.TB').on('click', '.eliminarTerreno', function() {
        let codTerrenoEliminar = $(this).attr('valor');
        let descTerrenoEliminar = $(this).attr('descripcion');

        let opcion = confirm("Desea eliminar el registro terreno " + descTerrenoEliminar);

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
})