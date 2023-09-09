import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:e_commerce/core/data/models/apis/category_model.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_button.dart';
import 'package:e_commerce/ui/shared/custom_widgets/custom_text.dart';
import 'package:e_commerce/ui/shared/utils.dart';
import 'package:e_commerce/ui/views/product_details_view/product_details_controller.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  late ProductDetailsController controller;
  @override
  void initState() {
    controller = Get.put(ProductDetailsController(widget.categoryModel));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth(25)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (screenWidth(20)).ph,
            CustomText(
              content: widget.categoryModel.title!,
              colorText: AppColors.mainBlackColor,
              fontSize: screenWidth(20),
            ),
            Center(
              child: CachedNetworkImage(
                imageUrl: widget.categoryModel.image!,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                width: screenWidth(1.5),
                height: screenHeight(3.7),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  content: "Description:",
                  colorText: AppColors.mainBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth(20),
                ),
                RatingBar.builder(
                  initialRating: widget.categoryModel.rating!.rate!,
                  unratedColor: AppColors.mainGrey2Color,
                  glowColor: AppColors.mainBlueColor,
                  itemSize: screenWidth(30),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsetsDirectional.symmetric(
                      horizontal: screenWidth(180)),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: AppColors.mainBlueColor,
                  ),
                  onRatingUpdate: (rating) {
                    Null;
                    //controller.rating.value = rating;
                  },
                ),
              ],
            ),
            (screenWidth(35)).ph,
            CustomText(
              content: widget.categoryModel.description!,
              colorText: AppColors.mainBlackColor,
            ),
            (screenWidth(9)).ph,
            Row(
              children: [
                CustomText(
                  content: "Category: ",
                  colorText: AppColors.mainBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth(25),
                ),
                CustomText(
                  content: widget.categoryModel.category!,
                  colorText: AppColors.mainBlackColor,
                ),
              ],
            ),
            (screenWidth(15)).ph,
            Row(
              children: [
                CustomText(
                  content: "Price: ",
                  colorText: AppColors.mainBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth(25),
                ),
                CustomText(
                  content: widget.categoryModel.price!.toString(),
                  colorText: AppColors.mainBlackColor,
                ),
              ],
            ),
            Spacer(),
            Obx(() {
              return Row(
                children: [
                  CustomButton(
                      text: "Add To Cart",
                      widthButton: 2.5,
                      heightButton: 10,
                      onPressed: () {
                        controller.addToCart();
                      }),
                  (screenWidth(10)).pw,
                  ElevatedButton(
                    onPressed: controller.count.value == 1
                        ? null
                        : () {
                            controller.changeCount(false);
                          },
                    child: Text("-"),
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: AppColors.mainBlueColor,
                        disabledBackgroundColor: AppColors.mainGreyColor,
                        fixedSize: Size(screenWidth(8), screenHeight(25))),
                  ),
                  (screenWidth(45)).pw,
                  CustomText(
                    content: "${controller.count}",
                    colorText: AppColors.mainBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth(28),
                  ),
                  (screenWidth(50)).pw,
                  ElevatedButton(
                    onPressed: () {
                      controller.changeCount(true);
                    },
                    child: Text("+"),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: AppColors.mainBlueColor,
                    ),
                  )
                ],
              );
            })
          ],
        ),
      ),
    ));
  }
}
