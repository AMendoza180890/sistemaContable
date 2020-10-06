{{--Modal de crear computadoras--}}
<div class="modal" tabindex="-1" role="dialog" id="editImpresora">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title">Actualizar Impresoras</h1>
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
                                    <label for="inputMarcaE">Marca</label>
                                    <input type="text" class="form-control" name="inputMarcaE" id="inputMarcaE" placeholder="ej. Canon, Epson.">
                                    <input type="hidden" name="codImpresoraE" id="codImpresoraE">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputModeloE">Modelo</label>
                                    <input type="text" class="form-control" name="inputModeloE" id="inputModeloE" placeholder="ej. MYL12345678, etc.">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputTonnerE">Tipo de Tonner</label>
                                <input type="text" class="form-control" name="inputTonnerE" id="inputTonnerE" placeholder="ej. Cartucho 128, etc.">
                            </div>
                            
                            <div class="form-group">
                                <label for="impfechaCompraE">Fecha</label>
                                <input type="date" class="form-control" id="impfechaCompraE" name="impfechaCompraE"
                                    placeholder="Fecha compra o donacion">
                            </div>
                            
                            <div class="form-group">
                                <label for="impcostoE">Costo</label>
                                <input type="text" class="form-control" id="impcostoE" name="impcostoE"
                                    placeholder="Costo Real o apróximado">
                            </div>
                            
                            <div class="form-group">
                                <label for="impDescripcionE">Descripción</label>
                                <textarea class="form-control" id="impDescripcionE" name="impDescripcionE" rows="3"></textarea>
                            </div>

                            <div class="form-group">
                                <label for="tipocuenta">Tipocuenta</label>
                                    <select class="form-control"name="tipocuenta" id="tipocuenta">
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
