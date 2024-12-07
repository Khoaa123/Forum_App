import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:voz_app/models/thread_model.dart';
import 'package:voz_app/ultils/format_date.dart';
import 'package:voz_app/views/widgets/comment_widget.dart';

class ThreadDetailWidget extends StatelessWidget {
  final ThreadModel thread;

  const ThreadDetailWidget({super.key, required this.thread});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: thread.comments.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Card(
                  margin: const EdgeInsets.all(0),
                  color: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFFedf2f4),
                          width: 5,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFDCE7F5),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      thread.tag,
                                      style: const TextStyle(
                                        color: Color(0xFF23497C),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                const WidgetSpan(
                                  child: SizedBox(width: 10),
                                ),
                                TextSpan(
                                  text: thread.title,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black87),
                                ),
                              ],
                            ),
                          ),
                          ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            leading: ClipOval(
                              child: Image.network(
                                thread.avatarUrl,
                                width: 40,
                                height: 40,
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text(
                              thread.displayName,
                              style: const TextStyle(
                                color: Color(0xFF23497C),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                  child: const Text(
                                    "Chủ thớt",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            trailing: Text(
                              FormatDate.formatDate(thread.createdAt),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Html(
                            data: thread.content,
                            style: {
                              "p": Style(
                                fontSize: FontSize.large,
                              ),
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return CommentWidget(
                  comment: thread.comments[index - 1],
                  thread: thread,
                );
              }
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: Color(0xFFedf2f4),
                width: 5,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: const Color(0xFFedf2f4),
                  child: GestureDetector(
                    onTap: () {},
                    child: AbsorbPointer(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Nhập bình luận...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.all(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
