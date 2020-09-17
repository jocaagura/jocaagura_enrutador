import 'package:flutter/material.dart';
import 'package:jocaagura_enrutador/jocaagura_enrutador.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo de enrutador',
      home: Page1(),
    );
  }
}



class Page1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: FlatButton(
          onPressed: (){
            JocaaguraEnrutador(
              context: context,
              child: Page2(),
              animation: AnimationType.fadeIn,
              duracion: Duration(milliseconds: 1500),
              // replacement: true

            );
          },

          child: Text('a Pagina 2'),
          color: Colors.white,
        ),
      ),
    );
  }

}


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

        // viajar a main  con el paquete personalizado
        child: FlatButton(
          onPressed: (){
            JocaaguraEnrutador(
                context: context,
                child: Page1(),
                animation: AnimationType.fadeIn,
                duracion: Duration(milliseconds: 500),
                replacement: false
            );
          },
          color: Colors.white,
          child: Text('A home'),
        ),

      ),
    );
  }
}