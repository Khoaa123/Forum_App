import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:voz_app/models/thread_model.dart';
import 'package:voz_app/ultils/format_date.dart';
import 'package:voz_app/ultils/route_transition.dart';
import 'package:voz_app/views/pages/thread_screen.dart';

class ThreadWidget extends StatelessWidget {
  final ThreadModel thread;
  const ThreadWidget({super.key, required this.thread});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFD3D5D7),
            width: 0.5,
          ),
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        margin: const EdgeInsets.all(0),
        elevation: 0,
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(
              RouteTransition.customRoute(
                ThreadScreen(thread: thread),
              ),
            );
          },
          isThreeLine: true,
          trailing: thread.isSticky
              ? const Icon(
                  Icons.bookmark,
                  color: Colors.black,
                  size: 20.0,
                )
              : null,
          contentPadding: const EdgeInsets.only(left: 15, right: 15),
          leading: ClipOval(
            child: Image.network(
              thread.avatarUrl,
              width: 40,
              height: 40,
              fit: BoxFit.fill,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Skeletonizer(
                    child: Container(
                      width: 40,
                      height: 40,
                      color: Colors.grey,
                    ),
                  );
                }
              },
            ),
          ),
          title: Text(
            thread.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF23497C),
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: thread.displayName,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: ' • ${FormatDate.formatDate(thread.createdAt)}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    const Icon(
                      Icons.comment,
                      color: Colors.black,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      thread.totalComments.toString(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                    Text(
                      thread.viewCount.toString(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
