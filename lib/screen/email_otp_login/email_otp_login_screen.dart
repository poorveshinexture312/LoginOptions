import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pm_login/common/sizer.dart';

import '../../common/styles.dart';
import '../../common/widgets/common_screen_loader.dart';
import '../../common/widgets/common_textfield.dart';
import '../../common/widgets/submit_button.dart';
import '../../utils/app_color.dart';
import '../../utils/app_string.dart';
import '../../utils/asset.dart';
import 'email_otp_login_controller.dart';

class EmailOtpLoginScreen extends StatefulWidget {
  const EmailOtpLoginScreen({super.key});

  @override
  State<EmailOtpLoginScreen> createState() => _EmailOtpLoginScreenState();
}

class _EmailOtpLoginScreenState extends State<EmailOtpLoginScreen> {
  final EmailOtpLoginController controller = Get.put(EmailOtpLoginController());

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
                child: GetBuilder<EmailOtpLoginController>(
                  id: 'login',
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 2.46.h, top: 2.77.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              AssetRes.splashScreenImg,
                              height: 15.55.h,
                            ),
                          ),
                          SizedBox(height: 2.77.h),
                          Text(
                            AppString.welcomeBack,
                            style: style700S25.copyWith(
                              color: AppColor.darkGrey,
                            ),
                          ),
                          SizedBox(height: 3.69.h),
                          Row(
                            children: [
                              Text(
                                AppString.emailAddress,
                                style: style600S16.copyWith(
                                  color: AppColor.black,
                                ),
                              ),
                              Text(
                                " *",
                                style: style600S16.copyWith(
                                  color: AppColor.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 0.50.h),
                          CommonTextField(
                            controller: controller.emailController,
                            hintText: "Enter Email",
                            errorText: controller.emailError,
                            suffixImg: controller.emailBool
                                ? AssetRes.errorTagImg
                                : null,
                            onChanged: controller.onNameChange,
                            textInputType: TextInputType.emailAddress,
                          ),
                          const Spacer(),
                          SubmitButton(
                            onTap: () {
                              controller.onSignInTap();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            title: AppString.sendCode,
                          ),
                          SizedBox(height: 3.7.h),
                          Center(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: AppString.doNotHaveAccount,
                                    style: style500S15.copyWith(
                                      color: AppColor.darkGrey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " ${AppString.signUp}",
                                    style: style600S15.copyWith(
                                      color: AppColor.black,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = controller.onRegisterNowTap,
                                  ),
                                ],
                              ),
                            ),
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
