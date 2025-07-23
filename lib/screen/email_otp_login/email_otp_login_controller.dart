import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pm_login/screen/otpscreen/otp_screen.dart';

import '../../common/base/base_controller.dart';
import '../../utils/app_string.dart';

class EmailOtpLoginController extends BaseController {
  TextEditingController emailController = TextEditingController();
  bool checkBool = false;
  bool emailBool = false;
  final loader = false.obs;
  String emailError = '';

  void onNameChange(String? data) {
    final oldValue = emailBool;
    emailBool = false;
    if (oldValue != emailBool) {
      update(['login']);
    }
  }

  void onSignInTap() async {
    if (validation()) {
      loader.value = true; // Start loader
      update(['login']); // Update UI

      await Future.delayed(const Duration(seconds: 2)); // Wait for 2 seconds

      loader.value = false; // Stop loader
      update(['login']); // Update UI again

      Get.to(() => VerifyOTPScreen()); // Navigate
    } else {
      update(['login']);
    }
  }

  bool validation() {
    /// phone error
    if (emailController.text.trim().isEmpty) {
      emailError = AppString.emailError;
    } else if (emailController.text.trim().isNotEmpty &&
        !emailController.text.trim().isEmail) {
      emailError = AppString.emailValidError;
    } else {
      emailError = "";
    }

    /// check error icon
    setErrorIcon();

    update(['login']);

    return (emailError.isEmpty);
  }

  void setErrorIcon() {
    emailBool = emailError.isNotEmpty;
  }

  void forgotPwdTap() {
    // Get.to(() => ForgotPwdScreen());
  }

  void onRegisterNowTap() {
    // Get.off(() => SignUpWithPhoneNumberScreen());
  }

  Future<void> sendLoginDataFun() async {}
}
