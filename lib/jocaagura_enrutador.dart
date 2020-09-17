import 'package:flutter/material.dart';
/// Enlista las animaciones disponibles para la clase JocaaguraEnrutador que puede seleccionar el usuario
enum AnimationType { normal, fadeIn }
/// JocaaguraEnrutador es la clase principal que maneja como agregar al Stack y las transiciones de navegación
class JocaaguraEnrutador {
  final BuildContext context;
  final Widget child;
  final AnimationType animation;
  final Duration duracion;
  final bool replacement;
///Constructor de la clase
  ///si no se agrega una animación de [animation] se usa por defecto la animacion de desvanecimiento rapido
  ///Si se setea el [replacement] en true la vista actual es destruida para dar paso a la nueva vista [child]
  ///Se recomienda que la [duracion] NO supere los 1000ms o sea inferior a 500ms
  JocaaguraEnrutador(
      {@required this.context,
      @required this.child,
      this.animation = AnimationType.normal,
      this.duracion,
      this.replacement = false}) {
    switch (this.animation) {

      /// Casos de uso de los enrutadores
    /// [fadeIn] llama la funcion para la animacion de desvanecimiento
      case AnimationType.fadeIn:
        _fadeInTransition();
        break;

      default:
        if (this.replacement) {
          Navigator.pushReplacement(this.context, PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return this.child;
            },
          ));
        } else {
          Navigator.push(this.context, PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return this.child;
            },
          ));
        }

        break;
    }
  }
/// Transición de desvanecimiento
  void _fadeInTransition() {
    final route = PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return this.child;
      },
      transitionDuration: duracion ?? Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          child: this.child,
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut)),
        );
      },
    );

    /// Navegamos a la pagina seleccionada reemplazando o no la vista actual
    /// segun el [replacement] seteado, true para reemplazar y false para agregar al Stack
    if (this.replacement) {
      Navigator.pushReplacement(context, route);
    } else {
      Navigator.push(context, route);
    }
  }
}
