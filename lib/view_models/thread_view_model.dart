import 'package:flutter/material.dart';
import 'package:voz_app/models/thread_model.dart';
import 'package:voz_app/repositories/thread_service.dart';

class ThreadViewModel extends ChangeNotifier {
  List<ThreadModel> _threads = [];
  bool _isLoading = false;
  String? _error;

  List<ThreadModel> get threads => _threads;
  bool get isLoading => _isLoading;
  String? get error => _error;

  final int forumId;

  ThreadViewModel(this.forumId) {
    fetchThreads();
  }

  Future<void> fetchThreads() async {
    _isLoading = true;
    notifyListeners();

    try {
      _threads = await ThreadService.fetchThreads(forumId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
