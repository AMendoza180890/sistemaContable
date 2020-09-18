$(document).ready(function(){
    $('.TB').on("click",'.btnEdit',function(){
        let tblVehiculo = $('#vehiculo').Datatable;
        
        $tr = $(this).closest('tr');
        if($($tr).hasClass('child')){
            $tr = $tr.prev('.parent');
        }

        let data = tblVehiculo.rows($tr).data();
        console.log(data);
    });
})