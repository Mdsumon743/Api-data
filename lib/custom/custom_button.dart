import 'package:flutter/material.dart';
import 'package:todo_app/custom/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() ontap;
  const CustomButton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: CustomText(
              text: text,
              size: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
      ),
    );
  }
}
