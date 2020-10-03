@extends('adminlte::page')

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.5/css/responsive.bootstrap4.min.css">
@stop

@section('title', 'TipoCuentas')

@section('content_header')
    <h1>Escritorio</h1>
@stop

@section('content')
    <div class="card">
        <div class="card-header">
            <h1 class="card-title">Bienvenido</h1>
        </div>
        @if (session('ExitoElectrodomestico'))
            <div class="alert alert-success">
                {{session('ExitoElectrodomestico')}}
            </div>
        @endif
        <div class="card-body">
           <div class="card">
        <div class="box-header with-border">
            <button class="btn btn-primary" data-toggle="modal" data-target="#Crearelectrodomestico">Crear</button>
        </div>
        <div class="card-body">
           <table class="table table-bordered table-hover table-striped TB" id="electrodomestico">
                     <thead>
                         <tr>
                             <th>N</th>
                             <th>Marca</th>
                             <th>Modelo</th>
                             <th>Descripcion</th>
                             <th>Fecha de Ingreso</th>
                             <th>Editar / Eliminar</th>
                         </tr>
                     </thead>
                        <tbody>
                            @foreach ($listaElectrodomesticos as $electrodomestico)
                            <tr>
                                <td>{{$electrodomestico -> CatElectId  }}</td>
                                <td>{{$electrodomestico -> CatElectMarca }}</td>
                                <td>{{$electrodomestico -> CatElectModelo }}</td>
                                <td>{{$electrodomestico -> CatElectDescripcion }}</td>
                                <td>{{$electrodomestico -> CatElectFechaIngreso }}</td>
                                <td>
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-danger eliminarElectrodomestico" valor="{{$electrodomestico -> CatElectId  }}" descripcion="{{$electrodomestico -> CatElectMarca }}" data-dismiss="modal">Deshabilitar</button>
                                        <button type="button" data-toggle="modal" data-target="#editelectrodomestico" class="btn btn-primary editarElectrodomestico" valor="{{$electrodomestico -> CatElectId  }}" id="editarElectrodomestico">Ver Detalle</button>
                                    </div>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                </table>
                </div>

                <div class="card-body">
                    <table class="table table-bordered table-hover table-striped TBDeshablitado" id="electrodomestico">
                              <thead>
                                  <tr>
                                      <th>N</th>
                                      <th>Marca</th>
                                      <th>Modelo</th>
                                      <th>Descripcion</th>
                                      <th>Fecha de Ingreso</th>
                                      <th>Editar / Eliminar</th>
                                  </tr>
                              </thead>
                                 <tbody>
                                     @foreach ($listaElectrodomesticosDeshabilitado as $electrodomestico)
                                     <tr>
                                         <td>{{$electrodomestico -> CatElectId  }}</td>
                                         <td>{{$electrodomestico -> CatElectMarca }}</td>
                                         <td>{{$electrodomestico -> CatElectModelo }}</td>
                                         <td>{{$electrodomestico -> CatElectDescripcion }}</td>
                                         <td>{{$electrodomestico -> CatElectFechaIngreso }}</td>
                                         <td>
                                                 <button type="button" class="btn btn-primary habilitarElectrodomestico" valor="{{$electrodomestico -> CatElectId  }}" descripcion="{{$electrodomestico -> CatElectMarca }}" data-dismiss="modal">Recuperar</button>
                                                 
                                         </td>
                                     </tr>
                                     @endforeach
                                 </tbody>
                         </table>
                         </div>
            </div> 
        </div>
    </div>
    @include('Regelectrodomestico')
    @include('editelectrodomestico')
@stop

@section('js')
   <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
     <script src=" https://cdn.datatables.net/responsive/2.2.5/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.5/js/responsive.bootstrap4.min.js"></script>
    <script>
        $('#electrodomestico').DataTable({
            responsive: {
                breakpoints: [
                {name: 'bigdesktop', width: Infinity},
                {name: 'meddesktop', width: 1480},
                {name: 'smalldesktop', width: 1280},
                {name: 'medium', width: 1188},
                {name: 'tabletl', width: 1024},
                {name: 'btwtabllandp', width: 848},
                {name: 'tabletp', width: 768},
                {name: 'mobilel', width: 480},
                {name: 'mobilep', width: 320}
                ]
            },
            language: {
                    processing:     "Procesando",
                    search:         "Buscar:",
                    lengthMenu:    "Lista de Equipos",
                    info:           "Elemento _START_ de _END_ en _TOTAL_ Total de elementos",
                    infoEmpty:      "No se ha encontrado ningun elemento en lista",
                    infoFiltered:   "Filtro de _MAX_ Cantidad total de elementos",
                    infoPostFix:    "",
                    loadingRecords: "Espere un momento",
                    zeroRecords:    "No se ha encontrado ningun elemento en lista",
                    emptyTable:     "Aún no hay ningun elemento en lista",
                    paginate: {
                        first:      "Primer",
                        previous:   "Anterior",
                        next:       "Siguiente",
                        last:       "Ultimo"
                    }
                }
        });
    </script>
    <script src="../../resources/js/electrodomestico.js"></script>
@stop