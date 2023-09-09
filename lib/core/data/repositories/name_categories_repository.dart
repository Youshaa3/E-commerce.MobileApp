import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;

class NameCategoriesRepository {
  Future<Either<String, List<String>>> getAll() async {
    try {
      final response = await http
          .get(Uri.parse("https://fakestoreapi.com/products/categories"));
      if (response.statusCode == 200) {
        final parsedResponse = jsonDecode(response.body).cast<String>();
        return Right(parsedResponse);
      } else {
        return Left("Request failed with status:${response.statusCode}");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
