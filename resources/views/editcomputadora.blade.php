{{--Modal de crear computadoras--}}
<div class="modal" tabindex="-1" role="dialog" id="editcomputadora">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title">Actualizar Computadoras</h1>
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
                                    <label for="inputModeloE">Modelo</label>
                                    <input type="text" class="form-control" name="inputModeloE" id="inputModeloE" placeholder="ej. inspiron, Thinkpad, etc." >
                                    <input type="hidden" name="compIdE" id="compIdE">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputSerieE">Numero de Serie</label>
                                    <input type="text" class="form-control" name="inputSerieE" id="inputSerieE" placeholder="ej. MYL12345678." >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputMarcaE">Marca</label>
                                <input type="text" class="form-control" name="inputMarcaE" id="inputMarcaE" placeholder="ej. DELL, Lenovo, HP, etc." >
                            </div>
                            <div class="form-group">
                                <label for="inputAlmacenamientoE">Tamaño de Almacenamiento</label>
                                <input type="text" class="form-control" name="inputAlmacenamientoE" id="inputAlmacenamientoE"
                                    placeholder="ej. 250Gb, 1Tb, etc." >
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="InputTipoMemoriaE">Tipo Memoria RAM</label>
                                    <input type="text" class="form-control" name="InputTipoMemoriaE" id="InputTipoMemoriaE" >
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="cantTotalRamE">Cantidad total RAM</label>
                                    <input type="text" class="form-control" name="cantTotalRamE" id="cantTotalRamE" >
                                </div>
                            </div>
                            <div class="form-group">
                                    <label for="compTipoSOE">Tipo SO</label>
                                    <select class="form-control" id="compTipoSOE" name="compTipoSOE" >
                                        <option selected>elegir</option>
                                        <option value="windows10">windows10</option>
                                        <option value="windows8.1">windows8.1</option>
                                        <option value="windows7">windows7</option>
                                        <option value="Linux">Linux</option>
                                        <option value="MacOS">MacOS</option>
                                    </select>
                                </div>
                            <div class="form-group">
                                <label for="compFechaCompraE">Fecha Compra o donacion</label>
                                <input type="date" class="form-control" id="compFechaCompraE" name="compFechaCompraE"
                                    placeholder="Almacenamiento" >
                            </div>
                            <div class="form-group">
                                <label for="compCostoE">Costo</label>
                                <input type="text" class="form-control" id="compCostoE" name="compCostoE"
                                    placeholder="Costo Real o apróximado" >
                            </div>

                            <div class="form-group">
                                <label for="tipocuentaE">Tipocuenta</label>
                                    <select class="form-control" name="tipocuentaE" id="tipocuentaE" >
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
