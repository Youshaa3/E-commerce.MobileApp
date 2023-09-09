import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:e_commerce/core/enums/bottom_navigation_enum.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_text.dart';
import 'package:e_commerce/ui/shared/utils.dart';
import 'package:e_commerce/ui/views/main_view/main_view_widgets/bottom_navigation_controller.dart';

class BottomNavigationWidget extends StatefulWidget {
  final BottomNavigationEnum bottomNavigation;
  final Function(BottomNavigationEnum, int) onTap;
  const BottomNavigationWidget(
      {super.key, required this.bottomNavigation, required this.onTap});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  late BottomNavigationController controller;
  @override
  void initState() {
    controller = BottomNavigationController(widget.bottomNavigation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.mainWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(screenWidth(10)),
            topRight: Radius.circular(screenWidth(10)),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Obx(() {
            return IconButton(
                onPressed: () {
                  widget.onTap(BottomNavigationEnum.ALLPRODUCT, 0);
                  controller.type1.value = BottomNavigationEnum.ALLPRODUCT;
                },
                icon: SvgPicture.asset("images/ic_all_product.svg",
                    width: screenWidth(12),
                    color: controller.type1.value ==
                            BottomNavigationEnum.ALLPRODUCT
                        ? AppColors.mainBlueColor
                        : AppColors.mainBlackColor));
          }),
          Obx(() {
            return IconButton(
                onPressed: () {
                  widget.onTap(BottomNavigationEnum.HOME, 1);
                  controller.type1.value = BottomNavigationEnum.HOME;
                },
                icon: SvgPicture.asset("images/ic_home.svg",
                    width: screenWidth(12),
                    color: controller.type1.value == BottomNavigationEnum.HOME
                        ? AppColors.mainBlueColor
                        : AppColors.mainBlackColor));
          }),
          Obx(() {
            return Stack(
              children: [
                IconButton(
                    onPressed: () {
                      widget.onTap(BottomNavigationEnum.CART, 2);
                      controller.type1.value = BottomNavigationEnum.CART;
                    },
                    icon: SvgPicture.asset("images/ic_cart.svg",
                        width: screenWidth(12),
                        color:
                            controller.type1.value == BottomNavigationEnum.CART
                                ? AppColors.mainBlueColor
                                : AppColors.mainBlackColor)),
                cartService.cartCount == 0
                    ? SizedBox.shrink()
                    : Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth(13), top: screenWidth(15)),
                        child: Container(
                          width: screenWidth(30),
                          height: screenHeight(50),
                          decoration: BoxDecoration(
                            color: AppColors.mainRedColor,
                            borderRadius:
                                BorderRadius.circular(screenWidth(20)),
                          ),
                          child: Center(
                              child: CustomText(
                            content: cartService.cartCount.toString(),
                            colorText: AppColors.mainWhiteColor,
                          )),
                        ),
                      ),
              ],
            );
          })
        ],
      ),
    );
  }
}
