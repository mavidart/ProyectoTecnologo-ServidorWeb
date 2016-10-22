/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/*function comprovarClave(){
 password = document.formularioContra.password.value();
 password2 = document.formularioContra.password2.value();
 
 if(password==password2){
 
 alert("Las claves son iguales");
 }else{
 alert("Las claves son distintas");
 }
 }*/

$(document).ready(function () {
    //variables
    var pass1 = $('[name=pass1]');
    var pass2 = $('[name=pass2]');
    var confirmacion = "Las contrasenas si coinciden";
    var longitud = "La contrasena debe estar formada entre 6-10 carácteres (ambos inclusive)";
    var negacion = "No coinciden las contrasenas";
    var vacio = "La contraseña no puede estar vacía";
    //oculto por defecto el elemento span
    var span = $('<span class="recuadro"></span>').insertAfter(pass2);
    span.hide();
    //función que comprueba las dos contraseñas
    function coincidePassword() {
        var valor1 = pass1.val();
        var valor2 = pass2.val();
        //muestro el span
        span.show().removeClass();
        //condiciones dentro de la función
        if (valor1 != valor2) {
            span.text(negacion).addClass('negacion');
        }
        if (valor1.length == 0 || valor1 == "") {
            span.text(vacio).addClass('negacion');
        }
        if (valor1.length < 6 || valor1.length > 10) {
            span.text(longitud).addClass('negacion');
        }
        if (valor1.length != 0 && valor1 == valor2) {
            span.text(confirmacion).removeClass("negacion").addClass('confirmacion');
            correcto = true;
        }
    }
    //ejecuto la función al soltar la tecla
    pass2.keyup(function () {
        coincidePassword();
    });
});

