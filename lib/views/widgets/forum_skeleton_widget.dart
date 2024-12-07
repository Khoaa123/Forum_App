import 'package:flutter/material.dart';

class ForumSkeletonWidget extends StatelessWidget {
  const ForumSkeletonWidget({super.key});

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
          leading: const Icon(
            Icons.forum,
            color: Colors.blueAccent,
            size: 26.0,
          ),
          title: const Text("Skeleton Forum"),
          subtitle: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Skeleton: ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: "0",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                WidgetSpan(
                  child: SizedBox(width: 10),
                ),
                TextSpan(
                  text: "Skeleton: ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
