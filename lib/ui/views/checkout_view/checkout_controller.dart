import 'package:get/get.dart';
import 'package:e_commerce/core/services/base_controller.dart';
import 'package:e_commerce/ui/shared/utils.dart';
import 'package:e_commerce/ui/views/main_view/main_view.dart';

class CheckoutController extends BaseController {
  @override
  void onClose() {
    cartService.clearCart();
    Get.off(MainView());
    super.onClose();
  }
}
