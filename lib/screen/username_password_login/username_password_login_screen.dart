import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pm_login/common/sizer.dart';
import 'package:pm_login/screen/username_password_login/username_password_login_controller.dart';

import '../../common/styles.dart';
import '../../common/widgets/common_screen_loader.dart';
import '../../common/widgets/common_textfield.dart';
import '../../common/widgets/submit_button.dart';
import '../../utils/app_color.dart';
import '../../utils/app_string.dart';
import '../../utils/asset.dart';

class UsernamePasswordLoginScreen extends StatefulWidget {
  const UsernamePasswordLoginScreen({super.key});

  @override
  State<UsernamePasswordLoginScreen> createState() =>
      _UsernamePasswordLoginScreenState();
}

class _UsernamePasswordLoginScreenState
    extends State<UsernamePasswordLoginScreen> {
  final UsernamePasswordLoginController controller = Get.put(
    UsernamePasswordLoginController(),
  );

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
                child: GetBuilder<UsernamePasswordLoginController>(
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
                          /*CommonTextField(
                              controller: controller.emailController,
                              hintText: AppString.email,
                              errorText: controller.emailError,
                              suffixImg: controller.errorEmailBool
                                  ? AssetRes.errorTagImg
                                  : null,
                              onChanged: controller.onEmailChange,
                            ),*/
                          Row(
                            children: [
                              Text(
                                AppString.username,
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
                            controller: controller.uNameController,
                            hintText: "Enter User Number",
                            errorText: controller.uNameError,
                            suffixImg: controller.uNameBool
                                ? AssetRes.errorTagImg
                                : null,
                            onChanged: controller.onNameChange,
                            textInputType: TextInputType.text,
                          ),
                          SizedBox(height: 1.84.h),
                          Row(
                            children: [
                              Text(
                                AppString.password,
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
                            controller: controller.pwdController,
                            hintText: AppString.hintPassword,
                            errorText: controller.pwdError,
                            obSecure: controller.hidePwd,
                            suffixImg: controller.pwdBool
                                ? AssetRes.errorTagImg
                                : controller.hidePwd
                                ? AssetRes.pwdVisible
                                : AssetRes.pwdHidden,
                            onChanged: controller.onPwdChange,
                            onSuffixTap: controller.onPwdVisibilityChange,
                          ),
                          SizedBox(height: 1.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                controller.forgotPwdTap();
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                child: Text(
                                  AppString.forgotPwd,
                                  style: style500S14.copyWith(
                                    color: AppColor.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          SubmitButton(
                            onTap: () {
                              controller.onSignInTap();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            title: AppString.signIn,
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
                                    style: style500S15.copyWith(
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
