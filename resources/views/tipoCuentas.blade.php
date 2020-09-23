@extends('adminlte::page')

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.5/css/responsive.bootstrap4.min.css">
@stop

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
            <table class="table table-bordered table-hover table-striped TB" id="TipoCuenta">
                <thead>
                    <tr>
                        <th>N</th>
                        <th>Descripción</th>
                        <th>Vida útil</th>
                        <th>Fecha Actualizado</th>
                        <th>Fecha Creado</th>
                        <th>Editar / Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($ActivoFijoC as $ActivoFijo)
                        <tr>
                            <td>{{  $ActivoFijo->idActivofijo }}</th>
                            <td>{{  $ActivoFijo->descripcionActivoFjo }}</th>
                            <td>{{  $ActivoFijo->vidaUtilActivoFijo }}</th>
                            <td>{{  $ActivoFijo->updated_at}}</td>
                            <td>{{  $ActivoFijo->created_at}}</td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-danger eliminarCuenta" Descripcion="{{  $ActivoFijo->descripcionActivoFjo }}" valor="{{  $ActivoFijo->idActivofijo }}" data-dismiss="modal">Eliminar</button>
                                    <button type="button" data-toggle="modal" data-target="#editCuentaActivo" class="btn btn-primary editarCuentaActivo" valor="{{  $ActivoFijo->idActivofijo }}" id="editarCuentaActivo">Actualizar</button>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

@include('RegtipoCuentas')
@include('edittipocuenta')
@stop

@section('js')
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
    <script src=" https://cdn.datatables.net/responsive/2.2.5/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.5/js/responsive.bootstrap4.min.js"></script>
    <script>
        $('#TipoCuenta').DataTable({
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

    <script src="../../resources/js/tipoCuenta.js"></script>
@stop
