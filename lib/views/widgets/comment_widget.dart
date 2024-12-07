import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:voz_app/models/thread_model.dart';
import 'package:voz_app/ultils/format_date.dart';
import 'package:voz_app/views/widgets/reply_comment_widget.dart';

class CommentWidget extends StatefulWidget {
  final Comment comment;
  final ThreadModel thread;

  const CommentWidget({
    super.key,
    required this.comment,
    required this.thread,
  });

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  Comment? parentComment;
  int dislikeReactionsCount = 0;
  int likeReactionsCount = 0;

  @override
  void initState() {
    super.initState();
    if (widget.comment.parentCommentId != null) {
      for (var comment in widget.thread.comments) {
        if (comment.id == widget.comment.parentCommentId) {
          parentComment = comment;
          break;
        }
      }
    }
    likeReactionsCount = 0;
    dislikeReactionsCount = 0;
    for (var reaction in widget.comment.reactions) {
      if (reaction.type == 0) {
        likeReactionsCount++;
      } else if (reaction.type == 1) {
        dislikeReactionsCount++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFedf2f4),
              width: 5,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: ClipOval(
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 30,
                  height: 30,
                  fit: BoxFit.fill,
                ),
              ),
              title: Text(
                widget.comment.userName,
                style: const TextStyle(
                  color: Color(0xFF23497C),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Text(
                FormatDate.formatDate(widget.comment.createdAt),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
            if (parentComment != null) ReplyCommentWidget(reply: parentComment),
            const SizedBox(height: 15),
            Html(
              data: widget.comment.content,
              style: {
                "p": Style(
                  fontSize: FontSize.large,
                ),
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      likeReactionsCount > 0
                          ? Row(
                              children: [
                                Image.asset(
                                  "assets/images/kiss.png",
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  likeReactionsCount.toString(),
                                  style: const TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(width: 10),
                              ],
                            )
                          : const SizedBox.shrink(),
                      dislikeReactionsCount > 0
                          ? Row(
                              children: [
                                Image.asset(
                                  "assets/images/beat.png",
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  dislikeReactionsCount.toString(),
                                  style: const TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          "Trả lời",
                          style: TextStyle(
                            color: Color(0xFF23497C),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          "Thích",
                          style: TextStyle(
                            color: Color(0xFF23497C),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
