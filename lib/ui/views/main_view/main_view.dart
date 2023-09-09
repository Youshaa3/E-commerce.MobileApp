import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/views/main_view/all_product_view/all_product_view.dart';
import 'package:e_commerce/ui/views/main_view/cart_view/cart_view.dart';
import 'package:e_commerce/ui/views/main_view/home_view/home_view.dart';
import 'package:e_commerce/ui/views/main_view/main_controller.dart';
import 'package:e_commerce/ui/views/main_view/main_view_widgets/bottom_navigation_widget.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  MainController controller = MainController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.mainGrey2Color,
      bottomNavigationBar: Obx(() {
        return BottomNavigationWidget(
          bottomNavigation: controller.selected.value,
          onTap: (select, pageNumber) {
            controller.selected.value = select;
            controller.pageController.jumpToPage(pageNumber);
          },
        );
      }),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          AllProductView(),
          HomeView(),
          CartView(),
        ],
      ),
    ));
  }
}
