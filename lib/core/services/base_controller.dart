import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:e_commerce/core/enums/request_status.dart';
import 'package:e_commerce/ui/shared/utils.dart';

class BaseController extends GetxController {
  Rx<RequestStatus> requestStatus = RequestStatus.DEFUALT.obs;

  Future runFutureFunction({required Future function}) async {
    await function;
  }

  Future runLoadingFutureFunction({
    required Future function,
  }) async {
    requestStatus.value = RequestStatus.LOADING;

    await function;
    requestStatus.value = RequestStatus.DEFUALT;
  }

  Future runFullLoadingFutureFunction({
    required Future function,
  }) async {
    customLoader();
    await function;
    BotToast.closeAllLoading();
  }
}
