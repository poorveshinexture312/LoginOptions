import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pm_login/screen/list/login_option_screen.dart';
import 'package:pm_login/screen/splash/splash_screen.dart';
import 'package:pm_login/utils/app_color.dart';

import 'app_pages.dart';
import 'app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(1.seconds);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // Set status bar color to red globally
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColor.black, // Set status bar color to red
      statusBarIconBrightness: Brightness.light, // Light icons for contrast
    ),
  );

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 811),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          theme: Theme.of(context).copyWith(
            appBarTheme: Theme.of(context).appBarTheme.copyWith(
              systemOverlayStyle: SystemUiOverlayStyle.light,
            ),
          ),
          title: 'pm_login',
          debugShowCheckedModeBanner: false,
          home: LoginOptionsScreen(),
          initialRoute: AppRoutes.LOGIN_OPTIONS,
          getPages: AppPages.pages,
        );
      },
    ),
  );
}
