import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/Screen/photo_data.dart';
import 'package:todo_app/Screen/post_data.dart';
import 'package:todo_app/Screen/user_data.dart';
import 'package:todo_app/custom/custom_button.dart';
import 'package:todo_app/custom/custom_text.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        scrolledUnderElevation: 0,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: const CustomText(
            text: 'Homepage',
            size: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white),
        centerTitle: true,
      ),
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                  text: 'Load Post Data',
                  ontap: () {
                    Get.to(const PostData());
                  }),

              CustomButton(
                  text: 'Load Photo Data',
                  ontap: () {
                    Get.to(const PhotoData());
                  }),
              CustomButton(
                  text: 'Load User Data',
                  ontap: () {
                    Get.to(const UserData());
                  }),

            ],
          ),
        ),
      ),
    );
  }
}
