import 'package:e_commerce/core/enums/request_type.dart';
import 'package:e_commerce/ui/shared/utils.dart';

class NetworkConfig {
  static String BASE_API = 'products/';

  static String getFulApiUrl(String api) {
    return BASE_API + api;
  }

  static Map<String, String> getHeaders(
      {bool isMultipartRequest = false,
      bool? needAuth = true,
      RequestType? type = RequestType.POST,
      Map<String, String>? extraHeaders = const {}}) {
    return {
      if (needAuth!)
        'Authorization': 'Bearer ${storage.getTokenInfo()?.token ?? ''}',
      if (type != RequestType.GET && isMultipartRequest == false)
        'Content-Type': 'application/json',
      ...extraHeaders!
    };
  }
}
