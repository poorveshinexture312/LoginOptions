import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/app_color.dart';
import '../styles.dart';
import 'common_widget.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? errorText;
  final Widget? action;
  final String? suffixImg;
  final VoidCallback? onSuffixTap;
  final bool? obSecure;
  final TextInputType? textInputType;
  final Color? fillColor;
  final bool? colorBool;
  final Widget? prefix;
  final double? suffixSize;
  final double? suffixMaxWidth;
  final bool? readOnly;
  final Function(String)? onChanged;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;

  const CommonTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.obSecure,
    this.textInputType,
    this.action,
    this.suffixMaxWidth,
    this.errorText,
    this.fillColor,
    this.colorBool,
    this.prefix,
    this.onChanged,
    this.suffixSize,
    this.onSuffixTap,
    this.suffixImg,
    this.readOnly,
    this.maxLength,
    this.inputFormatters,
    this.minLines,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          controller: controller,
          obscureText: obSecure ?? false,
          keyboardType: textInputType,
          onChanged: onChanged,
          readOnly: readOnly ?? false,
          minLines: minLines ?? 1,
          maxLines: maxLines ?? 1,
          decoration: InputDecoration(
            counterText: "",
            border: border(),
            disabledBorder: border(),
            enabledBorder: border(),
            errorBorder: border(),
            focusedBorder: border(),
            focusedErrorBorder: border(),
            filled: colorBool ?? true,
            fillColor: fillColor ?? AppColor.lightGrey,
            hintText: hintText,
            hintStyle: style400S14.copyWith(color: AppColor.grey),
            labelStyle: style400S14.copyWith(color: AppColor.grey),
            /*contentPadding: EdgeInsets.symmetric(
              vertical: 1.84.h,
              horizontal: 5.06.w,
            ),*/
            prefixIcon: prefix == null
                ? null
                : Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 12),
                    child: prefix,
                  ),
            suffixIcon: action != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: action,
                  )
                : suffixImg != null
                ? InkWell(
                    onTap: onSuffixTap,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0, left: 10),
                      child: Image.asset(
                        suffixImg!,
                        width: 20,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  )
                : const SizedBox(),
            suffixIconConstraints: BoxConstraints(
              maxHeight: 50,
              minHeight: 50,
              maxWidth: suffixMaxWidth ?? 100,
            ),
            prefixIconConstraints: const BoxConstraints(
              maxHeight: 50,
              maxWidth: 42,
              minWidth: 42,
            ),
          ),
        ),
        ErrorText(text: errorText),
      ],
    );
  }

  InputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: (errorText ?? '').isNotEmpty
            ? AppColor.red
            : AppColor.borderColor,
        width: 1,
      ),
    );
  }
}
