import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final double width;
  final double heigth;
  final Color color;
  final Icon icon;
  final VoidCallback onclick;

  const CircularButton(
      {Key? key,
      required this.width,
      required this.heigth,
      required this.color,
      required this.icon,
      required this.onclick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      width: width,
      height: heigth,
      child: IconButton(
        onPressed: onclick,
        icon: icon,
        enableFeedback: true,
      ),
    );
  }
}
