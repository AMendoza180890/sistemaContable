<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <title>Detalles del Vehiculo</title>
</head>

<body>
    <div class="container-fluid">
        <h1 class="text-center">Tesoros de Dios</h1>
        <h4 class="text-center"> <u>Resumen de Activo Fijo</u></h4>
        <div class="card-body">
            <h4>Total por categorias</h4>
            <table class="table table-sm " id="Reporte">
                <thead class="thead-dark">
                    <tr>
                        <th rowspan="2">
                            <h6>CAT</h6>
                        </th>
                        <th rowspan="2">
                            <h6>COSTO</h6>
                        </th>
                        <th colspan="2">
                            <h6 align="center">DEPRECIACION</h6>
                        </th>
                        <th rowspan="2">
                            <h6>VALOR EN LIBRO</h6>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <h6 align="center" >MENSUAL</h6>
                        </th>
                        <th>
                            <h6 align="center">ACUMULADA</h6>
                        </th>
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
            <table class="table table-sm" id="Reporte">
                <thead class="thead-dark">
                    <tr>
                        <th>
                            <h6>CAT<h6>
                        </th>
                        <th>
                            <h6>DETALLE ACTIVO<h6>
                        </th>
                        <th>
                            <h6>FECHA RECIBIDA<h6>
                        </th>
                        <th>
                            <h6>FECHA BAJA<h6>
                        </th>
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
            <table class="table table-sm" id="Reporte">
                <thead class="thead-dark">
                    <tr>
                        <th>
                            <h6>CAT<h6>
                        </th>
                        <th>
                            <h6>DETALLE ACTIVO<h6>
                        </th>
                        <th>
                            <h6>FECHA RECIBIDA<h6>
                        </th>
                        <th>
                            <h6>COSTO<h6>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($rptAltaMesActual as $listado)
                        <tr>
                            <td>{{ $listado->CATEGORIA }}</th>
                            <td>{{ $listado->DETALLE_ACTIVO }}</th>
                            <td>{{ $listado->FECHA_RECIBIDA }}</th>
                            <td>{{ 'C$' . $listado->COSTO }}</th>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        <div>
            <cite title="Source Title">
                Tesoros de Dios <br>
                Resumen De Activo Fijo <br>
                Este reporte es generado a la fecha <?php echo date('d/M/Y'); ?>
            </cite>
        </div>
    </div>
</body>

</html>
