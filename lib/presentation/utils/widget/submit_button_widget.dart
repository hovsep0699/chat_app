// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/extensions/size_extension.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
    required this.backgroundColor,
    required this.titleColor,
    this.isLoading = false,
    this.isValid = true,
    this.borderColor
  });

  final Function() onPressed;
  final String title;
  final bool isValid;
  final Color backgroundColor;
  final Color titleColor;
  final bool isLoading;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: isLoading || !isValid
            ? null
            : () {
          FocusScope.of(context).unfocus();
          onPressed.call();
        },
        style: ElevatedButton.styleFrom(
          side: borderColor != null ? BorderSide(
            color: borderColor!
          ) : BorderSide.none,
          backgroundColor: backgroundColor,
          foregroundColor: titleColor,
          shape: RoundedRectangleBorder(
            borderRadius: Constants.containerBorderRadius.radiusAll,
          ),
        ),
        child: isLoading
            ? Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            )
          ],
        )
            : Text(title),
      ),
    );
  }
}
