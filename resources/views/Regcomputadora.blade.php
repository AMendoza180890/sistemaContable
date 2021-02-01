{{--Modal de crear computadoras--}}
<div class="modal" tabindex="-1" role="dialog" id="CrearComputadoras">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title">Registrar Computadoras</h1>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" action="{{route('computadora.insertar')}}">
                    @csrf
                    <div class="modal-body">
                        <div class="box-body">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputModelo">Modelo</label>
                                    <input type="text" class="form-control" name="compModelo" id="inputModelo" placeholder="ej. inspiron, Thinkpad, etc." >
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputSerie">Numero de Serie</label>
                                    <input type="text" class="form-control" name="compSerie" id="inputSerie" placeholder="ej. MYL12345678." >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputMarca">Marca</label>
                                <input type="text" class="form-control" name="compMarca" id="inputMarca" placeholder="ej. DELL, Lenovo, HP, etc." >
                            </div>
                            <div class="form-group">
                                <label for="inputAlmacenamiento">Tamaño de Almacenamiento</label>
                                <input type="text" class="form-control" name="compAlmacenamiento" id="inputAlmacenamiento"
                                    placeholder="ej. 250Gb, 1Tb, etc." >
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="InputTipoMemoria">Tipo Memoria RAM</label>
                                    <input type="text" class="form-control" name="compTipoMemoriaRAM" id="InputTipoMemoria" >
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputState">Cantidad total RAM</label>
                                    <input type="text" class="form-control" name="compCantidadRAM" id="inputState" >
                                </div>
                            </div>
                            <div class="form-group">
                                    <label for="tipoSO">Tipo SO</label>
                                    <select class="form-control" id="tipoSO" name="compTipoSO" >
                                        <option selected>elegir</option>
                                        <option value="windows10">windows10</option>
                                        <option value="windows8.1">windows8.1</option>
                                        <option value="windows7">windows7</option>
                                        <option value="Linux">Linux</option>
                                        <option value="MacOS">MacOS</option>
                                    </select>
                                </div>
                            <div class="form-group">
                                <label for="fechaCompra">Fecha Compra o donacion</label>
                                <input type="date" class="form-control" id="fechaCompra" name="compFechaCompra"
                                    placeholder="Almacenamiento" >
                            </div>
                            <div class="form-group">
                                <label for="costo">Costo</label>
                                <input type="text" class="form-control" id="costo" name="compCosto"
                                    placeholder="Costo Real o apróximado" >
                            </div>

                            <div class="form-group">
                                <label for="tipocuenta">Tipocuenta</label>
                                    <select class="form-control"name="tipocuenta" id="tipocuenta"  >
                                            <option value="valor"></option>
                                    </select>
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
