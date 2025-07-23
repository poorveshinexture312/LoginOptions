import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pm_login/common/image_extensions.dart';
import 'package:pm_login/common/sizer.dart';
import 'package:pm_login/screen/otpscreen/widget/otp_field.dart';

import '../../common/styles.dart';
import '../../common/widgets/common_screen_loader.dart';
import '../../common/widgets/submit_button.dart';
import '../../utils/app_color.dart';
import '../../utils/app_string.dart';
import '../../utils/asset.dart';
import 'otp_controller.dart';

class VerifyOTPScreen extends StatelessWidget {
  VerifyOTPScreen({Key? key}) : super(key: key);

  final VerifyOTPController controller = Get.put(VerifyOTPController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 2.46.h),
            child: SizedBox(
              height: 100.h,
              child: SafeArea(
                child: GetBuilder<VerifyOTPController>(
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.46.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () => Get.back(),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 3.20.h),
                              padding: EdgeInsets.all(1.23.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: AppColor.borderColor),
                              ),
                              child: Image.asset(
                                color: AppColor.black,
                                AssetRes.backIcon,
                                height: 2.33.h,
                                width: 2.33.h,
                              ),
                            ),
                          ),
                          Text(
                            AppString.otpVerification,
                            style: style700S25.copyWith(
                              color: AppColor.darkGrey,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 1.84.h,
                              bottom: 4.92.h,
                            ),
                            child: Text(
                              AppString.sentOtpToEmail,
                              style: style500S16.copyWith(color: AppColor.grey),
                            ),
                          ),
                          // Text(
                          //   AppString.verificationCode,
                          //   style: style600S20.copyWith(color: AppColor.darkGrey),
                          // ),
                          SizedBox(height: 3.07.h),
                          CommonOTPField(),
                          const SizedBox(height: 26),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Obx(
                                () => controller.enableResend.value
                                    ? Row(
                                        children: [
                                          const Text("Didn't received? "),
                                          InkWell(
                                            onTap: () {
                                              controller.pinController.text =
                                                  "";
                                            },
                                            child: const Text(
                                              "Resend",
                                              style: TextStyle(
                                                color: AppColor.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          const Text("Resend Code in "),
                                          Text(
                                            controller
                                                .timeRemain
                                                .value
                                                .intToTimeLeft,
                                            style: const TextStyle(
                                              color: AppColor.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          SubmitButton(
                            onTap: controller.onVerifyTap,
                            title: AppString.confirm,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Obx(() => CommonScreenLoader(showLoader: controller.loader.value)),
        ],
      ),
    );
  }
}
