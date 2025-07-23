import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../common/base/base_controller.dart';
import '../../utils/app_string.dart';

class UsernamePasswordLoginController extends BaseController {
  TextEditingController uNameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  bool checkBool = false;
  bool hidePwd = true;
  bool pwdBool = false;
  bool uNameBool = false;
  final loader = false.obs;
  final phoneNumberError = ''.obs;
  String uNameError = '';
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
    final oldValue = uNameBool;
    uNameBool = false;
    if (oldValue != uNameBool) {
      update(['login']);
    }
  }

  void onSignInTap() {
    if (validation()) {}
    update(['login']);
  }

  bool validation() {
    /// phone error
    if (uNameController.text.trim().isEmpty) {
      uNameError = AppString.phoneNumberError;
    } else {
      uNameError = "";
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

    return (uNameError.isEmpty && pwdError.isEmpty);
  }

  void setErrorIcon() {
    pwdBool = pwdError.isNotEmpty;
    uNameBool = uNameError.isNotEmpty;
  }

  void forgotPwdTap() {
    // Get.to(() => ForgotPwdScreen());
  }

  void onRegisterNowTap() {
    // Get.off(() => SignUpWithPhoneNumberScreen());
  }

  Future<void> sendLoginDataFun() async {}
}
