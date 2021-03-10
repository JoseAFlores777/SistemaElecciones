<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.5/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.5/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.5/js/buttons.print.min.js"></script>
<script src="adminkit-main/static/js/app.js"></script>
<script>





    $(document).ready(function() {
        
    $('#example').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'collection',
                className: 'btn btn-outline-secondary me-1',
                text: 'Exportar',
                buttons: [
			{
				extend:    'excelHtml5',
				text:      '<i class="fas fa-file-excel"></i> Excel',
				titleAttr: 'Export to Excel',
				className: ' btn btn-export btn-outline-success m-1 d-grid gap-2 col-12 mx-auto'
                               
			},
			{
				extend:    'pdfHtml5',
				text:      '<i class="fas fa-file-pdf"></i> PDF',
				titleAttr: 'Export to PDF',
				className: ' btn btn-export btn-outline-danger m-1 d-grid gap-2 col-12 mx-auto'
			},
			{
				extend:    'print',
				text:      '<i class="fa fa-print"></i> Imprimir',
				titleAttr: 'Print',
				className: ' btn btn-export btn-outline-primary m-1 d-grid gap-2 col-12 mx-auto',

				
				
			},
                ]
            }
        ]
    } );
    
     $("button").removeClass("dt-button");
     
     $("button").click(function () {
     
        $("button").removeClass("dt-button");
})
     
     
    
} );



</script>