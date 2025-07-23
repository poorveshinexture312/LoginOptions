import 'package:flutter/foundation.dart';

enum LogType { error, warning, success, action, canceled, info, non, size }

class Logger {
  static log(LogType logType, Object message) {
    if (kDebugMode) {
      switch (logType) {
        case LogType.error:
          print("📕📕📕 Error: $message 📕📕📕");
          break;
        case LogType.warning:
          print("📙📙📙 Warning: $message 📙📙📙");
          break;
        case LogType.success:
          print("📗📗📗 Success: $message 📗📗📗");
          break;
        case LogType.action:
          print("📘📘📘 Action: $message 📘📘📘");
          break;
        case LogType.canceled:
          print("📓📓📓 Cancelled: $message 📓📓📓");
          break;
        case LogType.info:
          print("ℹ️ℹ️ℹ️ info: $message ℹ️ℹ️ℹ️");
          break;
        case LogType.non:
          print("📗📗📗");
          print("info");
          print(message);
          print("📗📗📗");
          break;
        case LogType.size:
          _prints("📙📕📙 size : $message 📙📕📙");
      }
    }
  }

  static logMessage(
      {required LogType logType, String title = "", required dynamic message}) {
    if (kDebugMode) {
      switch (logType) {
        case LogType.error:
          print("📕📕📕 ${title == "" ? "Error" : title} : $message 📕📕📕");
          break;
        case LogType.warning:
          print("📙📙📙 ${title == "" ? "Warning" : title} : $message 📙📙📙");
          break;
        case LogType.success:
          print("📗📗📗 ${title == "" ? "Success" : title} : $message 📗📗📗");
          break;
        case LogType.action:
          print("📘📘📘 ${title == "" ? "Action" : title} : $message 📘📘📘");
          break;
        case LogType.canceled:
          print(
              "📓📓📓 ${title == "" ? "Cancelled" : title} : $message 📓📓📓");
          break;
        case LogType.info:
          print("ℹ️ℹ️ℹ️ ${title == "" ? "info" : title} : $message ℹ️ℹ️ℹ️");
          break;
        case LogType.non:
          print("📗📗📗");
          print(title == "" ? "info" : title);
          print(message);
          print("📗📗📗");
          break;
        case LogType.size:
          _prints("📙📕📙 ${title == "" ? "size" : title} $message 📙📕📙");
      }
    }
  }

  static _prints(var s1) {
    String s = s1.toString();
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(s).forEach((match) => debugPrint(match.group(0)));
  }
}
