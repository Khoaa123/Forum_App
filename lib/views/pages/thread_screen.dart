import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voz_app/models/thread_model.dart';
import 'package:voz_app/view_models/thread_detail_view_model.dart';
import 'package:voz_app/views/widgets/thread_detail_widget.dart';

class ThreadScreen extends StatelessWidget {
  final ThreadModel thread;
  const ThreadScreen({super.key, required this.thread});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThreadDetailViewModel(thread.id),
      child: Consumer<ThreadDetailViewModel>(
        builder: (context, threadDetailViewModel, child) {
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
              body: _threadDetail(threadDetailViewModel),
            ),
          );
        },
      ),
    );
  }

  _threadDetail(ThreadDetailViewModel threadDetailViewModel) {
    if (threadDetailViewModel.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (threadDetailViewModel.error != null) {
      return Center(child: Text('Error: ${threadDetailViewModel.error}'));
    } else if (threadDetailViewModel.thread == null) {
      return const Center(child: Text('No thread found.'));
    } else {
      return ThreadDetailWidget(thread: threadDetailViewModel.thread!);
    }
  }
}
