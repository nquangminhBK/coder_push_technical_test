import 'package:coder_push_interview/db_sources/user_local_db.dart';
import 'package:get/get.dart';

import 'home_controller.dart';



class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
    Get.lazyPut<UserRepository>(() => UserRepository());
  }
}