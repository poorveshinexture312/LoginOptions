import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:country_code_picker/country_code_picker.dart';

import '../../common/base/base_controller.dart';
import '../../utils/app_string.dart';

class CountryMobilePasswordController extends BaseController {
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

  /// Default country code value
  String selectedCountryCode = '+91';

  void onCountryCodeChange(CountryCode code) {
    selectedCountryCode = code.dialCode ?? '+91';
    update(['login']);
  }

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
    final number = phoneNumberController.text.trim();
    if (number.isEmpty) {
      phoneNumberError.value = AppString.phoneNumberError;
    } else if (!isValidNumberLength(number)) {
      phoneNumberError.value = AppString.phoneNumberValidError;
    } else {
      phoneNumberError.value = "";
    }
  }

  bool isValidNumberLength(String number) {
    switch (selectedCountryCode) {
      case '+91': // India
        return number.length == 10;
      case '+1': // US/Canada
        return number.length == 10;
      case '+44': // UK
        return number.length >= 10 && number.length <= 11;
      default:
        return number.length >= 6; // fallback
    }
  }

  void onSignInTap() {
    if (validation()) {
      final fullPhoneNumber = '$selectedCountryCode${phoneNumberController.text.trim()}';
      print("Login with phone: $fullPhoneNumber");
      // sendLoginDataFun(fullPhoneNumber, pwdController.text);
    }
    update(['login']);
  }

  bool validation() {
    if (phoneNumberController.text.trim().isEmpty) {
      numberError = AppString.phoneNumberError;
    } else if (phoneNumberController.text.trim().length != 10) {
      numberError = AppString.phoneNumberValidError;
    } else {
      numberError = "";
    }

    if (pwdController.text.trim().isEmpty) {
      pwdError = AppString.passwordError;
    } else if (pwdController.text.trim().length < 8) {
      pwdError = AppString.pwdSignInError;
    } else if (pwdController.text.trim().length > 50) {
      pwdError = AppString.passwordMaxLength;
    } else {
      pwdError = "";
    }

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
