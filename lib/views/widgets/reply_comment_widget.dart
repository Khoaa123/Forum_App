import 'package:flutter/material.dart';
import 'package:voz_app/models/thread_model.dart';

class ReplyCommentWidget extends StatelessWidget {
  final Comment? reply;

  const ReplyCommentWidget({super.key, required this.reply});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFe9ecef),
        border: Border(
          left: BorderSide(
            color: Color(0xFF23497C),
            width: 5,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${reply!.userName}:",
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
          Text(
            reply!.content,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
