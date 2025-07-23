import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_color.dart';

class CommonScreenLoader extends StatelessWidget {
  final bool showLoader;
  const CommonScreenLoader({super.key, this.showLoader = false});

  @override
  Widget build(BuildContext context) {
    return showLoader
        ? Container(
            // color: Colors.black12,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CircularProgressIndicator(color: AppColor.black),
                  ],
                ),
              ],
            ))
        : const SizedBox.shrink();
  }
}
