
import 'package:coder_push_interview/db_sources/user_local_db.dart';
import 'package:coder_push_interview/screens/list_user_screen/list_user_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class ListUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListUserController>(() => ListUserController());
    Get.lazyPut<UserRepository>(() => UserRepository());
  }
}