import 'package:delicious_food_admin/pages/add_food_page.dart';
import 'package:delicious_food_admin/pages/home_page.dart';
import 'package:delicious_food_admin/pages/login_page.dart';
import 'package:delicious_food_admin/routes/routes_name.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RoutesName.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: RoutesName.HOME,
      page: () => const HomePage(),
    ),
    GetPage(
      name: RoutesName.ADDFOOD,
      page: () => const AddFoodPage(),
    ),
  ];
}
