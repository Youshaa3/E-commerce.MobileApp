import 'package:get/get.dart';
import 'package:e_commerce/core/data/models/cart_model.dart';
import 'package:e_commerce/core/services/base_controller.dart';
import 'package:e_commerce/ui/shared/utils.dart';
import 'package:e_commerce/ui/views/checkout_view/checkout_view.dart';

class CartController extends BaseController {
  List<CartModel> get cartList => cartService.cartList;

  void removeFromCart(CartModel model) {
    cartService.removeFromCart(
      model: model,
    );
  }

  void changeCount(bool incress, CartModel model) {
    cartService.changeCount(
      incress: incress,
      model: model,
    );
  }

  void checkout() {
    runFullLoadingFutureFunction(
        function: Future.delayed(Duration(seconds: 2)).then((value) {
      Get.off(CheckoutView());
    }));
  }
}
