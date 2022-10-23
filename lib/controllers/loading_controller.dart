import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

// initilize the loading controller
final loaderController = Get.put(LoadingController());

// show the loading screen
class LoadingController extends GetxController {
  // show progress message
  changeProgress(bool value, String msg) {
    //
    if (value == true) {
      //
      EasyLoading.show(status: msg, dismissOnTap: false);
      //
    } else {
      EasyLoading.dismiss();
    }
    update();
  }

  // show error message when
  showErrorMsg(String msg) {
    EasyLoading.showError(msg, duration: const Duration(seconds: 3));
    update();
  }

  showSuccess(String msg) {
    EasyLoading.showSuccess(msg, duration: const Duration(seconds: 4));
    update();
  }
}