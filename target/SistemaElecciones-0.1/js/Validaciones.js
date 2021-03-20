
//TipoUsuario





function CambioEstado() {
 if ($('#Estado').val()=='Abierta'){
    
    Swal.fire({
  template: '#my-template'
})
}   
}






//$('#example').DataTable({
//    dom: 'Bfrtip',
//    buttons: [
//        {
//            extend: 'collection',
//            className: 'btn btn-outline-secondary me-1',
//            text: 'Exportar',
//            buttons: [
//                {
//                    extend: 'excelHtml5',
//                    text: '<i class="fas fa-file-excel"></i> Excel',
//                    titleAttr: 'Export to Excel',
//                    className: ' btn btn-export btn-outline-success m-1 d-grid gap-2 col-12 mx-auto'
//
//                },
//                {
//                    extend: 'pdfHtml5',
//                    text: '<i class="fas fa-file-pdf"></i> PDF',
//                    titleAttr: 'Export to PDF',
//                    className: ' btn btn-export btn-outline-danger m-1 d-grid gap-2 col-12 mx-auto'
//                },
//                {
//                    extend: 'print',
//                    text: '<i class="fa fa-print"></i> Imprimir',
//                    titleAttr: 'Print',
//                    className: ' btn btn-export btn-outline-primary m-1 d-grid gap-2 col-12 mx-auto',
//
//                },
//            ]
//        }
//    ]
//});

  $('table.display').DataTable({
    dom: 'Bfrtip',
    buttons: [
        {
            extend: 'collection',
            className: 'btn btn-outline-secondary me-1',
            text: 'Exportar',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: '<i class="fas fa-file-excel"></i> Excel',
                    titleAttr: 'Export to Excel',
                    className: ' btn btn-export btn-outline-success m-1 d-grid gap-2 col-12 mx-auto'

                },
                {
                    extend: 'pdfHtml5',
                    text: '<i class="fas fa-file-pdf"></i> PDF',
                    titleAttr: 'Export to PDF',
                    className: ' btn btn-export btn-outline-danger m-1 d-grid gap-2 col-12 mx-auto'
                },
                {
                    extend: 'print',
                    text: '<i class="fa fa-print"></i> Imprimir',
                    titleAttr: 'Print',
                    className: ' btn btn-export btn-outline-primary m-1 d-grid gap-2 col-12 mx-auto',

                },
            ]
        }
    ]
});


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

    if (validarExtension(this)) {

        if (validarPeso(this)) {
            verImagen(this);
        }
    }
});

// Validacion de extensiones permitidas

function validarExtension(datos) {

    var ruta = datos.value;
    var extension = ruta.substring(ruta.lastIndexOf('.') + 1).toLowerCase();
    var extensionValida = extensionesValidas.indexOf(extension);

    if (extensionValida < 0) {

        alert('La extensión no es válida Su fichero tiene de extensión: .' + extension)
        return false;
    } else {
        return true;
    }
}

// Validacion de peso del fichero en kbs

function validarPeso(datos) {

    if (datos.files && datos.files[0]) {

        var pesoFichero = datos.files[0].size / 1024;

        if (pesoFichero > pesoPermitido) {
            alert('El peso maximo permitido del fichero es: ' + pesoPermitido + ' KBs Su fichero tiene: ' + pesoFichero + ' KBs');
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





