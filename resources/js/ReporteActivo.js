// $(document).ready(function() {
var now = new Date();

var day = ("0" + now.getDate()).slice(-2);
var month = ("0" + (now.getMonth() + 1)).slice(-2);

var today = now.getFullYear() + "-" + (month) + "-" + (day);

let fechaActual = $('#dateReporteActivo').val();

if (fechaActual == undefined) {
    $('#dateReporteActivo').val(today);
}

//});​

// //FECHA ACTUAL
// let fechaActual = $('#dateReporteActivo').val();
// let fechaReporte = $('#1').html();
// console.log(fechaReporte);

// function mesDiferencia(d1,d2){
//     let months;
//     months = (d2.getFullYear() - d1.getFullYear()) * 12; 
//     months -= d1.getMonth() + 1; 
//     months += d2.getMonth(); 
//     return months <= 0 ? 0 : months;    
// }




// //seleccionar fecha
// $('#dateReporteActivo').on('change',function(){
//     let fechaActual = $('#dateReporteActivo').val();
//     console.log(fechaActual);
// })