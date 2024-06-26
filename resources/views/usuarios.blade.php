@extends('adminlte::page')

@section('css')
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.5/css/responsive.bootstrap4.min.css">
@stop

@section('title', 'Cat Vehiculos')


@section('content_header')
    <h1>Catalogo de Usuarios</h1>
@stop


@section('content')
    <div class="card">
        <div class="card-header">
            <h1 class="card-title">Lista de Usuarios</h1>
        </div>
        @if (session('ExitoVehiculos'))
            <div class="alert alert-success">
                {{ session('ExitoVehiculos') }}
            </div>
        @endif
        <div class="card-body">
            <div class="card">
                <div class="box-header with-border">
                    <button class="btn btn-primary" data-toggle="modal" data-target="#CrearUsuario">Crear</button>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-hover table-striped TB" id="usuarios">
                        <thead>
                            <tr>
                                <th>id</th>
                                <th>nombre</th>
                                <th>email</th>
                                <th>password</th>
                                <th>Editar / Eliminar</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($listaUsuarios as $usuarios)
                                <tr>
                                    <td>{{ $usuarios->id }}</th>
                                    <td>{{ $usuarios->name }}</th>
                                    <td>{{ $usuarios->email }}</th>
                                    <td>{{ $usuarios->password }}</th>
                                    <td>
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-danger desactivarUsuario"
                                                valor="{{ $usuarios->id }}"
                                                descripcion="{{ $usuarios->name }}"
                                                data-dismiss="modal">Deshabilitar</button>
                                            <button type="button" data-toggle="modal" data-target="#EditUsuario"
                                                class="btn btn-primary editarUsuario"
                                                valor="{{ $usuarios->id }}" id="editarVehiculo">Ver
                                                Detalle</button>
                                        </div>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>

                <div class="card-body">
                    <table class="table table-bordered table-hover table-striped TBDeshabilitado" id="usuarios">
                        <thead>
                            <tr>
                                <th>id</th>
                                <th>nombre</th>
                                <th>email</th>
                                <th>password</th>
                                <th>Editar</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($listaUsuariosDesactivado as $usuariosDesactivado)
                                <tr>
                                    <td>{{ $usuariosDesactivado->id }}</th>
                                    <td>{{ $usuariosDesactivado->name }}</th>
                                    <td>{{ $usuariosDesactivado->email }}</th>
                                    <td>{{ $usuariosDesactivado->password }}</th>
                                    <td>
                                        <button type="button" class="btn btn-primary habilitarusuario"
                                            valor="{{ $usuariosDesactivado->id }}"
                                            descripcion="{{ $usuariosDesactivado->name }}"
                                            data-dismiss="modal">Recuperar</button>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
    @include('RegUsuarios')
    @include('editUsuarios')
@stop


@section('js')
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
    <script src=" https://cdn.datatables.net/responsive/2.2.5/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.5/js/responsive.bootstrap4.min.js"></script>
    <script>
        $('#usuarios').DataTable({
            responsive: {
                breakpoints: [{
                        name: 'bigdesktop',
                        width: Infinity
                    },
                    {
                        name: 'meddesktop',
                        width: 1480
                    },
                    {
                        name: 'smalldesktop',
                        width: 1280
                    },
                    {
                        name: 'medium',
                        width: 1188
                    },
                    {
                        name: 'tabletl',
                        width: 1024
                    },
                    {
                        name: 'btwtabllandp',
                        width: 848
                    },
                    {
                        name: 'tabletp',
                        width: 768
                    },
                    {
                        name: 'mobilel',
                        width: 480
                    },
                    {
                        name: 'mobilep',
                        width: 320
                    }
                ]
            },
            language: {
                processing: "Procesando",
                search: "Buscar:",
                lengthMenu: "Lista de Usuarios",
                info: "Elemento _START_ de _END_ en _TOTAL_ Total de elementos",
                infoEmpty: "No se ha encontrado ningun elemento en lista",
                infoFiltered: "Filtro de _MAX_ Cantidad total de elementos",
                infoPostFix: "",
                loadingRecords: "Espere un momento",
                zeroRecords: "No se ha encontrado ningun elemento en lista",
                emptyTable: "Aún no hay ningun elemento en lista",
                paginate: {
                    first: "Primer",
                    previous: "Anterior",
                    next: "Siguiente",
                    last: "Ultimo"
                }
            }
        });

    </script>
    <script src="../../resources/js/usuarios.js"></script>
@stop
