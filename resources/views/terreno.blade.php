@extends('adminlte::page')

@section('css')
    {{--
    <link rel="stylesheet" href="/css/admin_custom.css"> --}}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.5/css/responsive.bootstrap4.min.css">
@stop

@section('title', 'CatTerrenos')

@section('content_header')
    <h1>Catalogo de Terrenos</h1>
@stop

@section('content')
    <div class="card">
        <div class="card-header">
            <h1 class="card-title">Lista de Terrenos</h1>
        </div>
        @if (session('mensajeExitoso'))
            <div class="alert alert-success">
                {{ session('mensajeExitoso') }}
            </div>
        @endif

        <div class="card-body">
            <div class="card">
                <div class="box-header with-border">
                    <button class="btn btn-primary" data-toggle="modal" data-target="#CrearTerreno">Crear</button>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-hover table-striped TB" id="Terrenos">
                        <thead>
                            <tr>
                                <th>N</th>
                                <th>Propietario</th>
                                <th>Area</th>
                                <th>Fecha de Compra</th>
                                <th>Costo</th>
                                <th>FechaActualizado</th>
                                <th>FechaCreado</th>
                                <th>Editar / Eliminar</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($listaTerrenos as $terreno)
                                <tr>
                                    <td>{{ $terreno->catTerrenoId }}</th>
                                    <td>{{ $terreno->catTerrenoPropietario }}</th>
                                    <td>{{ $terreno->catTerrenoArea }}</th>
                                    <td>{{ $terreno->catTerrenoFechaCompra }}</th>
                                    <td>{{ $terreno->catterrenoCosto }}</td>
                                    <td>{{ $terreno->updated_at }}</td>
                                    <td>{{ $terreno->created_at }}</td>
                                    <td>
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-danger eliminarTerreno"
                                                valor="{{ $terreno->catTerrenoId }}"
                                                descripcion="{{ $terreno->catTerrenoPropietario }}"
                                                data-dismiss="modal">Deshabilitar</button>
                                            <button type="button" data-toggle="modal" data-target="#EditTerreno"
                                                class="btn btn-primary editarTerrenos" valor="{{ $terreno->catTerrenoId }}"
                                                id='mostrar'>Ver Detalle</a></button>
                                        </div>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>

                <div class="card-body">
                    <table class="table table-bordered table-hover table-striped TBDeshabilitado" id="Terrenos">
                        <thead>
                            <tr>
                                <th>N</th>
                                <th>Propietario</th>
                                <th>Area</th>
                                <th>Fecha de Compra</th>
                                <th>Costo</th>
                                <th>FechaActualizado</th>
                                <th>FechaCreado</th>
                                <th>Editar / Eliminar</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($listaTerrenosDeshabilitados as $terreno)
                                <tr>
                                    <td>{{ $terreno->catTerrenoId }}</th>
                                    <td>{{ $terreno->catTerrenoPropietario }}</th>
                                    <td>{{ $terreno->catTerrenoArea }}</th>
                                    <td>{{ $terreno->catTerrenoFechaCompra }}</th>
                                    <td>{{ $terreno->catterrenoCosto }}</td>
                                    <td>{{ $terreno->updated_at }}</td>
                                    <td>{{ $terreno->created_at }}</td>
                                    <td>
                                        <button type="button" class="btn btn-primary habilitarTerreno"
                                            valor="{{ $terreno->catTerrenoId }}"
                                            descripcion="{{ $terreno->catTerrenoPropietario }}"
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
    @include('EditTerreno')
    @include('Regterreno')
@stop



@section('js')
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
    <script src=" https://cdn.datatables.net/responsive/2.2.5/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.5/js/responsive.bootstrap4.min.js"></script>
    <script>
        $('#Terrenos').DataTable({
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
                lengthMenu: "Lista de Equipos",
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
    <script src="../../resources/js/terreno.js"></script>
@stop
