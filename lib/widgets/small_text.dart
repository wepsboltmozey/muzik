import 'package:flutter/material.dart';
import 'package:muzik_app/widgets/constants.dart';

class SmallText extends StatelessWidget {
  double size;
  final String text;
  final color;

  SmallText(
      {Key? key, this.size = 16, required this.text, this.color = colorfour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size, fontWeight: FontWeight.normal, color: color),
    );
  }
}
