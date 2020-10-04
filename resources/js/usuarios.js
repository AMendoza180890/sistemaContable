$(document).ready(function() {
    $('.confirmPass').change(function() {
        let pass = $('.passw').val();
        let confirm = $(".confirmPass").val();

        if (pass != confirm) {
            alert('La contraseña no coinside, volver a escribirla porfavor');
        } else {

        }
    })

    $(".TB").on("click", ".desactivarUsuario", function() {
        let codUsuarioDeshabilitar = $(this).attr("valor");
        let descUsuarioDeshabilitar = $(this).attr("descripcion");

        let opcion = confirm(
            "Desea Desactivar el usuario " + descUsuarioDeshabilitar
        );

        if (opcion) {
            $.ajax({
                url: "eliminarUsuario/" + codUsuarioDeshabilitar,
                type: "get",
                headers: {
                    "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr(
                        "content"
                    ),
                },
                success: function() {
                    window.location = "usuarios";
                },
            });
        } else {
            console.log(
                "no se deshabilito el usuario " +
                descUsuarioDeshabilitar +
                " fecha " +
                Date.now().toString()
            );
        }
    });

    $(".TBDeshabilitado").on("click", ".habilitarusuario", function() {
        let codUsuarioactivar = $(this).attr("valor");
        let descUsuarioactivar = $(this).attr("descripcion");

        let opcion = confirm(
            "Desea habilitar el usuario " + descUsuarioactivar
        );

        if (opcion) {
            $.ajax({
                url: "recuperarUsuario/" + codUsuarioactivar,
                type: "get",
                headers: {
                    "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr(
                        "content"
                    ),
                },
                success: function() {
                    window.location = "usuarios";
                },
            });
        } else {
            console.log(
                "no se habilito el usuario " +
                descUsuarioactivar +
                " fecha " +
                Date.now().toString()
            );
        }
    });
})