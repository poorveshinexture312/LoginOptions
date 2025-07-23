import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pm_login/common/sizer.dart';
import 'package:pm_login/screen/splash/spalsh_controller.dart';

import '../../utils/app_color.dart';
import '../../utils/asset.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController _controller = Get.put(SplashController());

  @override
  void initState() {
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              AssetRes.splashScreenImg,
              height: 25.51.h,
              color: AppColor.white,
            ),
          ),
        ],
      ),
    );
  }
}
