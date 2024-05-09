import 'package:delicious_food_admin/controllers/authentication_controller.dart';
import 'package:delicious_food_admin/controllers/home_controller.dart';
import 'package:get/get.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationController());
    Get.lazyPut(() => HomeController());
  }
}
