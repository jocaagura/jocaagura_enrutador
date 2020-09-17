import 'package:flutter/material.dart';


enum AnimationType{
  normal,
  fadeIn
}


class JocaaguraEnrutador{
  final BuildContext context;
  final Widget child;
  final AnimationType animation;
  final Duration duracion;
  final bool replacement;

  JocaaguraEnrutador({
    @required this.context,
    @required this.child,
    this.animation = AnimationType.normal,
    this.duracion,
    this.replacement = false

  }){

    switch(this.animation){

      case AnimationType.normal:

        if(this.replacement){
          Navigator.pushReplacement(this.context,
              PageRouteBuilder(
                pageBuilder: (
                    context,
                    animation,
                    secondaryAnimation
                    ) {
                  return this.child;
                },
              )
          );
        }else{
          Navigator.push(this.context,
              PageRouteBuilder(
                pageBuilder: (
                    context,
                    animation,
                    secondaryAnimation
                    ) {
                  return this.child;
                },
              )
          );
        }

        break;

    // Casos de uso de los enrutadores
      case AnimationType.fadeIn:
        _fadeInTransition();
        break;




      default:
        if(this.replacement){
          Navigator.pushReplacement(this.context,
              PageRouteBuilder(
                pageBuilder: (
                    context,
                    animation,
                    secondaryAnimation
                    ) {
                  return this.child;
                },
              )
          );
        }else{
          Navigator.push(this.context,
              PageRouteBuilder(
                pageBuilder: (
                    context,
                    animation,
                    secondaryAnimation
                    ) {
                  return this.child;
                },
              )
          );
        }

        break;
    }




  }






  void _fadeInTransition(){


    final route = PageRouteBuilder(
      pageBuilder: (
          context,
          animation,
          secondaryAnimation
          ) {
        return this.child;
      },
      transitionDuration: duracion ?? Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          child: this.child,
          opacity: Tween<double>(begin:  0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOut
              )
          ),
        );
      },
    );



    // Navegamos a la pagina seleccionada
    if(this.replacement){
      Navigator.pushReplacement(context, route);

    }else{

      Navigator.push(context, route);
    }
  }


}