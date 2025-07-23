import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/app_color.dart';
import '../styles.dart';
import 'common_widget.dart';
import 'package:country_code_picker/country_code_picker.dart';

class CommonTextFieldCountryCode extends StatelessWidget {
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
  final Function(CountryCode)? onCountryCodeChanged;

  const CommonTextFieldCountryCode({
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
    this.onCountryCodeChanged,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: fillColor ?? AppColor.lightGrey,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: (errorText ?? '').isNotEmpty
                  ? AppColor.black
                  : AppColor.borderColor,
              width: 1,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              CountryCodePicker(
                onChanged:
                    onCountryCodeChanged ??
                    (code) => print("Selected code: ${code.dialCode}"),
                initialSelection: 'IN',
                favorite: ['+91', 'IN'],
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                alignLeft: false,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
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
                    hintText: hintText,
                    hintStyle: style400S14.copyWith(color: AppColor.grey),
                    border: InputBorder.none,
                    suffixIcon:
                        action ??
                        (suffixImg != null
                            ? InkWell(
                                onTap: onSuffixTap,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Image.asset(
                                    suffixImg!,
                                    width: suffixSize ?? 20,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              )
                            : null),
                  ),
                ),
              ),
            ],
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
