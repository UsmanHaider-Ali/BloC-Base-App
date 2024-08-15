import 'package:bloc_base_app/resources/colors_manager.dart';
import 'package:bloc_base_app/resources/values_manager.dart';
import 'package:bloc_base_app/utils/size_utils.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.context,
    this.width,
    this.controller,
    this.obscureText = false,
    this.isEnabled = true,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.labelText,
    this.prefix,
    this.suffix,
    this.onChanged,
  });

  final BuildContext context;

  final double? width;

  final TextEditingController? controller;

  final bool? obscureText;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final String? labelText;

  final Widget? prefix;

  final Widget? suffix;

  final bool? isEnabled;

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: textFormFieldWidget,
    );
  }

  Widget get textFormFieldWidget => SizedBox(
        width: width ?? double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            labelText != null
                ? Text(
                    labelText!,
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                : Container(),
            labelText != null ? SizedBox(height: 4.v) : Container(),
            TextFormField(
              controller: controller,
              style: Theme.of(context).textTheme.bodyLarge,
              obscureText: obscureText!,
              textInputAction: TextInputAction.next,
              keyboardType: textInputType,
              maxLines: maxLines ?? 1,
              enabled: isEnabled,
              decoration: decoration,
              autofocus: false,
              onChanged: onChanged,
              onTapOutside: ((event) {
                FocusScope.of(context).requestFocus(FocusNode());
              }),
            ),
          ],
        ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: Theme.of(context).textTheme.bodySmall,
        prefixIcon: prefix,
        suffixIcon: suffix,
        isDense: true,
        contentPadding: EdgeInsets.all(16.h),
        fillColor: ColorsManager.textFormFieldFilledColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizesManager.buttonTextFieldRadius),
          borderSide: const BorderSide(
            color: ColorsManager.textFormFieldBorderColor,
            width: 0.25,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizesManager.buttonTextFieldRadius),
          borderSide: const BorderSide(
            color: ColorsManager.textFormFieldBorderColor,
            width: 0.25,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizesManager.buttonTextFieldRadius),
          borderSide: const BorderSide(
            color: ColorsManager.textFormFieldBorderColor,
            width: 0.25,
          ),
        ),
      );
}

extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get outlineBlack => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.h),
        borderSide: BorderSide.none,
      );
}
