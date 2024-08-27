import 'package:flutter/material.dart';

class MapPinWidget extends StatelessWidget {
  final String label;
  final Color color;

  const MapPinWidget({
    super.key,
    required this.label,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.location_on, color: color, size: 40.0),
        Text(label, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
