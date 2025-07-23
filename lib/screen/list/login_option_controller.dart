import 'package:get/get.dart';

import '../../common/base/base_controller.dart';

class SplashController extends BaseController {
  init() {
    Future.delayed(3.seconds, () async {
      // Get.off(() => ListScreen());
    });
  }
}
