import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:voz_app/models/category_model.dart';
import 'package:voz_app/view_models/forum_view_model.dart';
import 'package:voz_app/views/widgets/forum_widget.dart';
import 'package:voz_app/views/widgets/forum_skeleton_widget.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel category;

  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ForumViewModel(category.id),
      child: Consumer<ForumViewModel>(
        builder: (context, forumViewModel, child) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF5C7099),
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
                child: Text(
                  category.name,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              _forumList(forumViewModel),
            ],
          );
        },
      ),
    );
  }

  _forumList(ForumViewModel forumViewModel) {
    if (forumViewModel.isLoading) {
      return const Skeletonizer(
        child: ForumSkeletonWidget(),
      );
    } else if (forumViewModel.error != null) {
      return Center(child: Text('Error: ${forumViewModel.error}'));
    } else {
      return Column(
        children: forumViewModel.forums
            .map((forum) => ForumWidget(forum: forum))
            .toList(),
      );
    }
  }
}
