{{--Modal de crear Terreno--}}
<div class="modal" tabindex="-1" role="dialog" id="CrearTerreno">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title">Registrar Terrenos</h1>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" action="{{ route('terreno.insertar') }}">
                    {{-- role="form" enctype="multipart/form-data"
                    --}}
                    @csrf
                    <div class="modal-body">
                        <div class="box-body">
                            <div class="form-group">
                                <h4>Propiedad:</h4>
                                <input type="text" class="form-control input-lg" name="TerrenoPropiedadN" require>
                            </div>
                            <div class="form-group">
                                <h4>Area:</h4>
                                <input type="text" class="form-control input-lg" name="TerrenoAreaN" require>
                            </div>
                            <div class="form-group">
                                <h4>FechaCompra:</h4>
                                <input type="date" class="form-control input-lg" name="TerrenofechaCompraN" require>
                            </div>
                            <div class="form-group">
                                <h4>Costo:</h4>
                                <input type="text" class="form-control input-lg" name="TerrenoCostoN" require>
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
                            <button type="submit" class="btn btn-primary">Crear</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
