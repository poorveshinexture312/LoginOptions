import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pm_login/common/sizer.dart';

import '../../../common/styles.dart';
import '../../../utils/app_color.dart';
import '../otp_controller.dart';
import 'package:pinput/pinput.dart';

class CommonOTPField extends StatelessWidget {
  final VerifyOTPController controller = Get.find();

  CommonOTPField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Pinput(
          length: 6,
          controller: controller.pinController,
          defaultPinTheme: defaultPinTheme.copyWith(
            decoration: BoxDecoration(
              color: AppColor.lightGrey,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColor.borderColor),
            ),
          ),
          onCompleted: (pin) {
            debugPrint('onCompleted: $pin');
          },
          onChanged: (value) {
            debugPrint('onChanged: $value');
          },
          cursor: const Column(mainAxisAlignment: MainAxisAlignment.end),
          focusedPinTheme: defaultPinTheme,
          submittedPinTheme: defaultPinTheme,
          errorPinTheme: defaultPinTheme.copyBorderWith(
            border: Border.all(color: Colors.black),
          ),
        ),
      ],
    );
  }

  final defaultPinTheme = PinTheme(
    margin: EdgeInsets.only(right: 2.w),
    width: 20.w,
    height: 14.w,
    textStyle: style700S22.copyWith(color: AppColor.black),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: AppColor.black.withOpacity(0.3)),
    ),
  );
}
