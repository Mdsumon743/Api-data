import 'dart:convert';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:todo_app/controller/api/PhotoModel.dart';
import 'package:todo_app/controller/api/UserModel.dart';

import 'model_class.dart';

class ApiController extends GetxController {
  RxList<ModelClass> listData = RxList<ModelClass>();
  RxList<PhotoModel> listPhoto = RxList<PhotoModel>();
  RxList<UserModel> listUser = RxList<UserModel>();
  RxBool isLoad = false.obs;

  Future<RxList<ModelClass>> getDataApi() async {
    try {
      isLoad.value = true;
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        for (var item in data) {
          listData.add(ModelClass.fromJson(item));
        }
        isLoad.value = false;
        return listData;
      } else {
        isLoad.value = false;
        return listData;
      }
    } catch (e) {
      return listData;
    }
  }

  Future<RxList<PhotoModel>> getPhotoApi() async {
    try {
      isLoad.value = true;
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        for (var item in data) {
          listPhoto.add(PhotoModel.fromJson(item));
        }
        isLoad.value = false;
        return listPhoto;
      } else {
        isLoad.value = false;
        return listPhoto;
      }
    } catch (e) {
      return listPhoto;
    }
  }

  Future<RxList<UserModel>> getDataUSer() async {
    try {
      isLoad.value = true;
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        for (var item in data) {
          listUser.add(UserModel.fromJson(item));
        }
        isLoad.value = false;
        return listUser;
      } else {
        isLoad.value = false;
        return listUser;
      }
    } catch (e) {
      return listUser;
    }
  }
}
