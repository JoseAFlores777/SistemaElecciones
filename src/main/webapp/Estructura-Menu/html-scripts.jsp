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
                className: 'btn btn-danger dropdown-toggle',
                text: 'Exportar',
                buttons: [
			{
				extend:    'excelHtml5',
				text:      '<i class="fas fa-file-excel"></i> Excel',
				titleAttr: 'Export to Excel',
				className: ' btn btn-export btn-success'
			},
			{
				extend:    'pdfHtml5',
				text:      '<i class="fas fa-file-pdf"></i> PDF',
				titleAttr: 'Export to PDF',
				className: ' btn btn-export btn-danger'
			},
			{
				extend:    'print',
				text:      '<i class="fa fa-print"></i> Imprimir',
				titleAttr: 'Print',
				className: ' btn btn-export btn-primary',

				
				
			},
                ]
            }
        ]
    } );
} );



</script>