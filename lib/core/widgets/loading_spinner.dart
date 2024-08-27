import 'package:flutter/material.dart';

class LoadingSpinner extends StatelessWidget {
  final Color color;

  const LoadingSpinner({
    super.key,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
