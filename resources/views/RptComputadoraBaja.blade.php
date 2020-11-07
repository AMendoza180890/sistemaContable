<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="{{asset('css/app.css')}}">
    <title>Detalles de Equipo Computo {{$findComputadora->	catEquipoMarca}}</title>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Tesoros de Dios</h1>
        <h4 class="text-center"> <u>Reporte de Equipo Computo</u></h2>
        <br>
        <br>
        <h3><span class="text-primary"> Marca del Equipo:</span> {{$findComputadora->	catEquipoMarca}}</h3>

        <table class="table text-left">
            <thead>
                <tr>
                <th scope="col">#</th>
                <th scope="col">Categoria</th>
                <th scope="col">Detalle</th>
                </tr>
            </thead>
            <tbody>

                <tr>
                <th scope="row">1</th>
                <td>Modelo</td>
                <td>{{$findComputadora->catEquipoModelo}}</td>
                </tr>
                
                <tr>
                <th scope="row">2</th>
                <td>Serie</td>
                <td>{{$findComputadora->catEquipoNumeroSerie}}</td>
                </tr>

                <tr>
                <th scope="row">3</th>
                <td>Tamaño HDD</td>
                <td>{{$findComputadora->catEquipoTamanioAlmacenamiento}}</td>
                </tr>
                
                <tr>
                <th scope="row">4</th>
                <td>Tipo RAM</td>
                <td>{{$findComputadora->TipoMemoriaRAM}}</td>
                </tr>

                <tr>
                <th scope="row">5</th>
                <td>Tamaño RAM</td>
                <td>{{$findComputadora->catEquipoCantidadRAM}}</td>
                </tr>

                <tr>
                <th scope="row">6</th>
                <td>Sistema Operativo</td>
                <td>{{$findComputadora->catEquipoTipoSO}}</td>
                </tr>

                <tr>
                <th scope="row">7</th>
                <td>Fecha Compra</td>
                <td>{{$findComputadora->catEquipoFechaCompra}}</td>
                </tr>

                <tr>
                <th scope="row">8</th>
                <td>Costo</td>
                <td>C$ {{$findComputadora->catEquipoCostoEquipo}}</td>
                </tr>

                <tr class="alert alert-danger">
                <th scope="row">9</th>
                <td>Fecha dado de Baja</td>
                <td>{{$findComputadora->updated_at}}</td>
                </tr>
            </tbody>
        </table>
        <br>
        <br>
        <br>
        <br>
        <br>
        <div class="alert alert-dark" role="alert">
            Notas de indicacion sobre el articulo
        </div>
</body>
</html>