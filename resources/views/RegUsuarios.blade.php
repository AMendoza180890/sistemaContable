{{--Modal de crear Terreno--}}
<div class="modal" tabindex="-1" role="dialog" id="CrearUsuario">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title">Registrar Usuarios</h1>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            <form method="POST" action="{{ route('usuario.insertar') }}">
                    {{-- role="form" enctype="multipart/form-data"
                    --}}
                    @csrf
                    <div class="modal-body">
                        <div class="box-body">
                            <div class="form-group">
                                <h4>Nombre:</h4>
                                <input type="text" class="form-control input-lg" name="UserNombreN" placeholder="Escribe tu nombre de Usuario" required>
                            </div>
                            <div class="form-group">
                                <h4>Email:</h4>
                                <input type="email" class="form-control input-lg" name="UserEmailN" placeholder="Registra tu correo" required>
                            </div>
                            <div class="form-group">
                                <h4>Contraseña:</h4>
                                <input type="password" class="form-control input-lg passw" name="UserPasswordN" placeholder="Escribe una contraseña" required>
                            </div>
                            <div class="form-group">
                                <h4>Confirmar Contraseña:</h4>
                                <input type="password" class="form-control input-lg confirmPass" name="UserPasswordConfirmN" placeholder="Confirmar Contraseña" required>
                            </div>
                            <div class="form-group">
                                <h4>Creado:</h4>
                                <input type="date" class="form-control input-lg" name="UserCreadoN" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary aceptar">Crear</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
