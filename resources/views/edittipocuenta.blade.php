{{--Modal de crear Cuentas de activo Fijo--}}
<div class="modal" tabindex="-1" role="dialog" id="editCuentaActivo">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title">Actualizar Tipo Cuentas</h1>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            <form method="post" action="" >
                    {{--role="form" enctype="multipart/form-data"--}}
                    @csrf
                    @method('put')
                    <div class="modal-body">
                        <div class="box-body">
                            <div class="form-group">
                                <h4>Codigo Cuenta:</h4>
                                <input type="text" class="form-control input-lg" name="CodigoCuentaE" id="CodigoCuentaE" required>
                                <input type="hidden" name="activoCodigoE" id="activoCodigoE">
                            </div>
                            <div class="form-group">
                                <h4>Descripción:</h4>
                                <input type="text" class="form-control input-lg" name="activoDescripcionE" id="activoDescripcionE" required>
                            </div>
                            <div class="form-group">
                                <h4>Vida Util:</h4>
                                <input type="text" class="form-control input-lg" name="activoVidaUtilE" id="activoVidaUtilE" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary">Actualizar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
