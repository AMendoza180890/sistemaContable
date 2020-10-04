$(document).ready(function() {
    $('.confirmPass').change(function() {
        let pass = $('.passw').val();
        let confirm = $(".confirmPass").val();

        if (pass != confirm) {
            alert('La contraseña no coinside, volver a escribirla porfavor');
        } else {

        }
    })

    //mostrar informacion del usuario
    $(".TB").on("click", ".editarUsuario", function() {
        let codEditUsuario = $(this).attr('valor');
        $.ajax({
            url: "usuarioEdit/" + codEditUsuario + '/edit',
            method: "get",
            processData: false,
            cache: false,
            contentType: false,
            dataType: "json",
            success: function(mostrarUsuario) {
                $("#UserNombreE").val(mostrarUsuario["name"]);
                $("#UserEmailE").val(mostrarUsuario["email"]);
                $('#UserPasswordE').val(mostrarUsuario["password"]);
                $("#UserPasswordConfirmE").val(mostrarUsuario["password"]);
                //$("#UserCreadoE").val(parseDate(mostrarUsuario["created_at"]));
            },
        });
    });


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