import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_button.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_text.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_text_button.dart';
import 'package:e_commerce/ui/shared/custom_widgets/virtical_divider.dart';
import 'package:e_commerce/ui/shared/utils.dart';
import 'package:e_commerce/ui/views/checkout_view/checkout_view.dart';
import 'package:e_commerce/ui/views/main_view/cart_view/cart_controller.dart';
import 'package:e_commerce/ui/views/product_details_view/product_details_view.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth(25)),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(top: screenWidth(15)),
            child: CustomText(
              content: "Cart",
              colorText: AppColors.mainBlackColor,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth(10),
            ),
          ),
          (screenWidth(25)).ph,
          Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: controller.cartList
                  .map((e) => Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenWidth(50)),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.mainWhiteColor,
                              borderRadius:
                                  BorderRadius.circular(screenWidth(40)),
                              border:
                                  Border.all(color: AppColors.mainGreyColor)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: e.categoryModel?.image ?? "",
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  width: screenWidth(4),
                                  height: screenHeight(6),
                                ),
                                (screenWidth(25)).pw,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: screenWidth(2.4),
                                          child: Text(
                                            e.categoryModel?.title ?? "",
                                            //overflow: TextOverflow.ellipsis,
                                            // style: TextStyle(fontSize: screenWidth(50)),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              start: screenWidth(53),
                                              bottom: screenHeight(18)),
                                          child: IconButton(
                                              onPressed: () {
                                                controller.removeFromCart(e);
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: AppColors.mainRedColor,
                                              )),
                                        ),
                                      ],
                                    ),
                                    //(screenWidth(20)).ph,
                                    Row(
                                      children: [
                                        CustomText(
                                          content: "Price: ",
                                          colorText: AppColors.mainBlueColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        CustomText(
                                          content: e.categoryModel?.price
                                                  ?.toString() ??
                                              "",
                                          colorText: AppColors.mainBlackColor,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CustomText(
                                          content: "Total: ",
                                          colorText: AppColors.mainBlueColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        CustomText(
                                          content: e.totalItem.toString(),
                                          colorText: AppColors.mainBlackColor,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: screenWidth(8)),
                                      child: Row(
                                        children: [
                                          ElevatedButton(
                                            onPressed: e.count == 1
                                                ? null
                                                : () {
                                                    controller.changeCount(
                                                        false, e);
                                                  },
                                            child: Text("-"),
                                            style: ElevatedButton.styleFrom(
                                                shape: StadiumBorder(),
                                                backgroundColor:
                                                    AppColors.mainBlueColor,
                                                disabledBackgroundColor:
                                                    AppColors.mainGreyColor,
                                                fixedSize: Size(screenWidth(8),
                                                    screenHeight(25))),
                                          ),
                                          (screenWidth(45)).pw,
                                          CustomText(
                                            content: "${e.count}",
                                            colorText: AppColors.mainBlackColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: screenWidth(28),
                                          ),
                                          (screenWidth(50)).pw,
                                          ElevatedButton(
                                            onPressed: () {
                                              controller.changeCount(true, e);
                                            },
                                            child: Text("+"),
                                            style: ElevatedButton.styleFrom(
                                              shape: StadiumBorder(),
                                              backgroundColor:
                                                  AppColors.mainBlueColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            );
          }),
          (screenHeight(50)).ph,
          VirticalDivider(),
          (screenHeight(50)).ph,
          Obx(() {
            return Column(
              children: [
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
              ],
            );
          }),
          (screenHeight(5)).ph,
          CustomButton(
            text: "Placed Order",
            onPressed: () {
              controller.checkout();
            },
            heightButton: 8,
          ),
          CustomTextButton(
            onPressed: () {
              cartService.clearCart();
            },
            text: "Empty Cart",
            decoration: TextDecoration.underline,
            decorationThickness: 2,
          )
        ],
      ),
    );
  }
}
