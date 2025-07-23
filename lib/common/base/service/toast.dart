import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_color.dart';

class ToastService {
  errorToast(String message) {
    _showSnackbar(message, AppColor.black);
  }

  successToast(String message) {
    _showSnackbar(message, Colors.greenAccent);
  }

  _showSnackbar(String message, Color color) {
    Get.rawSnackbar(
        backgroundColor: color,
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.BOTTOM,
        messageText: Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ));
  }
}
