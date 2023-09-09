import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/data/models/apis/category_model.dart';
import 'package:e_commerce/core/data/models/common_response.dart';
import 'package:e_commerce/core/data/network/endpoints/product_endpoints.dart';
import 'package:e_commerce/core/data/network/network_config.dart';
import 'package:e_commerce/core/enums/request_type.dart';
import 'package:e_commerce/core/utils/network_util.dart';

class CategoryRepository {
  Future<Either<String, List<CategoryModel>>> getAll() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ProductEndpoints.getallCategory,
        headers: NetworkConfig.getHeaders(
          needAuth: false,
        ),
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<CategoryModel> result = [];
          commonResponse.data!.forEach(
            (element) {
              result.add(CategoryModel.fromJson(element));
            },
          );
          return Right(result);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<CategoryModel>>> getElectronics() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ProductEndpoints.getElectronics,
        headers: NetworkConfig.getHeaders(
          needAuth: false,
        ),
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<CategoryModel> result = [];
          commonResponse.data!.forEach(
            (element) {
              result.add(CategoryModel.fromJson(element));
            },
          );
          return Right(result);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<CategoryModel>>> getJewelery() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ProductEndpoints.getJewelery,
        headers: NetworkConfig.getHeaders(
          needAuth: false,
        ),
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<CategoryModel> result = [];
          commonResponse.data!.forEach(
            (element) {
              result.add(CategoryModel.fromJson(element));
            },
          );
          return Right(result);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
