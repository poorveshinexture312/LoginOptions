import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pm_login/common/styles.dart';
import '../../app_routes.dart';
import 'login_option_tile.dart';

class LoginOptionsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> options = [
    {'title': 'Username + Password', 'route': AppRoutes.USERNAME_PASSWORD},
    {'title': 'Mobile Number + Password', 'route': AppRoutes.MOBILE_PASSWORD},
    {
      'title': 'Country Code + Mobile Number + Password',
      'route': AppRoutes.COUNTRY_MOBILE_PASSWORD,
    },
    {'title': 'Email + Password', 'route': AppRoutes.EMAIL_PASSWORD},
    {'title': 'Mobile + OTP', 'route': AppRoutes.MOBILE_OTP},
    {
      'title': 'Country Code + Mobile + OTP',
      'route': AppRoutes.COUNTRY_MOBILE_OTP,
    },
    {'title': 'Email + OTP', 'route': AppRoutes.EMAIL_OTP},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Choose Your Login Method', style: style600S18),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: options.length,
          itemBuilder: (context, index) {
            return LoginOptionTile(
              title: options[index]['title'],
              onTap: () => Get.toNamed(options[index]['route']),
            );
          },
        ),
      ),
    );
  }
}
