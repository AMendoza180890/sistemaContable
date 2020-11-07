{{--Modal de crear computadoras--}}
<div class="modal" tabindex="-1" role="dialog" id="editelectrodomestico">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title">Actualizar Electrodomestico</h1>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" action="">
                    @csrf
                    @method('put')
                    <div class="modal-body">
                        <div class="box-body">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="electmarcaE">Marca</label>
                                    <input type="text" class="form-control" name="electmarcaE" id="electmarcaE" placeholder="ej. GE, Sony, etc." required>
                                    <input type="hidden" name="idElectE" id="idElectE">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="electmodeloE">Modelo</label>
                                    <input type="text" class="form-control" name="electmodeloE" id="electmodeloE" placeholder="modelo del electro." required>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="electFechaE">Fecha</label>
                                <input type="date" class="form-control" id="electFechaE" name="electFechaE"
                                    placeholder="Fecha compra o donacion" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="electcostoE">Costo</label>
                                <input type="text" class="form-control" id="electcostoE" name="electcostoE"
                                    placeholder="Costo Real o apróximado" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="electdescripcionE">Descripción</label>
                                <textarea class="form-control" id="electdescripcionE" name="electdescripcionE" rows="3" required></textarea>
                            </div>

                            <div class="form-group">
                                <label for="tipocuentaE">Tipocuenta</label>
                                    <select class="form-control"name="tipocuentaE" id="tipocuentaE" required>
                                            <option value="valor"></option>
                                    </select>
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
