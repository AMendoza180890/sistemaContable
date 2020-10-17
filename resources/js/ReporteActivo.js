var now = new Date();
var day = ("0" + now.getDate()).slice(-2);
var month = ("0" + (now.getMonth() + 1)).slice(-2);
var today = now.getFullYear() + "-" + (month) + "-" + (day);

$('#dateReporteActivo').val(today);

$('#dateReporteActivo').on('change', function() {
    let fechaActual = $('#dateReporteActivo').val();
    $('#tituloFechaSeleccionada').html("Reporte Realizado a la fecha " + fechaActual);

    $("td").each(function() {
            // let costo = $('#costoActivo').attr('costo');
            // let vidaUtil = $('#vidaUtilActivo').attr('vidaUtil');
            // let fechaRecibido = $('#fechaRecibidoActivo').attr('fechaRecibido');
            let val0 = $(this).attr('indice');
            let val1 = $(this).attr("costo");
            let val2 = $(this).attr("vidaUtil");
            let val3 = $(this).attr("fechaRecibido");

            console.log(val0);
            console.log(val1);
            console.log(val2);
            console.log(val3);

            //imprimir en documento
            let indice = 'td#' + val0;
            let indice2 = 'td#da' + val0;
            let indice3 = 'td#sl' + val0;
            // $("#MesDif").each(function() {
            $(indice).text(mesDiferencia(val3));
            $(indice2).text(formateo(depreciacionAcumuladaFunction(val3, val1, val2)));
            $(indice3).text(formateo(saldoLibro(val3, val1, val2)));
            // })
        }),
        $('#Reporte').DataTable({
            destroy: true,
            dom: 'Bfrtip',
            buttons: [{
                    extend: 'copy',
                    text: 'Copiar',
                    exportOptions: {
                        columns: ':visible',
                        rows: ':visible'
                    }
                },
                {
                    extend: 'print',
                    text: 'Imprimir',
                    exportOptions: {
                        columns: ':visible',
                        rows: ':visible'
                    }
                },
                {
                    extend: 'csv',
                    text: 'CSV',
                    exportOptions: {
                        columns: ':visible',
                        rows: ':visible'
                    }
                },
                {
                    extend: 'excel',
                    text: 'Excel',
                    exportOptions: {
                        columns: ':visible',
                        rows: ':visible'
                    }
                },
                {
                    extend: 'pdf',
                    text: 'PDF',
                    exportOptions: {
                        columns: ':visible',
                        rows: ':visible'
                    }
                }

            ],
            responsive:  {                     breakpoints:  [{                             name:   'bigdesktop',                             width:  Infinity                         },                          {                             name:   'meddesktop',                             width:  1480                         },                          {                             name:   'smalldesktop',                             width:  1280                         },                          {                             name:   'medium',                             width:  1188                         },                          {                             name:   'tabletl',                             width:  1024                         },                          {                             name:   'btwtabllandp',                             width:  848                         },                          {                             name:   'tabletp',                             width:  768                         },                          {                             name:   'mobilel',                             width:  480                         },                          {                             name:   'mobilep',                             width:  320                         }                    ]                 },
                            language:  {                     processing:   "Procesando",                     search:   "Buscar:",                     lengthMenu:   "Reporte de Activos",                     info:   "Elemento _START_ de _END_ en _TOTAL_ Total de elementos",                     infoEmpty:   "No se ha encontrado ningun elemento en lista",                     infoFiltered:   "Filtro de _MAX_ Cantidad total de elementos",                     infoPostFix:   "",                     loadingRecords:   "Espere un momento",                     zeroRecords:   "No se ha encontrado ningun elemento en lista",                     emptyTable:   "Aún no hay ningun elemento en lista",                     paginate:  {                         first:   "Primer",                         previous:   "Anterior",                         next:   "Siguiente",                         last:   "Ultimo"                     },                     buttons:  {                     copyTitle:   'Data copied',                     copyKeys:   'Use your keyboard or menu to select the copy command'                     }                 },
             

        });

    function formateo(resultado) {
        return 'C$ ' + resultado;
    }

    function mesDiferencia(valor) {
        let months;
        let fechaActual = $('#dateReporteActivo').val();
        months = (new Date(fechaActual).getFullYear() - new Date(valor).getFullYear()) * 12;
        months -= (new Date(valor).getMonth());
        months += (new Date(fechaActual).getMonth());
        return (months <= 0 ? 0 : months);
    }

    function depreciacionAcumuladaFunction(mes, costo, vidaUtil) {
        let diferenciaMes = mesDiferencia(mes);
        let depreciacionMensual = 0;
        if (vidaUtil != 0) {
            depreciacionMensual = costo / vidaUtil;
        } else {
            depreciacionMensual;
        }

        if (vidaUtil >= diferenciaMes) {
            depreciacionAcumulada = depreciacionMensual * diferenciaMes;
        } else {
            depreciacionAcumulada = 0;
        }
        return depreciacionAcumulada.toFixed(2);
    }

    function saldoLibro(mes, costo, vidaUtil) {
        let depreciacion = depreciacionAcumuladaFunction(mes, costo, vidaUtil);
        let Saldo = costo - depreciacion;

        return Saldo.toFixed(2);
    }
})