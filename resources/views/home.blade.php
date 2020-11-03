@extends('adminlte::page')

@section('css')
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.5/css/responsive.bootstrap4.min.css">
@stop

@section('title', 'Inicio')

@section('content_header')
    <h1>Inicio</h1>
@stop

@section('content')
    <div class="card">
        <div class="card-header">
            <h1 class="card-title">Informe sobre Activo Fijo en el mes <?php echo date('M'); ?></h1>
        </div>
        
        <div class="card-body">
            <h4>Total por categorias</h4>
            <table class="table table-bordered table-hover table-striped TB" id="Reporte">
                <thead>
                    <tr>
                        <th>CATEGORIA</th>
                        <th>COSTO</th>
                        <th>DEPRECIACION MENSUAL</th>
                        <th>DEPRECIACION ACUMULADA</th>
                        <th>VALOR EN LIBRO</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($detalleCategoria as $listado)    
                    <tr>
                        <td>{{$listado->CATEGORIA}}</th>
                        <td>{{"C$ ". $listado->COSTO}}</th>
                        <td>{{"C$ ". $listado->DEPRECIACIONTOTALMENSUAL}}</td>
                        <td>{{"C$ ". $listado->DEPRECIACIONTOTALACUMULADA}}</td>
                        <td>{{"C$ ". $listado->SALDOTOTALLIBRO}}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table> 
        </div>

        <div class="card-body">
            <h4>Lista de Activos dados de baja en el mes actual <?php echo date('M'); ?></h4>
            <table class="table table-bordered table-hover table-striped TB" id="Reporte">
                <thead>
                    <tr>
                        <th>CATEGORIA</th>
                        <th>DETALLE_ACTIVO</th>
                        <th>FECHA_RECIBIDA</th>
                        <th>FECHA_BAJA</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($rptBajasMesActual as $listado)    
                    <tr>
                        <td>{{$listado->CATEGORIA}}</th>
                        <td>{{$listado->DETALLE_ACTIVO}}</th>
                        <td>{{$listado->FECHA_RECIBIDA}}</th>
                        <td>{{$listado->FECHA_BAJA}}</th>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

    <div class="card-body">
    <h4>Lista de Activos Nuevos en el mes actual <?php echo date('M'); ?></h4>
        <table class="table table-bordered table-hover table-striped TB" id="Reporte">
            <thead>
                <tr>
                    <th>CATEGORIA</th>
                    <th>DETALLE_ACTIVO</th>
                    <th>FECHA_RECIBIDA</th>
                    <th>COSTO</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($rptAltaMesActual as $listado)    
                <tr>
                    <td>{{$listado->CATEGORIA}}</th>
                    <td>{{$listado->DETALLE_ACTIVO}}</th>
                    <td>{{$listado->FECHA_RECIBIDA}}</th>
                    <td>C$ {{$listado->COSTO}}</th>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>

</div>


@stop

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
@stop

@section('js')
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
    <script src=" https://cdn.datatables.net/responsive/2.2.5/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.5/js/responsive.bootstrap4.min.js"></script>
    <script>
        $('#Reporte').DataTable({
            paginate:false,
            search:false,
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
                lengthMenu: "",
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

        $(".dataTables_filter").hide();

    </script>
    <script src="../../resources/js/vehiculo.js"></script>
@stop
