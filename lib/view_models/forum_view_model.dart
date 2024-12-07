import 'package:flutter/material.dart';
import 'package:voz_app/models/forum_model.dart';
import 'package:voz_app/repositories/forum_service.dart';

class ForumViewModel extends ChangeNotifier {
  List<ForumModel> _forums = [];
  bool _isLoading = false;
  String? _error;

  List<ForumModel> get forums => _forums;
  bool get isLoading => _isLoading;
  String? get error => _error;

  final int categoryId;

  ForumViewModel(this.categoryId) {
    fetchForums();
  }

  Future<void> fetchForums() async {
    _isLoading = true;
    notifyListeners();

    try {
      _forums = await ForumService.fetchForums(categoryId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
