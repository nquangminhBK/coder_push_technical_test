import 'package:coder_push_interview/screens/home_screen/home_bindings.dart';
import 'package:coder_push_interview/screens/home_screen/home_screen.dart';
import 'package:coder_push_interview/screens/list_user_screen/list_user_bindings.dart';
import 'package:coder_push_interview/screens/list_user_screen/list_user_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'app_routes.dart';

class AppPages {
  static const INITIAL_ROUTE = Routes.HOME_SCREEN;
  static final routes = [
    GetPage(
        name: Routes.HOME_SCREEN, page: () => HomeScreen(), binding: HomeScreenBinding()),
    GetPage(
        name: Routes.LIST_USER, page: () => ListUserScreen(), binding: ListUserBinding()),

  ];
}
