import 'package:flutter/material.dart';
import 'package:e_commerce/ui/shared/colors.dart';
import 'package:e_commerce/ui/shared/utils.dart';

class VirticalDivider extends StatelessWidget {
  const VirticalDivider({super.key, this.color, this.width});
  final Color? color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width ?? screenWidth(1),
        height: screenWidth(200),
        color: color ?? AppColors.mainBlueColor,
      ),
    );
  }
}
