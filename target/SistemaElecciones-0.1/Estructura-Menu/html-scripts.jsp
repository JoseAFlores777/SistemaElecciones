
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.5/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.5/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.5/js/buttons.print.min.js"></script>
<script src="adminkit-main/static/js/app.js"></script>
<script src="adminkit-main/static/js/Validaciones.js"></script>
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


     var extensionesValidas = ".png, .gif, .jpeg, .jpg";
     var pesoPermitido = 3000;

    // Cuando cambie #fichero
    $("#InputImagen").change(function () {

        $('#texto').text('');
	$('#img').attr('src', '');

	if(validarExtension(this)) {

            if(validarPeso(this)) {
        verImagen(this);
	    }
	}  
    });

    // Validacion de extensiones permitidas

    function validarExtension(datos) {

	var ruta = datos.value;
	var extension = ruta.substring(ruta.lastIndexOf('.') + 1).toLowerCase();
	var extensionValida = extensionesValidas.indexOf(extension);

	if(extensionValida < 0) {
            
            alert('La extensión no es válida Su fichero tiene de extensión: .'+ extension)
            return false;
        } else {
            return true;
        }
    }

   // Validacion de peso del fichero en kbs

    function validarPeso(datos) {

        if (datos.files && datos.files[0]) {

	    var pesoFichero = datos.files[0].size/1024;

	    if(pesoFichero > pesoPermitido) {
	        alert('El peso maximo permitido del fichero es: ' + pesoPermitido + ' KBs Su fichero tiene: '+ pesoFichero +' KBs');
	        return false;
	    } else {
	        return true;
	    }
	}
    }

  // Vista preliminar de la imagen.
  function verImagen(datos) {

      if (datos.files && datos.files[0]) {

          var reader = new FileReader();
          reader.onload = function (e) {
	          $('#Imagen').attr('src', e.target.result);
          };

          reader.readAsDataURL(datos.files[0]);
       }
   }
     
    
} );



</script>