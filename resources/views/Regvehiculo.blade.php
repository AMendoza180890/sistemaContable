{{--Modal de crear o registrar computadoras--}}
<div class="modal" tabindex="-1" role="dialog" id="CrearVehiculo">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title">Registrar Vehiculos</h1>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" action="">
                    {{-- {{route('vehiculo.insertar')}} --}}
                    @csrf
                    <div class="modal-body">
                        <div class="box-body">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="vehTipo">Tipo</label>
                                    <input type="text" class="form-control" name="vehTipo" id="vehTipo" placeholder="ej. inspiron, Thinkpad, etc.">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="vehModelo">Modelo</label>
                                    <input type="text" class="form-control" name="vehModelo" id="vehModelo" placeholder="ej. MYL12345678.">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="vehColor">Color</label>
                                <input type="text" class="form-control" name="vehColor" id="vehColor" placeholder="ej. DELL, Lenovo, HP, etc.">
                            </div>
                            <div class="form-group">
                                <label for="vehMotor">Motor</label>
                                <input type="text" class="form-control" name="vehMotor" id="vehMotor"
                                    placeholder="ej. 250Gb, 1Tb, etc.">
                            </div>

                            <div class="form-group">
                                    <label for="vehCilindro">Cilindros</label>
                                    <select class="form-control" id="vehCilindro" name="vehCilindro">
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
                                    <select class="form-control" id="vehcombustible" name="vehcombustible">
                                        <option selected>elegir</option>
                                        <option value="Gasolina">Gasolina</option>
                                        <option value="Diésel">Diésel</option>
                                    </select>
                                </div>
                            
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="vehChasis">Chasis</label>
                                    <input type="text" class="form-control" name="vehChasis" id="vehChasis">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="vehVIM">VIM</label>
                                    <input type="text" class="form-control" name="vehVIM" id="vehVIM">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="vehUso">Uso</label>
                                    <input type="text" class="form-control" name="vehUso" id="vehUso">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="vehAnio">Año</label>
                                    <input type="text" class="form-control" name="vehAnio" id="vehAnio">
                                </div>
                            </div>


                            <div class="form-group">
                                    <label for="vehPasajeros">Pasajeros</label>
                                    <select class="form-control" id="vehPasajeros" name="vehPasajeros">
                                        <option selected>elegir</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="12">12</option>
                                        <option value="18">18</option>
                                        <option value="24">24</option>
                                    </select>
                                </div>
                            

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="vehServicio">Servicio</label>
                                    <input type="text" class="form-control" name="vehServicio" id="vehServicio">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="vehPropietario">Propietario</label>
                                    <input type="text" class="form-control" name="vehPropietario" id="vehPropietario">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="vehFecha">Fecha</label>
                                <input type="date" class="form-control" id="vehFecha" name="vehFecha"
                                    placeholder="Fecha compra o donacion">
                            </div>
                            <div class="form-group">
                                <label for="vehCosto">Costo</label>
                                <input type="text" class="form-control" id="vehCosto" name="vehCosto"
                                    placeholder="Costo Real o apróximado">
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
