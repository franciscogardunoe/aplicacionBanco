/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validarFormularioCliente() {
    var nombre = document.getElementById("nombre");
    var apellidos = document.getElementById("apellidos");
    var direccion = document.getElementById("direccion");
    if (nombre.length > 45) {
        alert("El campo Nombre no admite más de 45 carácteres");
        return false;
    } else if (apellidos.length > 60) {
        alert("El campo Apellidos no admite más de 60 carácteres");
        return false;
    }
}

