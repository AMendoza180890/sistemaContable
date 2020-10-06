{{--Modal para mostrar y actualizar computadoras--}}
 <div class="modal" tabindex="-1" role="dialog" id="ActualizarVehiculos">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title">Actualizar Vehiculos</h1>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" action="">
                    {{-- {{route('vehiculo.edit',['catVehiculoId'=> $vehiculo -> catVehiculoId])}} --}}
                    @csrf
                    @method('put')
                    <div class="modal-body">
                        <div class="box-body">
                            <div class="form-row">
                                <div class="formgroup" style="display:none;">
                                    <input type="hidden" name="vehCodigoE" id="vehCodigoE">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="vehTipo">Tipo</label>
                                <input type="text" class="form-control" name="vehTipoE" id="vehTipoE" placeholder="ej. inspiron, Thinkpad, etc.">
                                {{-- {{$obtenerVehiculos -> catVehiculoTipo}} --}}
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="vehModelo">Modelo</label>
                                <input type="text" class="form-control" name="vehModeloE" id="vehModeloE"  placeholder="ej. MYL12345678.">
                                {{-- {{$obtenerVehiculos->catVehiculoModelo}} --}}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="vehColor">Color</label>
                                <input type="text" class="form-control" name="vehColorE" id="vehColorE" placeholder="ej. DELL, Lenovo, HP, etc.">
                            </div>
                            <div class="form-group">
                                <label for="vehMotor">Motor</label>
                                <input type="text" class="form-control" name="vehMotorE" id="vehMotorE"
                                    placeholder="ej. 250Gb, 1Tb, etc.">
                            </div>

                            <div class="form-group">
                                    <label for="vehCilindro">Cilindros</label>
                                    <select class="form-control" id="vehCilindroE" name="vehCilindroE">
                                        <option selected>elegir</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="4 Boxer">4 Boxer</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="6 En V">6 En V</option>
                                        <option value="6 Boxer">6 Boxer</option>
                                        <option value="6 Lineal">6 Lineal</option>
                                        <option value="8">8</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="vehcombustible">Combustible</label>
                                    <select class="form-control" id="vehcombustibleE" name="vehcombustibleE">
                                        <option selected>elegir</option>
                                        <option value="Gasolina">Gasolina</option>
                                        <option value="Diésel">Diésel</option>
                                    </select>
                                </div>
                            
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="vehChasis">Chasis</label>
                                    <input type="text" class="form-control" name="vehChasisE" id="vehChasisE">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="vehVIM">VIM</label>
                                    <input type="text" class="form-control" name="vehVIME" id="vehVIME">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="vehUso">Uso</label>
                                    <input type="text" class="form-control" name="vehUsoE" id="vehUsoE">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="vehAnio">Año</label>
                                    <input type="text" class="form-control" name="vehAnioE" id="vehAnioE">
                                </div>
                            </div>


                            <div class="form-group">
                                    <label for="vehPasajeros">Pasajeros</label>
                                    <select class="form-control" id="vehPasajerosE" name="vehPasajerosE">
                                        <option selected>elegir</option>
                                        <option id="4" value="4">4</option>
                                        <option id="5" value="5">5</option>
                                        <option id="12" value="12">12</option>
                                        <option id="18" value="18">18</option>
                                        <option id="24" value="24">24</option>
                                    </select>
                                </div>
                            

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="vehServicio">Servicio</label>
                                    <input type="text" class="form-control" name="vehServicioE" id="vehServicioE">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="vehPropietario">Propietario</label>
                                    <input type="text" class="form-control" name="vehPropietarioE" id="vehPropietarioE">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="vehFecha">Fecha</label>
                                <input type="date" class="form-control" id="vehFechaE" name="vehFechaE"
                                    placeholder="Fecha compra o donacion">
                            </div>
                            <div class="form-group">
                                <label for="vehCosto">Costo</label>
                                <input type="text" class="form-control" id="vehCostoE" name="vehCostoE"
                                    placeholder="Costo Real o apróximado">
                            </div>

                            <div class="form-group">
                                <label for="tipocuentaE">Tipocuenta</label>
                                    <select class="form-control"name="tipocuentaE" id="tipocuentaE">
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
