import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    this.icon,
    this.radius,
    required this.text,
    required this.color,
    required this.onPressed,
    this.height,
    this.width,
  });
  String? text;
  Color? color;
  double? radius;
  IconData? icon;
  double? width;
  double? height;
  Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(radius ?? 0.0),
        color: color ?? const Color(0xff26688B),
      ),
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text ?? "",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
              Icon(
                icon,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
