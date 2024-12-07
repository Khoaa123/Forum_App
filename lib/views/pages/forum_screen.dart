import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voz_app/models/forum_model.dart';
import 'package:voz_app/view_models/thread_view_model.dart';
import 'package:voz_app/views/widgets/thread_widget.dart';

class ForumScreen extends StatelessWidget {
  final ForumModel forum;
  const ForumScreen({super.key, required this.forum});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThreadViewModel(forum.id),
      child: Consumer<ThreadViewModel>(
        builder: (context, threadViewModel, child) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  "ForumScreen",
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.white,
                iconTheme: const IconThemeData(color: Colors.black),
              ),
              body: _threadList(threadViewModel),
            ),
          );
        },
      ),
    );
  }

  _threadList(ThreadViewModel threadViewModel) {
    if (threadViewModel.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (threadViewModel.error != null) {
      return Center(child: Text('Error: ${threadViewModel.error}'));
    } else {
      return ListView.builder(
        itemCount: threadViewModel.threads.length,
        itemBuilder: (context, index) {
          return ThreadWidget(thread: threadViewModel.threads[index]);
        },
      );
    }
  }
}
