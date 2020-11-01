<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="{{asset('css/app.css')}}">
    <title>Document</title>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Tesoros de Dios</h1>
        <h2>Reporte de Equipo Computo</h2>
        <h3>Nombre del equipo: {{$findComputadora->	catEquipoMarca}}</h3>
        
        <div class="row">
            <div class="col-4">modelo</div>
            <div class="col-8">{{$findComputadora->catEquipoModelo}}</div>
        </div>
    </div>
</body>
</html>