import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class RadialIndicatorCustom extends CustomPainter {
  final double percentage;
  RadialIndicatorCustom(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    // canvas.drawPaint(Paint()..color = Colors.red);
    final c = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCenter(
      center: c,
      width: 200,
      height: 200,
    );
    // canvas.drawRect(rect, Paint()..color = Colors.grey);
    drawArc(canvas, rect);
    drawTextCentered(
        canvas: canvas,
        position: c,
        text: "$percentage",
        style: const TextStyle(
            color: Colors.red, fontWeight: FontWeight.bold, fontSize: 30),
        maxWidth: 100);
    drawGuid(canvas, c, 100);
  }

  void drawGuid(Canvas canvas, Offset c, double r) {
    Paint paint = Paint()
      ..color = Colors.blueGrey
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(c, r, paint);
  }

  void drawArc(Canvas canvas, Rect rect) {
    const startAngle = -90 * pi / 180;
    final sweepAngle = 3.8 * percentage * pi / 180;
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  void drawTextCentered(
      {Canvas? canvas,
      Offset? position,
      String? text,
      TextStyle? style,
      double? maxWidth}) {
    final tp = measureText(
        text: text,
        style: style,
        maxWidth: maxWidth,
        alignment: TextAlign.center);
    tp.paint(
      canvas!,
      position! + Offset(-tp.width / 2, -tp.height / 2),
    );
  }

  TextPainter measureText(
      {String? text,
      TextStyle? style,
      double? maxWidth,
      TextAlign? alignment}) {
    final span = TextSpan(text: text, style: style);
    final tp = TextPainter(
        text: span, textAlign: alignment!, textDirection: TextDirection.ltr);
    tp.layout(minWidth: 0, maxWidth: maxWidth!);
    return tp;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RadiusIndicateWidget extends StatefulWidget {
  const RadiusIndicateWidget({Key? key}) : super(key: key);

  @override
  State<RadiusIndicateWidget> createState() => _RadiusIndicateWidgetState();
}

class _RadiusIndicateWidgetState extends State<RadiusIndicateWidget> {
  late Timer timer;
  var value = 0.0;
  double speed = 1.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.timer =
        Timer.periodic(const Duration(milliseconds: 1000 ~/ 60), (timer) {
      if (value < 100) {
        setState(() {
          value += speed;
        });
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(),
      painter: RadialIndicatorCustom(value),
    );
  }
}
