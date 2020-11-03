<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="{{asset('css/app.css')}}">
    <title>Detalles del Electrodomestico {{$findElectrodomestico->	CatElectMarca}}</title>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Tesoros de Dios</h1>
        <h4 class="text-center"> <u>Reporte de Electrodomesticos</u></h2>
        <br>
        <br>
        <h3><span class="text-primary"> Marca del Equipo:</span> {{$findElectrodomestico->	CatElectMarca}}</h3>

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
                <td>{{$findElectrodomestico->CatElectModelo}}</td>
                </tr>
                
                <tr>
                <th scope="row">2</th>
                <td>Descripcion</td>
                <td>{{$findElectrodomestico->CatElectDescripcion}}</td>
                </tr>

                <tr>
                <th scope="row">3</th>
                <td>Fecha Compra</td>
                <td>{{$findElectrodomestico->CatElectFechaIngreso}}</td>
                </tr>

                <tr>
                <th scope="row">4</th>
                <td>Costo</td>
                <td>C$ {{$findElectrodomestico->CatElectCosto}}</td>
                </tr>

                <tr>
                <th scope="row">5</th>
                <td>Ultima Actualizacion</td>
                <td>{{$findElectrodomestico->updated_at}}</td>
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