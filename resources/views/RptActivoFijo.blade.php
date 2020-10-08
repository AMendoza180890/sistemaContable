@extends('adminlte::page')

@section('css')
    <link rel="stylesheet" href="/css/admin_custom.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.5/css/responsive.bootstrap4.min.css">
@stop

@section('title', 'TipoCuentas')

@section('content_header')
    <h1>Reporte de cuenta de Activo Fijo</h1>
@stop

@section('content')
    <div class="card">
       <div class="box-header with-border">
            {{-- <button class="btn btn-primary" data-toggle="modal" data-target="#CrearCuentaActivo">Crear</button> --}}
            <label for="dateReporteActivo"> <h4>Fecha de Reporte</h4>
                <input type="date" name="dateReporteActivo" id="dateReporteActivo">
            </label>
        </div>
        <div class="card-body">
            <table class="table table-bordered table-hover table-striped TB" id="Reporte">
                <thead>
                    <tr>
                        <th>CATEGORIA</th>
                        <th>DETALLE_ACTIVO</th>
                        <th>FECHA_RECIBIDA</th>
                        <th>COSTO</th>
                        <th>VIDA_UTIL</th>
                        <th>MESES</th>
                        <th>DEPRECIACION MENSUAL</th>
                        <th>DEPRECIACION ACUMULADA</th>
                        <th>VALOR EN LIBRO</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    foreach ($listaGralReporte as $key => $value) {
                        echo '<tr>
                            <td>'.$value["CATEGORIA"].'</th>
                            <td>'.$value["DETALLE_ACTIVO"].'</th>
                            <td>'.$value["FECHA_RECIBIDA"].'</th>
                            <td>'.$value["COSTO"].'</th>
                            <td>'.$value["VIDA_UTIL"].'</td>
                            <td>'.mesesReporte($value["FECHA_RECIBIDA"]).'</td>
                            <td>'.($value["VIDA_UTIL"]!=0 ? $value["COSTO"] / $value["VIDA_UTIL"] : 0).'</td>
                            <td>'.$value["VIDA_UTIL"].'</td>
                            <td> en espera</td>
                        </tr>';
                    }
                    function mesesReporte($FECHARECIBIDA) {
                                try {
                                    if (post["dateReporteActivo"]) {
                                        $fechaReporte = post["dateReporteActivo"];
                                        $inicio = new DateTime($FECHARECIBIDA);
                                        $fin = new DateTime($fechaReporte);
    
                                        $interval=$fin->diff($inicio);
                                        
                                        $intervalMeses=$interval->format("%m");
    
    
                                        $intervalAnos = $interval->format("%y")*12;
                                        $meses = $intervalMeses + $intervalAnos;
                                        echo '<script> console.log('.$post["dateReporteActivo"].')</script>';
                                        return $meses;
                                    }
                                } catch (exception $ex) {
                                    echo '<script>console.log('.$ex.')</script>';
                                }
                               
                    }   
                    ?>
                </tbody>
            </table>
        </div>
    </div>

@stop

@section('js')
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
    <script src=" https://cdn.datatables.net/responsive/2.2.5/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.5/js/responsive.bootstrap4.min.js"></script>
    <script>
        $('#Reporte').DataTable({
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
                lengthMenu: "Lista de Vehiculos",
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
    <script src="../../resources/js/ReporteActivo.js"></script>
@stop
