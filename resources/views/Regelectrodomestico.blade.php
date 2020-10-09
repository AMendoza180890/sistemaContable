{{--Modal de crear computadoras--}}
<div class="modal" tabindex="-1" role="dialog" id="Crearelectrodomestico">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title">Registrar Impresoras</h1>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" action="{{route('electrodomestico.insertar')}}">
                    @csrf
                    <div class="modal-body">
                        <div class="box-body">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="electmarca">Marca</label>
                                    <input type="text" class="form-control" name="electmarca" id="electmarca" placeholder="ej. GE, Sony, etc." required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="electmodelo">Modelo</label>
                                    <input type="text" class="form-control" name="electmodelo" id="electmodelo" placeholder="modelo del electro." required>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="electFecha">Fecha</label>
                                <input type="date" class="form-control" id="electFecha" name="electFecha"
                                    placeholder="Fecha compra o donacion" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="electcosto">Costo</label>
                                <input type="text" class="form-control" id="electcosto" name="electcosto"
                                    placeholder="Costo Real o apróximado" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="electdescripcion">Descripción</label>
                                <textarea class="form-control" id="electdescripcion" name="electdescripcion" rows="3" required></textarea>
                            </div>

                            <div class="form-group">
                                <label for="tipocuenta">Tipocuenta</label>
                                    <select class="form-control"name="tipocuenta" id="tipocuenta" required>
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
