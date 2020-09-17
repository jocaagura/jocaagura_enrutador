# Enrutador Jocaagura
Este paquete ha sido creado como preparación para la publicación de paquetes posteriores en los cuales se realice un seguimiento más profesional de código más complejo como mecanismos de pago etc.
## Ejemplo de uso
´´´

import 'package:flutter/material.dart';
import 'package:jocaagura_enrutador/jocaagura_enrutador.dart';

import 'main.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Pagina 2'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: FlatButton(
          onPressed: (){
            JocaaguraEnrutador(
              context: context,
              child: MyHomePage(title: 'Prueba de enrutador'),
              animation: AnimationType.fadeIn,
              duracion: Duration(milliseconds: 500),
              replacement: false
            );
          },
          child: Text('A home'),
        ),
      ),
    );
  }
}

´´´
## Clase principal
EnrutadorJocaagura: Encapsula el enrutamiento y las animaciones a utilizar en nuestro paquete.
Requiere el BuildContext para agregar el screen al stack
Un widget hijo al cual navegar con tranquilidad
La animación enlistada en el enum de animaciones
Y la duración que es un Duration para establecer cuánto dura la transición.

[![N|Solid](https://raw.githubusercontent.com/jocaagura/jocaagura_enrutador/version_2/assets/Screenshot_20200917-152338.png)

## Github
Visita el repositorio
[Github](https://github.com/jocaagura/jocaagura_enrutador)