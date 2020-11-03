<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="{{asset('css/app.css')}}">
    <title>Detalles del Vehiculo {{$obtenerVehiculos->	catVehiculoTipo}}</title>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Tesoros de Dios</h1>
        <h4 class="text-center"> <u>Reporte de Vehiculo</u></h2>
        <br>
        <br>
        <h3><span class="text-primary"> Tipo de Vehiculo:</span> {{$obtenerVehiculos->	catVehiculoTipo}}</h3>

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
                <td>{{$obtenerVehiculos->catVehiculoModelo}}</td>
                </tr>
                
                <tr>
                <th scope="row">2</th>
                <td>Color</td>
                <td>{{$obtenerVehiculos->catVehiculoColor}}</td>
                </tr>

                <tr>
                <th scope="row">3</th>
                <td>Motor</td>
                <td>{{$obtenerVehiculos->catVehiculoMotor}}</td>
                </tr>
                
                <tr>
                <th scope="row">4</th>
                <td>VIM</td>
                <td>{{$obtenerVehiculos->catVehiculoVIM}}</td>
                </tr>

                <tr>
                <th scope="row">5</th>
                <td>Pasajeros</td>
                <td>{{$obtenerVehiculos->catVehiculoCantPasajeros}}</td>
                </tr>

                <tr>
                <th scope="row">6</th>
                <td>Tipo de Combustible</td>
                <td>{{$obtenerVehiculos->catVehiculoCombustible}}</td>
                </tr>

                <tr>
                <th scope="row">7</th>
                <td>Tipo de Uso</td>
                <td>{{$obtenerVehiculos->catVehiculoUso}}</td>
                </tr>

                <tr>
                <th scope="row">8</th>
                <td>Año del Vehiculo</td>
                <td>{{$obtenerVehiculos->catVehiculoAnio}}</td>
                </tr>
                
                <tr>
                <th scope="row">9</th>
                <td>Cilindro</td>
                <td>{{$obtenerVehiculos->catVehiculoCilindro}}</td>
                </tr>
                
                <tr>
                <th scope="row">10</th>
                <td>Tipo de Uso</td>
                <td>{{$obtenerVehiculos->catVehiculoUso}}</td>
                </tr>

                <tr>
                <th scope="row">11</th>
                <td>Servicio</td>
                <td>{{$obtenerVehiculos->catVehiculoServicio}}</td>
                </tr>

                <tr>
                <th scope="row">12</th>
                <td>Propietario</td>
                <td>{{$obtenerVehiculos->catVehiculoPropietario}}</td>
                </tr>

                <tr>
                <th scope="row">13</th>
                <td>Fecha Compra</td>
                <td>{{$obtenerVehiculos->catVehiculoFechaCompra}}</td>
                </tr>

                <tr>
                <th scope="row">14</th>
                <td>Costo</td>
                <td>C$ {{$obtenerVehiculos->catVehiculoCosto}}</td>
                </tr>

                <tr>
                <th scope="row">15</th>
                <td>Placa</td>
                <td>{{$obtenerVehiculos->catVehiculoPlaca}}</td>
                </tr>

                <tr>
                <th scope="row">16</th>
                <td>Fecha de Baja</td>
                <td>{{$obtenerVehiculos->updated_at}}</td>
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