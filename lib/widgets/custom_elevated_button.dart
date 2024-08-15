import 'package:bloc_base_app/resources/colors_manager.dart';
import 'package:bloc_base_app/resources/values_manager.dart';
import 'package:bloc_base_app/utils/size_utils.dart';
import 'package:bloc_base_app/widgets/base_button.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends BaseButton {
  const CustomElevatedButton({
    super.key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    super.margin,
    super.onPressed,
    super.buttonStyle,
    super.alignment,
    super.buttonTextStyle,
    super.isDisabled,
    super.height,
    super.width,
    required super.text,
    required super.context,
  });

  final BoxDecoration? decoration;

  final Widget? leftIcon;

  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget,
          )
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => Container(
        height: height ?? 54.v,
        width: width ?? double.maxFinite,
        margin: margin,
        decoration: decoration,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsManager.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizesManager.buttonTextFieldRadius),
            ),
            disabledBackgroundColor: ColorsManager.primaryColor.withOpacity(0.25),
            disabledForegroundColor: ColorsManager.primaryColor.withOpacity(0.25),
            visualDensity: const VisualDensity(
              vertical: -4,
              horizontal: -4,
            ),
            padding: EdgeInsets.zero,
          ),
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              Text(
                text,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: ColorsManager.buttonTextColor,
                      fontSize: 15.adaptSize,
                    ),
              ),
              rightIcon ?? const SizedBox.shrink(),
            ],
          ),
        ),
      );
}
