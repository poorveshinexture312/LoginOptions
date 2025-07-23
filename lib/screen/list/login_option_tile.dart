import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pm_login/common/styles.dart';

class LoginOptionTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const LoginOptionTile({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: ListTile(
        title: Text(title, style: style500S16),
        trailing: Icon(Icons.arrow_forward_ios, size: 15),
        onTap: onTap,
      ),
    );
  }
}
