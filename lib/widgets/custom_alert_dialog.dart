import 'package:bloc_base_app/resources/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key, required this.title, required this.content, required this.yesText, required this.noText, this.onYes, this.onNo});

  final String title;
  final String content;
  final String yesText;
  final String noText;
  final void Function()? onYes;
  final void Function()? onNo;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      title: Text(title, style: Theme.of(context).textTheme.titleLarge),
      content: Text(content, style: Theme.of(context).textTheme.bodyMedium),
      actions: <Widget>[
        TextButton(
          onPressed: onYes,
          child: Text(
            yesText,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorsManager.redColor),
          ),
        ),
        TextButton(
          onPressed: onNo,
          child: Text(
            noText,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorsManager.greenColor),
          ),
        ),
      ],
    );
  }
}
