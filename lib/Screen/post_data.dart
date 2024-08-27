import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/api/apicontroller.dart';

import '../custom/custom_text.dart';

class PostData extends StatelessWidget {
  const PostData({super.key});

  @override
  Widget build(BuildContext context) {
    final apiController = Get.put(ApiController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        scrolledUnderElevation: 0,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: const CustomText(
            text: 'Api data',
            size: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {Get.back();},
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
      ),
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: apiController.getDataApi(),
                  builder: (context, snapshot) {
                    return Obx(() => apiController.isLoad.value == true
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                            ),
                          )
                        : ListView.builder(
                            itemCount: apiController.listData.length,
                            itemBuilder: (context, index) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CustomText(
                                    text: 'Loading...',
                                    size: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black);
                              } else {
                                return Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(top: 5),
                                  child: Card(
                                    child: ListTile(
                                      title: CustomText(
                                          text:
                                              'Tittle\n${apiController.listData[index].title}',
                                          size: 16,
                                          max: 2,
                                          textOverflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                      subtitle: CustomText(
                                          text:
                                              'Description\n${apiController.listData[index].body}',
                                          max: 4,
                                          textOverflow: TextOverflow.ellipsis,
                                          size: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                      leading: CustomText(
                                          text: apiController.listData[index].id
                                              .toString(),
                                          size: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.blue),
                                    ),
                                  ),
                                );
                              }
                            },
                          ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
