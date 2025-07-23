import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/app_color.dart';

Future<dynamic> showCommonDialog(Widget child,
    {bool showBackButton = true}) async {
  return await Get.dialog(
    Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 18.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: AppColor.white,
      child: child,
    ),
    barrierDismissible: false,
    barrierColor: AppColor.black.withOpacity(0.40),
  );
}
