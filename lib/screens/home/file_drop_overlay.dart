import 'package:flutter/material.dart';

class FileDropOverlay extends StatefulWidget {
  final Widget child;
  final Function(List<String>) onFilesDropped;

  const FileDropOverlay({Key? key, required this.child, required this.onFilesDropped}) : super(key: key);

  @override
  _FileDropOverlayState createState() => _FileDropOverlayState();
}

class _FileDropOverlayState extends State<FileDropOverlay> {
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      onWillAccept: (data) {
        setState(() {
          _isDragging = true;
        });
        return true;
      },
      onLeave: (data) {
        setState(() {
          _isDragging = false;
        });
      },
      onAccept: (data) {
        widget.onFilesDropped([data]);
        setState(() {
          _isDragging = false;
        });
      },
      builder: (context, candidateData, rejectedData) {
        return Stack(
          children: [
            widget.child,
            if (_isDragging)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: Text(
                    'Drop files here',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
