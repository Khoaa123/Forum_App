import 'package:flutter/material.dart';
import 'package:voz_app/models/thread_model.dart';
import 'package:voz_app/repositories/thread_service.dart';

class ThreadDetailViewModel extends ChangeNotifier {
  ThreadModel? _thread;
  bool _isLoading = false;
  String? _error;

  ThreadModel? get thread => _thread;
  bool get isLoading => _isLoading;
  String? get error => _error;

  final int threadId;

  ThreadDetailViewModel(this.threadId) {
    fetchDetailThread();
  }

  Future<void> fetchDetailThread() async {
    _isLoading = true;
    notifyListeners();

    try {
      _thread = await ThreadService.fetchDetailThread(threadId);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
