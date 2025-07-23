import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pm_login/common/sizer.dart';
import 'package:pm_login/screen/splash/spalsh_controller.dart';

import '../../common/styles.dart';
import '../../common/widgets/common_screen_loader.dart';
import '../../common/widgets/common_textfield_with_country_code.dart';
import '../../common/widgets/submit_button.dart';
import '../../utils/app_color.dart';
import '../../utils/app_string.dart';
import '../../utils/asset.dart';
import 'country_mobile_otp_login_controller.dart';

class CountryMobileOtpLoginScreen extends StatefulWidget {
  const CountryMobileOtpLoginScreen({super.key});

  @override
  State<CountryMobileOtpLoginScreen> createState() =>
      _CountryMobileOtpLoginScreenState();
}

class _CountryMobileOtpLoginScreenState
    extends State<CountryMobileOtpLoginScreen> {
  final CountryMobileOtpLoginController controller = Get.put(
    CountryMobileOtpLoginController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(left: 2.46.h, right: 2.46.h),
            child: SizedBox(
              height: 100.h,
              child: SafeArea(
                child: GetBuilder<CountryMobileOtpLoginController>(
                  id: 'login',
                  builder: (logic) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 2.46.h, top: 6.77.h),
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
                          SizedBox(height: 1.h),
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
                          const Spacer(),
                          SubmitButton(
                            onTap: controller.onSignupTap,
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
                                      ..onTap = controller.onLoginNowTap,
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
