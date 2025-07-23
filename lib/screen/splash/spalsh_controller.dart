import 'package:get/get.dart';
import 'package:pm_login/screen/list/login_option_screen.dart';

import '../../common/base/base_controller.dart';

class SplashController extends BaseController {
  init() {
    Future.delayed(3.seconds, () async {
      Get.off(() => LoginOptionsScreen());
    });
  }
}
