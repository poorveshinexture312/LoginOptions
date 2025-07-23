import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../common/base/base_controller.dart';
import '../../utils/app_string.dart';

class MobilePasswordLoginController extends BaseController {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  final countryCodeTextController = TextEditingController();
  final FocusNode countryCodeFocusNode = FocusNode();
  bool checkBool = false;
  bool hidePwd = true;
  bool pwdBool = false;
  bool numberBool = false;
  bool errorEmailBool = false;
  final loader = false.obs;
  final phoneNumberError = ''.obs;
  String numberError = '';
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

  void onNumberChange(String? data) {
    final oldValue = numberBool;
    numberBool = false;
    if (oldValue != numberBool) {
      update(['login']);
    }
  }

  void onEmailChange(String? data) {
    final oldValue = errorEmailBool;
    errorEmailBool = false;
    if (oldValue != errorEmailBool) {
      update(['login']);
    }
  }

  void onChangePhone(String? data) {
    /// phone error
    if (phoneNumberController.text.trim().isEmpty) {
      phoneNumberError.value = AppString.phoneNumberError;
    } else if (phoneNumberController.text.trim().length != 10) {
      phoneNumberError.value = AppString.phoneNumberValidError;
    } else {
      phoneNumberError.value = "";
    }
  }

  void onSignInTap() {
    if (validation()) {}
    update(['login']);
  }

  bool validation() {
    /// phone error
    if (phoneNumberController.text.trim().isEmpty) {
      numberError = AppString.phoneNumberError;
    } else if (phoneNumberController.text.trim().length != 10) {
      numberError = AppString.phoneNumberValidError;
    } else {
      numberError = "";
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

    return (numberError.isEmpty && pwdError.isEmpty);
  }

  void setErrorIcon() {
    pwdBool = pwdError.isNotEmpty;
    errorEmailBool = emailError.isNotEmpty;
    numberBool = numberError.isNotEmpty;
  }

  void forgotPwdTap() {
    // Get.to(() => ForgotPwdScreen());
  }

  void onRegisterNowTap() {
    // Get.off(() => SignUpWithPhoneNumberScreen());
  }

  Future<void> sendLoginDataFun() async {}
}
