import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';

class FileCard extends StatelessWidget {
  final String fileName;
  final String fileSize;
  final VoidCallback onTap;

  const FileCard({
    super.key,
    required this.fileName,
    required this.fileSize,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: ListTile(
          leading: Icon(Icons.insert_drive_file, color: Colors.grey[700]),
          title: Text(fileName, style: AppTextStyles.bodyText1),
          subtitle: Text(fileSize, style: AppTextStyles.caption),
        ),
      ),
    );
  }
}
