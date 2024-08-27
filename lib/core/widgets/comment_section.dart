import 'package:flutter/material.dart';

class CommentSection extends StatelessWidget {
  final List<String> comments;

  const CommentSection({
    super.key,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: comments.map((comment) => _buildComment(comment)).toList(),
    );
  }

  Widget _buildComment(String comment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            child: Icon(Icons.person),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("User Name", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(comment),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
