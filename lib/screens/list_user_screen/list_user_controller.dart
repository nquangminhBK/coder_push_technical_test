import 'package:coder_push_interview/db_sources/user_local_db.dart';
import 'package:coder_push_interview/models/user_response_model.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ListUserController extends GetxController {
  Rx<List<UserBasicInfo>> listUsers = Rx<List<UserBasicInfo>>([]);
  final userRepository = Get.find<UserRepository>();

  @override
  void onInit() async {
    String type = Get.arguments["type"];
    if (type == "dislike") {
      listUsers.value = await userRepository.getAllDislikedUser();
    } else {
      listUsers.value = await userRepository.getAllLikedUser();
    }
    print(listUsers.value);
    update();
    super.onInit();
  }
}
