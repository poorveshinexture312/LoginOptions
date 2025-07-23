import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../common/base/base_controller.dart';
import '../../utils/app_string.dart';
import '../otpscreen/otp_screen.dart';

class MobileOtpLoginController extends BaseController {
  TextEditingController phoneController = TextEditingController();

  var checkBool = false.obs;
  var errorPhoneNumber = false.obs;

  var phoneError = ''.obs;
  final loader = false.obs;

  Future<void> onSignupTap() async {
    if (validation()) {
      loader.value = true; // Start loader
      update(['loader']); // Update UI

      await Future.delayed(const Duration(seconds: 2)); // Wait for 2 seconds

      loader.value = false; // Stop loader
      update(['loader']); // Update UI again

      Get.to(() => VerifyOTPScreen()); // Navigate
    } else {
      update(['loader']);
    }
  }

  void onchangePhoneFun(String? data) {
    final oldValue = errorPhoneNumber.value;
    errorPhoneNumber.value = false;
    if (oldValue != errorPhoneNumber.value) {
      update(['loader']);
    }
  }

  bool validation() {
    /// phone error
    if (phoneController.text.trim().isEmpty) {
      phoneError.value = AppString.phoneNumberError;
    } else if (phoneController.text.trim().length != 10) {
      phoneError.value = AppString.phoneNumberValidError;
    } else {
      phoneError.value = "";
    }
    setErrorIcon();

    update(['loader']);

    return (phoneError.isEmpty);
  }

  void setErrorIcon() {
    errorPhoneNumber.value = phoneError.isNotEmpty;
  }

  void checkBoolFun() {
    checkBool.value = !(checkBool.value);
    //update(["loader"]);
  }

  void onLoginNowTap() {}
}
