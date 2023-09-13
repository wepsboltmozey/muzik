import 'package:flutter/material.dart';
import 'package:muzik_app/widgets/constants.dart';
import 'package:muzik_app/widgets/small_text.dart';

class ResponsiveButton extends StatelessWidget {
  double? width;
  bool? isresponsive;
  final String text;
  ResponsiveButton(
      {Key? key,
      required this.text,
      this.width = 130,
      this.isresponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
          color: colortwo, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmallText(
            text: text,
            color: colorfour,
          )
        ],
      ),
    );
  }
}
