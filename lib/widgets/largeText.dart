import 'package:flutter/material.dart';
import 'package:muzik_app/widgets/constants.dart';

class LargeText extends StatelessWidget {
  double size;
  final String text;
  final color;

  LargeText(
      {Key? key, this.size = 30, required this.text, this.color = colorfour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: size, fontWeight: FontWeight.bold, color: color),
    );
  }
}
