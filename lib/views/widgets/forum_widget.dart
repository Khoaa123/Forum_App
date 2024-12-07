import 'package:flutter/material.dart';
import 'package:voz_app/models/forum_model.dart';
import 'package:voz_app/ultils/format_date.dart';
import 'package:voz_app/ultils/route_transition.dart';
import 'package:voz_app/views/pages/forum_screen.dart';

class ForumWidget extends StatelessWidget {
  final ForumModel forum;

  const ForumWidget({super.key, required this.forum});

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
                ForumScreen(forum: forum),
              ),
            );
          },
          leading: const Icon(
            Icons.forum,
            color: Colors.blueAccent,
            size: 26.0,
          ),
          title: Text(
            forum.name,
            style: const TextStyle(color: Colors.blueAccent),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Threads: ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: forum.threadCount.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    const WidgetSpan(
                      child: SizedBox(width: 10),
                    ),
                    const TextSpan(
                      text: "Messages: ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: forum.totalComments.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              if (forum.latestThread != null)
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    forum.latestThread!.title,
                    style: const TextStyle(
                      color: Color(0xFF23497b),
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              if (forum.latestThread != null)
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: FormatDate.formatDate(
                              forum.latestThread!.createdAt),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        const WidgetSpan(
                          child: SizedBox(width: 10),
                        ),
                        TextSpan(
                          text: forum.latestThread!.displayName,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
