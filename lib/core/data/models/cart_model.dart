import 'dart:convert';

import 'package:e_commerce/core/data/models/apis/category_model.dart';

class CartModel {
  int? count;
  double? totalItem;
  CategoryModel? categoryModel;

  CartModel({this.count, this.totalItem, this.categoryModel});

  CartModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    totalItem = json['totalItem'];
    categoryModel = json['meal_model'] != null
        ? new CategoryModel.fromJson(json['meal_model'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['totalItem'] = this.totalItem;
    if (this.categoryModel != null) {
      data['meal_model'] = this.categoryModel!.toJson();
    }
    return data;
  }

  static Map<String, dynamic> toMap(CartModel model) {
    return {
      "count": model.count,
      "totalItem": model.totalItem,
      "meal_model": model.categoryModel,
    };
  }

  static String encode(List<CartModel> list) => json.encode(
        list
            .map<Map<String, dynamic>>((element) => CartModel.toMap(element))
            .toList(),
      );

  static List<CartModel> decode(String strList) =>
      (json.decode(strList) as List<dynamic>)
          .map<CartModel>((item) => CartModel.fromJson(item))
          .toList();
}
