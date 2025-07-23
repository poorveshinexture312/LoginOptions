import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/base/base_controller.dart';
import '../list/login_option_screen.dart';

class VerifyOTPController extends BaseController {
  final TextEditingController pinController = TextEditingController();

  final loader = false.obs;

  bool isResendOtp = false;

  final timeRemain = 30.obs;
  final enableResend = false.obs;
  Timer? timer;

  @override
  onInit() {
    super.onInit();
    startTimer();
  }

  void onBackBtnTap() {
    Get.back();
    update();
  }

  Future<void> onVerifyTap() async {
    if (pinController.text.length < 6) {
      errorToast("Please enter Otp");
    } else {
      loader.value = true; // Start loader
      update(['loader']); // Update UI

      await Future.delayed(const Duration(seconds: 2)); // Wait for 2 seconds

      loader.value = false; // Stop loader
      update(['loader']); // Update UI again
      successToast("Otp Verified Successfully");
      Get.offAll(() => LoginOptionsScreen());
    }
  }

  void startTimer() {
    timeRemain.value = 30;
    if (timer != null) {
      timer!.cancel();
    }
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (timeRemain.value != 0) {
        enableResend.value = false;
        timeRemain.value--;
      } else {
        enableResend.value = true;
        timer!.cancel();
      }
    });
  }
}
