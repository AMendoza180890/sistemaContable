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
                <form method="POST" action="{{route('impresora.insertar')}}">
                    @csrf
                    <div class="modal-body">
                        <div class="box-body">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputMarca">Marca</label>
                                    <input type="text" class="form-control" name="impMarca" id="inputMarca" placeholder="ej. Canon, Epson.">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputModelo">Modelo</label>
                                    <input type="text" class="form-control" name="impModelo" id="inputModelo" placeholder="ej. MYL12345678, etc.">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputTonner">Tipo de Tonner</label>
                                <input type="text" class="form-control" name="TipoTonner" id="inputTonner" placeholder="ej. Cartucho 128, etc.">
                            </div>
                            
                            <div class="form-group">
                                <label for="impfechaCompra">Fecha</label>
                                <input type="date" class="form-control" id="impfechaCompra" name="impFecha"
                                    placeholder="Fecha compra o donacion">
                            </div>
                            
                            <div class="form-group">
                                <label for="impcosto">Costo</label>
                                <input type="text" class="form-control" id="impcosto" name="impCosto"
                                    placeholder="Costo Real o apróximado">
                            </div>
                            
                            <div class="form-group">
                                <label for="impDescripcion">Descripción</label>
                                <textarea class="form-control" id="impDescripcion" name="impDescripcion" rows="3"></textarea>
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
