import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pm_login/common/base/service/toast.dart';

abstract class BaseController extends GetxController {
  var isProgress = false.obs;

  @protected
  final _toast = Get.put(ToastService());

  successToast(String message) {
    _toast.successToast(message);
  }

  errorToast(String message) {
    _toast.errorToast(message);
  }
}
