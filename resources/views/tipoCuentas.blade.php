@extends('adminlte::page')

@section('title', 'TipoCuentas')

@section('content_header')
    <h1>Catalogo de Tipo de Cuentas de Activo Fijo</h1>
@stop

@section('content')
    
    <div class="card">
        <div class="box-header with-border">
            <button class="btn btn-primary" data-toggle="modal" data-target="#CrearCuentaActivo">Crear</button>
        </div>
        <div class="card-body">
           <table class="table table-bordered table-hover table-striped TB">
                     <thead>
                         <tr>
                             <th>N</th>
                             <th>Descripción</th>
                             <th>Vida útil</th>
                             <th>Editar / Eliminar</th>
                         </tr>
                     </thead>
                     <tbody>
                         {{-- 
                            $verU = new UsersList();
                            $verU->verUsuarioC();

                            $item = null;
                            $valor = null;

                            $UdtUser = UpdateUserC::UpdateInfoUserC($item,$valor);
                         --}}
                    </tbody>
           </table>
        </div>
    </div> 

{{--Modal de crear Cuentas de activo Fijo--}}

<div class="modal" tabindex="-1" role="dialog" id="CrearCuentaActivo">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title">Modal title</h1>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="post" role="form" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="box-body">
                        <div class="form-group">
                            <h4>Descripción:</h4>
                            <input type="text" class="form-control input-lg" name="activoDescripcionN" require>
                        </div>
                        <div class="form-group">
                            <h4>Vida Util:</h4>
                            <input type="text" class="form-control input-lg" name="activoVidaUtilN" require>
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Crear</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                </div>
                {{-- 
                $CUsuarios = new UsuarioCrearC();
                $CUsuarios->CreateUsers();
                --}}
            </form>
      </div>
    </div>
  </div>
</div>


{{-- <div class="modal fade" role="dialog" id="CrearCuentaActivo">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" role="form" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="box-body">
                        <div class="form-group">
                            <h2>Descripción:</h2>
                            <input type="text" class="form-control input-lg" name="activoDescripcionN" require>
                        </div>
                        <div class="form-group">
                            <h2>Vida Util:</h2>
                            <input type="text" class="form-control input-lg" name="activoVidaUtilN" require>
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Crear</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                </div>
                {{-- 
                $CUsuarios = new UsuarioCrearC();
                $CUsuarios->CreateUsers();
                --}}
            {{-- </form>
        </div>
    </div>
</div>  --}}
@stop

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')
    <script> console.log('Hi!'); </script>
@stop