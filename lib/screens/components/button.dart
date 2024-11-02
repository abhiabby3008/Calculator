import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button(
      {super.key,
      required this.title,
      required this.onpress,
      required this.color,
      required this.txtcolor});

  String title;
  Color color;
  Color txtcolor;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onpress,
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: txtcolor, fontSize: 18, fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
    );
  }
}
