import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';

class NotificationTile extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onTap;

  const NotificationTile({
    super.key,
    required this.title,
    required this.message,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: AppTextStyles.bodyText1),
      subtitle: Text(message, style: AppTextStyles.bodyText2),
      onTap: onTap,
    );
  }
}
