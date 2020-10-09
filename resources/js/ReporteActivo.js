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

    // let costo = $('#costoActivo').attr('costo');
    // let vidaUtil = $('#vidaUtilActivo').attr('vidaUtil');
    // let fechaRecibido = $('#fechaRecibidoActivo').attr('fechaRecibido');

    // console.log("costo " + costo);
    // console.log("vidaUtil " + vidaUtil);
    // console.log("fechaRecibido " + fechaRecibido);

    // let inicio = new DateTime($FECHARECIBIDA);
    // let fin = new DateTime($fechaReporte);

    // let interval = findiff(inicio);

    // let intervalMeses = $interval - > format('%m');

    // let intervalAnos = $interval - > format('%y') * 12;
    // let meses = $intervalMeses + $intervalAnos;

    // var months;
    // months = (new Date(fechaActual).getFullYear() - new Date(fechaRecibido).getFullYear()) * 12;
    // months -= new Date(fechaRecibido).getMonth() + 1;
    // months += new Date(fechaActual).getMonth();
    // console.log(months <= 0 ? 0 : months);



})