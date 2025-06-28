import 'package:flutter/material.dart';

class LessonProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;
  List<dynamic> _lessons = [];
  int _currentLessonIndex = 0;

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<dynamic> get lessons => _lessons;
  int get currentLessonIndex => _currentLessonIndex;

  Future<void> loadLessons() async {
    _setLoading(true);
    _clearError();

    try {
      // TODO: Implement lesson loading from API/database
      await Future.delayed(Duration(seconds: 1)); // Simulate API call
      
      // Mock data for now
      _lessons = [
        {'id': 1, 'title': 'Introdução', 'completed': true, 'xp': 10},
        {'id': 2, 'title': 'Saudações', 'completed': false, 'xp': 15},
        {'id': 3, 'title': 'Viagem', 'completed': false, 'xp': 20},
        {'id': 4, 'title': 'Cafeteria', 'completed': false, 'xp': 25},
        {'id': 5, 'title': 'Famílias', 'completed': false, 'xp': 30},
      ];
      
      notifyListeners();
    } catch (e) {
      _setError('Failed to load lessons');
    } finally {
      _setLoading(false);
    }
  }

  void setCurrentLesson(int index) {
    if (index >= 0 && index < _lessons.length) {
      _currentLessonIndex = index;
      notifyListeners();
    }
  }

  Future<void> completeLesson(int lessonId) async {
    try {
      // TODO: Implement lesson completion logic
      final lessonIndex = _lessons.indexWhere((lesson) => lesson['id'] == lessonId);
      if (lessonIndex != -1) {
        _lessons[lessonIndex]['completed'] = true;
        notifyListeners();
      }
    } catch (e) {
      _setError('Failed to complete lesson');
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    notifyListeners();
  }

  void _clearError() {
    _error = null;
    notifyListeners();
  }
}
