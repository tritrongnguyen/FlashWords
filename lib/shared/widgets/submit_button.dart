import 'package:flutter/material.dart';

import '../../configs/styles/app_colors.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final event;
  final TextStyle textStyle;

  const SubmitButton({
    required this.text,
    required this.event,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: event,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mediumPurple,
        minimumSize: Size.fromHeight(65),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
