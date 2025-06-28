import 'package:flutter/material.dart';
import 'package:duolingo/data/models/user.dart';
import 'package:duolingo/services/firebase_service.dart';
import 'package:duolingo/services/api_response.dart';

class AuthProvider extends ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;
  String? _error;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _currentUser != null;

  final FirebaseService _firebaseService = FirebaseService();

  Future<void> loginWithGoogle() async {
    _setLoading(true);
    _clearError();

    try {
      final ApiResponse<void> response = await _firebaseService.loginGoogle();
      
      if (response.ok) {
        _currentUser = await User.get();
        notifyListeners();
      } else {
        _setError(response.message);
      }
    } catch (e) {
      _setError('An unexpected error occurred');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> logout() async {
    _setLoading(true);
    
    try {
      await _firebaseService.logout();
      _currentUser = null;
      User.clear();
      notifyListeners();
    } catch (e) {
      _setError('Logout failed');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> checkAuthStatus() async {
    _currentUser = await User.get();
    notifyListeners();
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
