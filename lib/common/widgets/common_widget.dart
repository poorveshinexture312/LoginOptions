import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/asset.dart';
import '../styles.dart';

class ErrorText extends StatelessWidget {
  final String? text;

  const ErrorText({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if ((text ?? '').isEmpty) {
      return const SizedBox();
    }
    return Column(
      children: [
        const SizedBox(height: 4),
        Text(
          text ?? '',
          style: style400S14.copyWith(color: AppColor.red, fontSize: 12),
        ),
      ],
    );
  }
}

class CommonLoader extends StatelessWidget {
  const CommonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColor.black,
      ),
    );
  }
}

