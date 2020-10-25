@extends('adminlte::page')

@section('css')
    {{-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.5/css/responsive.bootstrap4.min.css"> --}}

    {{--CSS BOTON EXPORTACION--}}
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.6.4/css/buttons.dataTables.min.css">
    {{--FIN CSS EXPORTACION--}}
@stop

@section('title', 'Reporte Activo Fijo')

@section('content_header')
    <h1>Reporte de cuenta de Activo Fijo</h1>
@stop

@section('content')
    <div class="card">
        @if (session('mensajeExito'))
            <div class="alert alert-success">
                {{ session('mensajeExito') }}
            </div>
        @endif
        
        <div class="box-header with-border">
            <form method="POST" action="{{ route('rptConsolidado.show') }}">
                @csrf
                <label for="dateConsolidadoReporteActivo" >
                    <h4>Fecha de Reporte</h4>
                    <input type="date" name="dateConsolidadoReporteActivo" id="dateConsolidadoReporteActivo" required>
                    <input type="submit" value="Generar Reporte">
                </label>
            </form>
        </div>
        

        <div class="card-body">
            <h4 id="tituloFechaSeleccionada"></h4>
            <table class="table table-bordered table-hover table-striped TB" id="Reporte">
                <thead>
                    <tr>
                        <th>CATEGORIA</th>
                        <th>DETALLE_ACTIVO</th>
                        <th>COSTO</th>
                        <th>DEPRECIACION MENSUAL</th>
                        <th>DEPRECIACION ACUMULADA</th>
                        <th>VALOR EN LIBRO</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($consolidadoActivo as $listado)    
                    <tr>
                        <td>{{$listado->CATEGORIA}}</th>
                        <td>{{$listado->DETALLE_ACTIVO}}</th>
                        <td>{{"C$ ". $listado->COSTO}}</th>
                        <td>{{"C$ ". $listado->DEPRECIACIONTOTALMENSUAL}}</td>
                        <td>{{"C$ ". $listado->DEPRECIACIONTOTALACUMULADA}}</td>
                        <td>{{"C$ ". $listado->SALDOTOTALLIBRO}}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

@stop

@section('js')
    {{--CND necesarios para exportar--}}
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.4/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.print.min.js"></script>
    {{--Fin de CND de exportacion--}}

    {{--CND necesarios para crear y dar formatos en DATATABLE--}}
    {{-- <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
    <script src=" https://cdn.datatables.net/responsive/2.2.5/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.5/js/responsive.bootstrap4.min.js"></script> --}}
    {{--fin de CND DATATABLE--}}
    <script>
        $(document).ready(function(){
            $('#Reporte').DataTable({
                paginate:false,
                dom: 'Bfrtip',
                buttons: [
                {extend: 'copy',
                text: 'Copiar',
                exportOptions: {
                columns: ':visible',
                    rows: ':visible'
                }
                },
                {extend: 'print',
                text:'Imprimir',
                exportOptions: {
                    columns: ':visible',
                    rows: ':visible'
                }
                },
                {extend: 'csv',
                text:'CSV',
                exportOptions: {
                    columns: ':visible',
                    rows: ':visible'
                }
                },
                {extend: 'excel',
                text: 'Excel',
                exportOptions: {
                    columns: ':visible',
                    rows: ':visible'
                }
                },
                {extend: 'pdf',
                text: 'PDF',
                exportOptions:{
                    columns: ':visible',
                    rows: ':visible'
                }
                }
                ],
                responsive: {
                    breakpoints: [{
                            name: 'bigdesktop',
                            width: Infinity
                        },
                        {
                            name: 'meddesktop',
                            width: 1480
                        },
                        {
                            name: 'smalldesktop',
                            width: 1280
                        },
                        {
                            name: 'medium',
                            width: 1188
                        },
                        {
                            name: 'tabletl',
                            width: 1024
                        },
                        {
                            name: 'btwtabllandp',
                            width: 848
                        },
                        {
                            name: 'tabletp',
                            width: 768
                        },
                        {
                            name: 'mobilel',
                            width: 480
                        },
                        {
                            name: 'mobilep',
                            width: 320
                        }
                    ]
                },
                language: {
                    processing: "Procesando",
                    search: "Buscar:",
                    lengthMenu: "Reporte de Activos",
                    info: "Elemento _START_ de _END_ en _TOTAL_ Total de elementos",
                    infoEmpty: "No se ha encontrado ningun elemento en lista",
                    infoFiltered: "Filtro de _MAX_ Cantidad total de elementos",
                    infoPostFix: "",
                    loadingRecords: "Espere un momento",
                    zeroRecords: "No se ha encontrado ningun elemento en lista",
                    emptyTable: "Aún no hay ningun elemento en lista",
                    paginate: {
                        first: "Primer",
                        previous: "Anterior",
                        next: "Siguiente",
                        last: "Ultimo"
                    },
                    buttons: {
                    copyTitle: 'Data copied',
                    copyKeys: 'Use your keyboard or menu to select the copy command'
                    }
                }, 

        })
    })
    </script>
    <script src="../../resources/js/ReporteActivo.js"></script>
@stop
