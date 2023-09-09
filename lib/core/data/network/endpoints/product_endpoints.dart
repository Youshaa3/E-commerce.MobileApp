import 'package:e_commerce/core/data/network/network_config.dart';

class ProductEndpoints {
  static String getallCategory = NetworkConfig.getFulApiUrl('');
  static String getElectronics =
      NetworkConfig.getFulApiUrl('category/electronics');
  static String getJewelery = NetworkConfig.getFulApiUrl('category/jewelery');
}
