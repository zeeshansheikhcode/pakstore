import 'package:flutter/material.dart';
class ReusableButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String? title;
  final Color? color;
  final Function()? ontap;
  const ReusableButton({super.key, this.height, this.width, this.title, this.color, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap;
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(title!),
        ),
      ),
    );
  }
}