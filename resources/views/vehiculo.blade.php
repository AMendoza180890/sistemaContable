@extends('adminlte::page')

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.5/css/responsive.bootstrap4.min.css">
@stop

@section('title', 'Cat Vehiculos')


@section('content_header')
    <h1>Catalogo de Vehiculos</h1>
@stop


@section('content')
    <div class="card">
        <div class="card-header">
            <h1 class="card-title">Lista de Vehiculos</h1>
        </div>
        @if (session('ExitoVehiculos'))
            <div class="alert alert-success">
                {{session('ExitoVehiculos')}}
            </div>
        @endif
        <div class="card-body">
           <div class="card">
        <div class="box-header with-border">
            <button class="btn btn-primary" data-toggle="modal" data-target="#CrearVehiculo">Crear</button>
        </div>
        <div class="card-body">
           <table class="table table-bordered table-hover table-striped TB" id="Terrenos">
                     <thead>
                         <tr>
                             <th>N</th>
                             <th>Tipo</th>
                             <th>Modelo</th>
                             <th>Color</th>
                             <th>Motor</th>
                             <th>Chasis</th>
                             <th>VIM</th>
                             <th>Pasajeros</th>
                             <th>Combustible</th>
                             <th>Uso</th>
                             <th>Año</th>
                             <th>Cilindro</th>
                             <th>Servicios</th>
                             <th>Propietario</th>
                             <th>FechaCompra</th>
                             <th>Costo</th>
                             <th>Editar / Eliminar</th>
                         </tr>
                     </thead>
                        <tbody>
                            @foreach ($listaVehiculos as $vehiculo)
                            <tr>
                                <td>{{$vehiculo -> catVehiculoId }}</th>
                                <td>{{$vehiculo -> catVehiculoTipo }}</th>
                                <td>{{$vehiculo -> catVehiculoModelo }}</th>
                                <td>{{$vehiculo -> catVehiculoColor }}</th>
                                <td>{{$vehiculo -> catVehiculoMotor }}</td>
                                <td>{{$vehiculo -> catVehiculoChasis }}</td>
                                <td>{{$vehiculo -> catVehiculoVIM }}</td>
                                <td>{{$vehiculo -> catVehiculoCantPasajeros }}</td>
                                <td>{{$vehiculo -> catVehiculoCombustible }}</td>
                                <td>{{$vehiculo -> catVehiculoUso }}</td>
                                <td>{{$vehiculo -> catVehiculoAnio }}</td>
                                <td>{{$vehiculo -> catVehiculoCilindro }}</td>
                                <td>{{$vehiculo -> catVehiculoServicio }}</td>
                                <td>{{$vehiculo -> catVehiculoPropietario }}</td>
                                <td>{{$vehiculo -> catVehiculoFechaCompra }}</td>
                                <td>{{$vehiculo -> catVehiculoCosto }}</td>
                                <td>
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Eliminar</button>
                                        <button type="button" data-toggle="modal" data-target="ActualizarVehiculos" class="btn btn-primary">Actualizar</a>
                                    </div>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                </table>
                </div>
            </div> 
        </div>
    </div>
    @include('Regvehiculo')
    @include('editvehiculo')
@stop


@section('js')
   <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
     <script src=" https://cdn.datatables.net/responsive/2.2.5/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.5/js/responsive.bootstrap4.min.js"></script>
    <script>
        $('#Terrenos').DataTable({
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
@stop