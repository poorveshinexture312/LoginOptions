import 'package:flutter/material.dart';
import 'package:pm_login/common/sizer.dart';

import '../../utils/app_color.dart';
import '../styles.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? title;
  final Color? fillColor;

  const SubmitButton({Key? key, this.onTap, this.title, this.fillColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.33.h),
        decoration: BoxDecoration(
          color: fillColor ?? AppColor.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title ?? '',
            style: style600S15.copyWith(color: AppColor.white),
          ),
        ),
      ),
    );
  }
}
