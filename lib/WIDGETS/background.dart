import 'package:flutter/material.dart';
import 'package:projet/COULEUR/couleur.dart';
import 'dart:math' as math;

class BackgroundWidget extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintArcDebut = Paint()..color = jaune;
    final paintRectDroit = Paint()..color = rouge;
    final paintRectGauche = Paint()..color = vert;
    final paintCercle = Paint()..color = jaune;
    //arc debut
    canvas.drawArc(
        Rect.fromPoints(Offset(35, -100), Offset(size.width - 35, 100)),
        0,
        math.pi,
        false,
        paintArcDebut);

    //rectangle droit
    canvas.drawRect(
        Rect.fromPoints(Offset(30, -30), Offset(50, size.height * .70)),
        paintRectDroit);

    //rectangle gauche
    canvas.drawRect(
        Rect.fromPoints(Offset(size.width - 35, 100),
            Offset(size.width - 50, size.height * .80)),
        paintRectGauche);
    var centre = Offset(0, size.height);
    var rayon = size.height * .1;
    canvas.drawCircle(centre, rayon, paintCercle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
