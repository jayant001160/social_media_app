import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  final bool isLiked;
  final ValueChanged<bool> onLikeChanged;

  const LikeButton({
    super.key,  // Convert 'key' to a super parameter.
    required this.isLiked,
    required this.onLikeChanged,
  });

  @override
  LikeButtonState createState() => LikeButtonState();
}

class LikeButtonState extends State<LikeButton> {
  late bool _isLiked; // Mark _isLiked as 'late'.

  @override
  void initState() {
    super.initState();
    _isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isLiked ? Icons.favorite : Icons.favorite_border,
        color: _isLiked ? Colors.red : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          _isLiked = !_isLiked;
        });
        widget.onLikeChanged(_isLiked);
      },
    );
  }
}
