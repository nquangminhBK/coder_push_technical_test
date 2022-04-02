import 'dart:convert';

import 'package:coder_push_interview/configs/api_config.dart';
import 'package:coder_push_interview/const/api_consts.dart';
import 'package:coder_push_interview/models/user_detail_model.dart';
import 'package:coder_push_interview/models/user_response_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class UserApi {
  //Utils utils = Get.put(Utils());

  static Future<UserResponseModel?> getListUser(int page) async {
    final customDio = await AppDio.getInstance().getAppDio();
    try {
      final response = await customDio.sendGetRequest(
          USER, {"page": page}, false);
      print(response);
      final result = UserResponseModel.fromJson(json.decode(response.toString()));
      return result;
    } catch (e) {
      return null;
    }
  }
  static Future<UserDetailModel?> getUserDetail(String id) async {
    final customDio = await AppDio.getInstance().getAppDio();
    try {
      final response = await customDio.sendGetRequest(
          "$USER/$id", {}, false);
      print(response);
      final result = UserDetailModel.fromJson(json.decode(response.toString()));
      return result;
    } catch (e) {
      return null;
    }
  }
}
