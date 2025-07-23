import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../common/base/base_controller.dart';
import '../../utils/app_string.dart';

class EmailPasswordLoginController extends BaseController {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  bool checkBool = false;
  bool hidePwd = true;
  bool pwdBool = false;
  bool emailBool = false;
  final loader = false.obs;
  final phoneNumberError = ''.obs;
  String emailError = '';
  String pwdError = '';

  void onPwdVisibilityChange() {
    hidePwd = !hidePwd;
    update(['login']);
  }

  void onPwdChange(String? data) {
    final oldValue = pwdBool;
    pwdBool = false;
    if (oldValue != pwdBool) {
      update(['login']);
    }
  }

  void onNameChange(String? data) {
    final oldValue = emailBool;
    emailBool = false;
    if (oldValue != emailBool) {
      update(['login']);
    }
  }

  void onSignInTap() {
    if (validation()) {}
    update(['login']);
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

    /// Password error
    if (pwdController.text.trim().isEmpty) {
      pwdError = AppString.passwordError;
    } else if (pwdController.text.trim().length < 8) {
      pwdError = AppString.pwdSignInError;
    } else if (pwdController.text.trim().length > 50) {
      pwdError = AppString.passwordMaxLength;
    } else {
      pwdError = "";
    }

    /// check error icon
    setErrorIcon();

    update(['login']);

    return (emailError.isEmpty && pwdError.isEmpty);
  }

  void setErrorIcon() {
    pwdBool = pwdError.isNotEmpty;
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
