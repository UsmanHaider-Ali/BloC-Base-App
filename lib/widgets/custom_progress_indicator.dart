import 'package:bloc_base_app/resources/colors_manager.dart';
import 'package:bloc_base_app/utils/size_utils.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key, this.strokeWidth = 4.0});
  final double strokeWidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54.adaptSize,
      child: Center(
          child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: const AlwaysStoppedAnimation<Color>(
          ColorsManager.primaryColor,
        ),
      )),
    );
  }
}
