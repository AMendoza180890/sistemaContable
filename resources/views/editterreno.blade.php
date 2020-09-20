{{--Modal de crear Terreno--}}
<div class="modal" tabindex="-1" role="dialog" id="EditTerreno">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title">Actualizar Terrenos</h1>
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
                                <input type="text" class="form-control input-lg" name="TerrenoPropiedadE" id="TerrenoPropiedadE" require>
                                <input type="hidden" name="codigoTerreno" id="codigoTerrenoE">
                            </div>
                            <div class="form-group">
                                <h4>Area:</h4>
                                <input type="text" class="form-control input-lg" name="TerrenoAreaE" id="TerrenoAreaE" require>
                            </div>
                            <div class="form-group">
                                <h4>FechaCompra:</h4>
                                <input type="date" class="form-control input-lg" name="TerrenofechaCompraE" id="TerrenofechaCompraE" require>
                            </div>
                            <div class="form-group">
                                <h4>Costo:</h4>
                                <input type="text" class="form-control input-lg" name="TerrenoCostoE" id="TerrenoCostoE" require>
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
