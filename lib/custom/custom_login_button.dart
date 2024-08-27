import 'package:flutter/material.dart';
import 'package:todo_app/custom/custom_text.dart';

class CustomLoginButton extends StatelessWidget {
  final String image;
  final String name;
  final void Function() ontap;

  const CustomLoginButton(
      {super.key,
      required this.image,
      required this.name,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: InkWell(
        onTap: ontap,
        child: Card(
          elevation: 5,
          color: Colors.white,
          shadowColor: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset(
                  image,
                  height: 40,
                  width: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomText(
                    text: name,
                    size: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
