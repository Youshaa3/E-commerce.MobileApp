import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_button.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_text.dart';
import 'package:e_commerce/ui/shared/custom_widgets/virtical_divider.dart';
import 'package:e_commerce/ui/shared/utils.dart';
import 'package:e_commerce/ui/views/checkout_view/checkout_controller.dart';
import 'package:e_commerce/ui/views/main_view/main_view.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  CheckoutController controller = Get.put(CheckoutController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(25)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(top: screenWidth(15)),
              child: CustomText(
                content: "Your order placed successfully",
                colorText: AppColors.mainBlackColor,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth(10),
              ),
            ),
            (screenHeight(50)).ph,
            Row(
              children: [
                CustomText(
                  content: "Order No:    ",
                  colorText: AppColors.mainBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth(25),
                ),
                CustomText(
                  content: "#123910",
                  colorText: AppColors.mainBlackColor,
                ),
              ],
            ),
            (screenHeight(50)).ph,
            Row(
              children: [
                CustomText(
                  content: "Items Count: ",
                  colorText: AppColors.mainBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth(25),
                ),
                CustomText(
                  content: "${cartService.cartCount}",
                  colorText: AppColors.mainBlackColor,
                ),
              ],
            ),
            (screenHeight(50)).ph,
            VirticalDivider(),
            (screenHeight(50)).ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  content: "SubTotal:",
                  colorText: AppColors.mainBlueColor,
                  fontSize: screenWidth(20),
                ),
                CustomText(
                  content: "${cartService.subTotal.toString()}  SP",
                  colorText: AppColors.mainBlackColor,
                ),
              ],
            ),
            VirticalDivider(
              color: AppColors.mainBlueColor.withOpacity(0.3),
            ),
            (screenHeight(50)).ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  content: "Tax:",
                  colorText: AppColors.mainBlueColor,
                  fontSize: screenWidth(20),
                ),
                CustomText(
                  content: "${cartService.tax.toString()}  SP",
                  colorText: AppColors.mainBlackColor,
                )
              ],
            ),
            VirticalDivider(
              color: AppColors.mainBlueColor.withOpacity(0.3),
            ),
            (screenHeight(50)).ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  content: "Delivery Fees:",
                  colorText: AppColors.mainBlueColor,
                  fontSize: screenWidth(20),
                ),
                CustomText(
                  content: "${cartService.delivery.toString()}  SP",
                  colorText: AppColors.mainBlackColor,
                )
              ],
            ),
            VirticalDivider(
              color: AppColors.mainBlueColor.withOpacity(0.3),
            ),
            (screenHeight(50)).ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  content: "Total:",
                  colorText: AppColors.mainRedColor,
                  fontSize: screenWidth(20),
                ),
                CustomText(
                  content: "${cartService.total.toString()}  SP",
                  colorText: AppColors.mainBlackColor,
                )
              ],
            ),
            VirticalDivider(),
            Spacer(),
            CustomButton(
                text: "Continue Shopping",
                heightButton: 8,
                onPressed: () {
                  cartService.clearCart();
                  Get.off(MainView());
                })
          ],
        ),
      ),
    ));
  }
}
