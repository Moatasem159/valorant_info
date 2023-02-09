import 'package:flutter/material.dart';

class CardPainter extends CustomPainter {
  final BuildContext context;

  CardPainter({required this.context});

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint0 = Paint()
      ..color = Theme.of(context).primaryColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;



    Path path0 = Path();
    path0.moveTo(size.width,size.height*0.6298750);
    path0.quadraticBezierTo(size.width*0.9999833,size.height*0.8935250,size.width,size.height);
    path0.lineTo(0,size.height);
    path0.lineTo(0,size.height*0.0016750);
    path0.quadraticBezierTo(size.width*0.3943000,size.height*0.6299250,size.width,size.height*0.6298750);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>true;
}