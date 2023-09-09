import 'package:get/get.dart';
import 'package:e_commerce/core/enums/bottom_navigation_enum.dart';
import 'package:e_commerce/core/services/base_controller.dart';

class BottomNavigationController extends BaseController {
  BottomNavigationController(BottomNavigationEnum type) {
    type1.value = type;
  }
  Rx<BottomNavigationEnum> type1 = BottomNavigationEnum.HOME.obs;
}
