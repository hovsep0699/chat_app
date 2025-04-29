import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/constants/constants.dart';
import '../../../core/constants/gaps.dart';
import '../../../core/extensions/size_extension.dart';
import '../../../core/themes/app_colors.dart';
import '../../../resources/assets/assets.gen.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.errorText,
    this.onChanged,
    this.prefix,
    this.inputFormatters,
    this.fillColor = defaultTextInputColor,
    this.onFocusChange,
    this.onSubmit,
    this.centerText = false,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.textStyle,
  });

  final TextEditingController controller;
  final String hintText;
  final bool centerText;
  final Widget? prefix;
  final Color? fillColor;
  final bool obscureText;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(bool)? onFocusChange;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmit;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Focus(
          onFocusChange: onFocusChange,
          child: Stack(
            children: [
              TextFormField(
                onFieldSubmitted: onSubmit,
                onChanged: onChanged,
                textAlign: centerText ? TextAlign.center : TextAlign.start,
                inputFormatters: inputFormatters,
                controller: controller,
                obscureText: obscureText,
                keyboardType: keyboardType,
                validator: validator,
                style: textStyle,
                decoration: InputDecoration(
                    contentPadding: prefix != null ? Constants.searchIconPadding.paddingLeft : Gaps.large.paddingAll,
                    hintText: hintText,
                    filled: true,
                    fillColor: fillColor,
                    hintStyle: const TextStyle(color: darkGrey),
                    border: OutlineInputBorder(
                      borderRadius: Constants.containerBorderRadius.radiusAll,
                      borderSide: const BorderSide(color: lightGrey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: Constants.containerBorderRadius.radiusAll,
                      borderSide: const BorderSide(color: lightGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: Constants.containerBorderRadius.radiusAll,
                      borderSide: const BorderSide(color: lightGrey),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: Constants.containerBorderRadius.radiusAll,
                      borderSide: BorderSide(color: lightColorScheme.error),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: Constants.containerBorderRadius.radiusAll,
                      borderSide: const BorderSide(color: lightGrey),
                    ),
                    errorText: errorText),
              ),
              if (prefix != null) Align(alignment: Alignment.centerLeft, child:  prefix),
            ],
          ),
        ),
      ],
    );
  }
}
