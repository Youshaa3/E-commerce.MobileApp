import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_text.dart';
import 'package:e_commerce/ui/shared/utils.dart';
import 'package:e_commerce/ui/views/main_view/home_view/home_controller.dart';
import 'package:e_commerce/ui/views/product_details_view/product_details_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
              start: screenWidth(15), top: screenWidth(15)),
          child: CustomText(
            content: "Categories",
            colorText: AppColors.mainBlackColor,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth(10),
          ),
        ),
        Container(
          height: screenWidth(3),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Obx(() {
                return Row(
                  children: [
                    (screenWidth(15)).pw,
                    InkWell(
                      onTap: () {
                        controller.changeCategory(
                            category: controller.type[index]);
                        controller.selected
                            .replaceRange(0, 3, [false, false, false]);
                        controller.selected[index] = true;
                        print(controller.categoryList1);
                      },
                      child: Container(
                        width: screenWidth(3),
                        height: screenHeight(15),
                        decoration: BoxDecoration(
                            color: controller.selected[index]
                                ? AppColors.mainBlueColor
                                : AppColors.mainWhiteColor,
                            borderRadius:
                                BorderRadius.circular(screenWidth(40)),
                            border: Border.all(
                              color: controller.selected[index]
                                  ? AppColors.mainBlueColor
                                  : AppColors.mainWhiteColor,
                            )),
                        child: Center(
                            child: Text(
                          controller.type[index],
                          style: TextStyle(fontSize: screenWidth(20)),
                        )),
                      ),
                    ),
                    (screenWidth(150)).pw,
                  ],
                );
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
              start: screenWidth(15), bottom: screenWidth(15)),
          child: CustomText(
            content: "Products",
            colorText: AppColors.mainBlackColor,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth(10),
          ),
        ),
        Obx(() {
          return controller.categoryList.length == 0
              ? SpinKitCircle(color: AppColors.mainBlueColor)
              : GridView.count(
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 5,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: controller.categoryList.map((element) {
                    return Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal: screenWidth(45),
                          vertical: screenWidth(45)),
                      child: InkWell(
                        onTap: () {
                          Get.to(ProductDetailsView(
                            categoryModel: element,
                          ));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.mainWhiteColor,
                                borderRadius:
                                    BorderRadius.circular(screenWidth(40)),
                                border: Border.all(
                                  color: AppColors.mainGreyColor,
                                )),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.mainGreyColor
                                            .withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(
                                            screenWidth(20)),
                                      ),
                                      child: RatingBar.builder(
                                        initialRating: element.rating!.rate!,
                                        unratedColor: AppColors.mainGrey2Color,
                                        glowColor: AppColors.mainBlueColor,
                                        itemSize: screenWidth(35),
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding:
                                            EdgeInsetsDirectional.symmetric(
                                                horizontal: screenWidth(150)),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: AppColors.mainBlueColor,
                                        ),
                                        onRatingUpdate: (rating) {
                                          Null;
                                          //controller.rating.value = rating;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                CachedNetworkImage(
                                  imageUrl: element.image!,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  width: screenWidth(4),
                                  height: screenHeight(5),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      start: screenWidth(20)),
                                  child: Column(
                                    children: [
                                      Text(
                                        element.title!,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      (screenWidth(15)).ph,
                                      Row(
                                        children: [
                                          CustomText(
                                            content: "Price: ",
                                            colorText: AppColors.mainBlueColor,
                                          ),
                                          CustomText(
                                              content: element.price.toString())
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                    );
                  }).toList(),
                );
        })
      ],
    );
  }
}
