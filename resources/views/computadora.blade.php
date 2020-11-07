@extends('adminlte::page')

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.5/css/responsive.bootstrap4.min.css">
@stop

@section('title', 'Cat Computadoras')

@section('content_header')
    <h1>Catalogo de Computadoras</h1>
@stop

@section('content')
    <div class="card">
        <div class="card-header">
            <h1 class="card-title">Listado de Equipos</h1>
        </div>
        @if (session('mensajeExito'))
            <div class="alert alert-success">
                {{ session('mensajeExito') }};
            </div>
        @endif
        <div class="card-body">
            <div class="card">
                <div class="box-header with-border">
                    <button class="btn btn-primary" data-toggle="modal" data-target="#CrearComputadoras">Crear</button>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-hover table-striped dt-responsive TB" id="Computadoras">
                        <thead>
                            <tr>
                                <th>N</th>
                                <th>Modelo</th>
                                <th>Serie</th>
                                <th>Marca</th>
                                <th>Almacenamiento</th>
                                <th>TipoRAM</th>
                                <th>CantidadRAM</th>
                                <th>TipoSO</th>
                                <th>FechaCompra</th>
                                <th>costoEquipo</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($listaComputadoras as $computadoras)
                                <tr>
                                    <td>{{ $computadoras->catEquipoCompId }}</td>
                                    <td>{{ $computadoras->catEquipoModelo }}</td>
                                    <td>{{ $computadoras->catEquipoNumeroSerie }}</td>
                                    <td>{{ $computadoras->catEquipoMarca }}</td>
                                    <td>{{ $computadoras->catEquipoTamanioAlmacenamiento }}</td>
                                    <td>{{ $computadoras->TipoMemoriaRAM }}</td>
                                    <td>{{ $computadoras->catEquipoCantidadRAM }}</td>
                                    <td>{{ $computadoras->catEquipoTipoSO }}</td>
                                    <td>{{ $computadoras->catEquipoFechaCompra }}</td>
                                    <td>{{ $computadoras->catEquipoCostoEquipo }}</td>
                                    <td>
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-danger eliminarComputadora"
                                                valor="{{ $computadoras->catEquipoCompId }}"
                                                descripcion="{{ $computadoras->catEquipoMarca }}"
                                                data-dismiss="modal">Deshabilitar</button>
                                            <button type="button" data-toggle="modal" data-target="#editcomputadora"
                                                class="btn btn-primary editarcomputadoras"
                                                valor="{{ $computadoras->catEquipoCompId }}" id="editarcomputadoras">Ver
                                                Detalle</button>
                                            <button type="button" class="btn btn-success"
                                                valor="{{ $computadoras->catEquipoCompId }}" id="verReporte">Ver</button>

                                        </div>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>

                <div class="card-body">
                    <table class="table table-bordered table-hover table-striped dt-responsive TBDeshabilitado"
                        id="Computadoras">
                        <thead>
                            <tr>
                                <th>N</th>
                                <th>Modelo</th>
                                <th>Serie</th>
                                <th>Marca</th>
                                <th>Almacenamiento</th>
                                <th>TipoRAM</th>
                                <th>CantidadRAM</th>
                                <th>TipoSO</th>
                                <th>FechaCompra</th>
                                <th>costoEquipo</th>
                                <th>Fecha Baja</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($listaComputadorasDeshablitados as $computadoras)
                                <tr>
                                    <td>{{ $computadoras->catEquipoCompId }}</td>
                                    <td>{{ $computadoras->catEquipoModelo }}</td>
                                    <td>{{ $computadoras->catEquipoNumeroSerie }}</td>
                                    <td>{{ $computadoras->catEquipoMarca }}</td>
                                    <td>{{ $computadoras->catEquipoTamanioAlmacenamiento }}</td>
                                    <td>{{ $computadoras->TipoMemoriaRAM }}</td>
                                    <td>{{ $computadoras->catEquipoCantidadRAM }}</td>
                                    <td>{{ $computadoras->catEquipoTipoSO }}</td>
                                    <td>{{ $computadoras->catEquipoFechaCompra }}</td>
                                    <td>{{ $computadoras->catEquipoCostoEquipo }}</td>
                                    <td>{{ $computadoras->updated_at}}</td>
                                    <td>
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-primary habilitarComputadora"
                                                valor="{{ $computadoras->catEquipoCompId }}"
                                                descripcion="{{ $computadoras->catEquipoMarca }}"
                                                data-dismiss="modal">Recuperar</button>
                                            <button type="button" class="btn btn-success"
                                                valor="{{ $computadoras->catEquipoCompId }}" id="verReporteBajas">Ver</button>
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
    @include('Regcomputadora')
    @include('editcomputadora')
@stop



@section('js')
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
    <script src=" https://cdn.datatables.net/responsive/2.2.5/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.5/js/responsive.bootstrap4.min.js"></script>
    <script>
        $('#Computadoras').DataTable({
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

    <script src="../../resources/js/computadora.js"></script>
@stop
