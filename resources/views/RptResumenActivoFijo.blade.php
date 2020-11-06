<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="{{asset('css/app.css')}}">
    <title>Detalles del Vehiculo</title>
</head>
<body>


    <div class="container">
        <h1 class="text-center">Tesoros de Dios</h1>
        <h4 class="text-center"> <u>Resumen de Activo Fijo</u></h2>
        <br>
        <br>
        <div class="card-body">
            <h4>Total por categorias</h4>
            <table class="table" id="Reporte">
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
                            <td>{{ $listado->CATEGORIA }}</th>
                            <td>{{ 'C$ ' . $listado->COSTO }}</th>
                            <td>{{ 'C$ ' . $listado->DEPRECIACIONTOTALMENSUAL }}</td>
                            <td>{{ 'C$ ' . $listado->DEPRECIACIONTOTALACUMULADA }}</td>
                            <td>{{ 'C$ ' . $listado->SALDOTOTALLIBRO }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        <div class="card-body">
            <h4>Lista de Activos dados de baja en el mes</h4>
            <table class="table" id="Reporte">
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
                            <td>{{ $listado->CATEGORIA }}</th>
                            <td>{{ $listado->DETALLE_ACTIVO }}</th>
                            <td>{{ $listado->FECHA_RECIBIDA }}</th>
                            <td>{{ $listado->FECHA_BAJA }}</th>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        <div class="card-body">
            <h4>Lista de Activos Nuevos en el mes</h4>
            <table class="table" id="Reporte">
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
                            <td>{{ $listado->CATEGORIA }}</th>
                            <td>{{ $listado->DETALLE_ACTIVO }}</th>
                            <td>{{ $listado->FECHA_RECIBIDA }}</th>
                            <td>C$ {{ $listado->COSTO }}</th>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
            
        
</body>
<footer>
    <cite title="Source Title">
        Tesoros de Dios <br>
        Resumen De Activo Fijo <br>
        Este reporte es generado el la fecha <?php echo date('d/M/Y')?>
    </cite>
</footer>
</html>