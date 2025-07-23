import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../common/base/base_controller.dart';
import '../../utils/app_string.dart';
import '../otpscreen/otp_screen.dart';

class CountryMobileOtpLoginController extends BaseController {
  TextEditingController phoneNumberController = TextEditingController();

  final countryCodeTextController = TextEditingController();
  final FocusNode countryCodeFocusNode = FocusNode();

  bool checkBool = false;
  bool numberBool = false;

  final loader = false.obs;
  final phoneNumberError = ''.obs;

  String numberError = '';

  /// Default country code value
  String selectedCountryCode = '+91';

  void onCountryCodeChange(CountryCode code) {
    selectedCountryCode = code.dialCode ?? '+91';
    update(['login']);
  }

  void onNumberChange(String? data) {
    final oldValue = numberBool;
    numberBool = false;
    if (oldValue != numberBool) {
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

  Future<void> onSignupTap() async {
    if (validation()) {
      final fullPhoneNumber =
          '$selectedCountryCode${phoneNumberController.text.trim()}';
      print("Login with phone: $fullPhoneNumber");

      loader.value = true; // Start loader
      update(['login']); // Update UI

      await Future.delayed(const Duration(seconds: 2)); // Wait for 2 seconds

      loader.value = false; // Stop loader
      update(['login']); // Update UI again

      Get.to(() => VerifyOTPScreen()); // Navig
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

    setErrorIcon();
    update(['login']);
    return (numberError.isEmpty);
  }

  void setErrorIcon() {
    numberBool = numberError.isNotEmpty;
  }

  void forgotPwdTap() {
    // Get.to(() => ForgotPwdScreen());
  }

  void onRegisterNowTap() {
    // Get.off(() => SignUpWithPhoneNumberScreen());
  }

  Future<void> sendLoginDataFun() async {}

  void onLoginNowTap() {}
}
