import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// ImageExtension file contains extension for string that
/// return an widget of image with it's file path.
/// E.g. 'user'.getSVGImage, returns SvgPicture.asset(assets/svgs/user.svg);
extension ImageExtension on String {
  String get getSVG => 'assets/icons/$this.svg';

  String get getPNG => 'assets/images/$this.png';

  /// Returns svg image
  Widget get getSVGImage => SvgPicture.asset(getSVG);

  /// Return svg image with custom height, width, color and boxFit.
  Widget getSVGImageHW(
          {double? height,
          double? width,
          Color? color,
          fit = BoxFit.contain}) =>
      SvgPicture.asset(getSVG,
          height: height, width: width, color: color, fit: fit);

  // Return svg image with custom height, width, color and boxFit.
  Widget getMenuImageHW(
          {double height = 24,
          double width = 24,
          Color? color,
          fit = BoxFit.contain}) =>
      SvgPicture.asset(
        getSVG,
        height: height,
        width: width,
        color: color,
        // colorFilter: ColorFilter.mode(color ?? ColorConstants.black, BlendMode.srcIn),
        fit: fit,
      );

  //Returns svg image
  Widget get getPngImage => Image.asset(getPNG);

  // Return PNG image with custom height, width, color and boxFit.
  Widget getPNGImageHW(
          {double? height,
          double? width,
          Color? color,
          fit = BoxFit.contain}) =>
      Image.asset(getPNG, height: height, width: width, color: color, fit: fit);

  /// Initial from name
  String get getInitial {
    if (isNotEmpty) {
      List strings = split(' ').where((element) => element.isNotEmpty).toList();
      if (strings.length >= 2) {
        return '${strings[0].toString().substring(0, 1)}${strings[1].toString().substring(0, 1)}'
            .toUpperCase();
      } else {
        return (strings[0].toString().length >= 2
                ? strings[0].toString().substring(0, 2)
                : strings[0].toString())
            .toUpperCase();
      }
    } else {
      return toUpperCase();
    }
  }
}

extension StringExtention on String? {
  bool get isNotEmptyString {
    return this != null && this!.isNotEmpty;
  }
}

extension IntExtention on int {
  String get intToTimeLeft {
    int h, m, s;

    h = this ~/ 3600;

    m = ((this - h * 3600)) ~/ 60;

    s = this - (h * 3600) - (m * 60);

    String minuteLeft = m.toString().length < 2 ? "0$m" : m.toString();

    String secondsLeft = s.toString().length < 2 ? "0$s" : s.toString();

    String result = "$minuteLeft:$secondsLeft";

    return result;
  }
}
