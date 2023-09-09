import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:e_commerce/core/data/repositories/shared_preference_repository.dart';
import 'package:e_commerce/core/services/cart_service.dart';
import 'package:e_commerce/ui/shared/colors.dart';

double screenWidth(double perecent) {
  return Get.size.width / perecent;
}

double screenHeight(double perecent) {
  return Get.size.height / perecent;
}

SharedPreferenceRepository get storage =>
    Get.find<SharedPreferenceRepository>();

void customLoader() => BotToast.showCustomLoading(toastBuilder: (builder) {
      return Container(
        width: screenWidth(5),
        height: screenWidth(5),
        decoration: BoxDecoration(
            color: AppColors.mainBlackColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15)),
        child: SpinKitCircle(color: AppColors.mainBlueColor),
      );
    });

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}

double get taxAmount => 0.18;
double get deliveryAmount => 0.1;
CartService get cartService => Get.find<CartService>();
