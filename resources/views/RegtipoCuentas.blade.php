{{--Modal de crear Cuentas de activo Fijo--}}
<div class="modal" tabindex="-1" role="dialog" id="CrearCuentaActivo">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title">Registrar Tipo Cuentas</h1>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" action="{{ route('tipocuenta.insertar') }}">
                    {{-- role="form" enctype="multipart/form-data"
                    --}}
                    @csrf
                    <div class="modal-body">
                        <div class="box-body">
                            <div class="form-group">
                                <h4>Codigo Cuenta:</h4>
                                <input type="text" class="form-control input-lg" name="CodigoCuentaN" required>
                            </div>
                            <div class="form-group">
                                <h4>Descripción:</h4>
                                <input type="text" class="form-control input-lg" name="activoDescripcionN" required>
                            </div>
                            <div class="form-group">
                                <h4>Vida Util:</h4>
                                <input type="text" class="form-control input-lg" name="activoVidaUtilN" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary">Crear</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
