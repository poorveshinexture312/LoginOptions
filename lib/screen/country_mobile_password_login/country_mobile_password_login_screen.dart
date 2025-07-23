import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pm_login/common/sizer.dart';
import 'package:pm_login/common/widgets/common_textfield_with_country_code.dart';

import '../../common/styles.dart';
import '../../common/widgets/common_screen_loader.dart';
import '../../common/widgets/common_textfield.dart';
import '../../common/widgets/submit_button.dart';
import '../../utils/app_color.dart';
import '../../utils/app_string.dart';
import '../../utils/asset.dart';
import 'country_mobile_password_login_controller.dart';

class CountryMobilePasswordScreen extends StatefulWidget {
  const CountryMobilePasswordScreen({super.key});

  @override
  State<CountryMobilePasswordScreen> createState() =>
      _CountryMobilePasswordScreenState();
}

class _CountryMobilePasswordScreenState
    extends State<CountryMobilePasswordScreen> {
  final CountryMobilePasswordController controller = Get.put(
    CountryMobilePasswordController(),
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
                child: GetBuilder<CountryMobilePasswordController>(
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
                                AppString.phoneNumber,
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
                          CommonTextFieldCountryCode(
                            controller: controller.phoneNumberController,
                            hintText: "Enter Phone Number",
                            errorText: controller.numberError,
                            suffixImg: controller.numberBool
                                ? AssetRes.errorTagImg
                                : null,
                            onChanged: controller.onChangePhone,
                            maxLength: 15,
                            onCountryCodeChanged:
                                controller.onCountryCodeChange,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9]'),
                              ),
                            ],
                            textInputType: TextInputType.number,
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
                                  style: style600S14.copyWith(
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
