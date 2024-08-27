import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final TextStyle textStyle;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.color = AppColors.primaryColor,
    this.textStyle = AppTextStyles.bodyText1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      child: Text(
        label,
        style: textStyle,
      ),
    );
  }
}
