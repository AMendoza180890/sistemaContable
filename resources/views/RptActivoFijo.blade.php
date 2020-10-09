@extends('adminlte::page')

@section('css')
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
     <form action="{{ route('RptCuenta.all') }}" method="post">
         <label for="dateReporteActivo" >
             @csrf
             <h4>Fecha de Reporte</h4>
             <input type="date" name="dateReporteActivo" id="dateReporteActivo">
             {{-- <input type="submit" value="Generar Reporte"> --}}
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
                        <td id="info" indice = "'.$key.'" fechaRecibido="'.$value['FECHA_RECIBIDA'].'" vidaUtil="'.$value['VIDA_UTIL'].'" costo="'.$value['COSTO'].'">' .
                            $value['CATEGORIA'] .
                            '</th>
                        <td>' .
                            $value['DETALLE_ACTIVO'] .
                            '</th>
                        <td>' .
                            $value['FECHA_RECIBIDA'] .
                            '</th>
                        <td>' .
                            $value['COSTO'] .
                            '</th>
                        <td>' .
                            $value['VIDA_UTIL'] .
                            '</td>
                        <td id="'.$key.'">' .
                            obtenerMesDif($value['FECHA_RECIBIDA']) .
                            '</td>
                        <td>' .'C$ '.
                            ($value['VIDA_UTIL'] != 0 ? number_format($value['COSTO'] / $value['VIDA_UTIL'],2) : 0) .
                            '</td>
                        <td id="da'.$key.'">' .'C$ '.depreciacionAcumulada($value['FECHA_RECIBIDA'],$value['COSTO'], $value['VIDA_UTIL'] ).
                            '</td>
                        <td id="sl'.$key.'">'.'C$ '.saldoLibro($value['FECHA_RECIBIDA'],$value['COSTO'], $value['VIDA_UTIL']).'</td>
                    </tr>';
                    }
                    
                    function obtenerMesDif($FECHARECIBIDA)
                    {
                        if (isset($_POST["dateReporteActivo"])) {
                        $fechaReporte = $_POST["dateReporteActivo"];

                        $inicio = new DateTime($FECHARECIBIDA);
                        $fin = new DateTime($fechaReporte);
    
                        $interval = $fin->diff($inicio);
    
                        $intervalMeses = $interval->format('%m');
    
                        $intervalAnos = $interval->format('%y') * 12;
                        $meses = $intervalMeses + $intervalAnos;
                        
                        return $meses;
                        
                    } else {

                            $fechaReporte = date('d-m-Y');
                            $inicio = new DateTime($FECHARECIBIDA);
                            $fin = new DateTime($fechaReporte);
        
                            $interval = $fin->diff($inicio);
        
                            $intervalMeses = $interval->format('%m');
        
                            $intervalAnos = $interval->format('%y') * 12;
                            $meses = $intervalMeses + $intervalAnos;
                            
                            return $meses;
                        }
                        


                    }
                    
                    function depreciacionAcumulada($mes, $costo, $vidaUtil){
                        $diferenciaMes = obtenerMesDif($mes);

                        if ($vidaUtil != 0) {
                            $depreciacionMensual = $costo / $vidaUtil;
                        } else {
                            $depreciacionMensual = 0;
                        }

                        if ($vidaUtil >= $diferenciaMes) {
                            $depreciacionAcumulada = $depreciacionMensual * $diferenciaMes;
                        }else {
                            $depreciacionAcumulada = 0;
                        }
                        return number_format($depreciacionAcumulada,2);
                    }

                    function saldoLibro($fechaRecibido,$costo,$vidaUtil){
                        $depreciacion = depreciacionAcumulada($fechaRecibido,$costo, $vidaUtil);
                        $Saldo = $costo - $depreciacion;

                        return number_format($Saldo,2);
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
                lengthMenu: "Reporte de Activos",
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
