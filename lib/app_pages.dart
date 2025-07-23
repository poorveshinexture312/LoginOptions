import 'package:get/get.dart';
import 'package:pm_login/screen/country_mobile_otp_login/country_mobile_otp_login_screen.dart';
import 'package:pm_login/screen/country_mobile_password_login/country_mobile_password_login_screen.dart';
import 'package:pm_login/screen/email_otp_login/email_otp_login_screen.dart';
import 'package:pm_login/screen/email_password_login/email_password_login_screen.dart';
import 'package:pm_login/screen/list/login_option_screen.dart';
import 'package:pm_login/screen/mobile_otp_login/mobile_otp_login_screen.dart';
import 'package:pm_login/screen/mobile_password_login/mobile_password_login_screen.dart';
import 'package:pm_login/screen/username_password_login/username_password_login_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.LOGIN_OPTIONS, page: () => LoginOptionsScreen()),
    GetPage(
      name: AppRoutes.USERNAME_PASSWORD,
      page: () => UsernamePasswordLoginScreen(),
    ),
    GetPage(
      name: AppRoutes.MOBILE_PASSWORD,
      page: () => MobilePasswordLoginScreen(),
    ),
    GetPage(
      name: AppRoutes.COUNTRY_MOBILE_PASSWORD,
      page: () => CountryMobilePasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.EMAIL_PASSWORD,
      page: () => EmailPasswordLoginScreen(),
    ),
    GetPage(name: AppRoutes.MOBILE_OTP, page: () => MobileOtpLoginScreen()),
    GetPage(
      name: AppRoutes.COUNTRY_MOBILE_OTP,
      page: () => CountryMobileOtpLoginScreen(),
    ),
    GetPage(name: AppRoutes.EMAIL_OTP, page: () => EmailOtpLoginScreen()),
  ];
}
