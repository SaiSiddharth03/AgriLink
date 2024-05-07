import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseUserProvider extends ChangeNotifier {
  User? user; // Initialize as nullable

  FirebaseUserProvider() {
    _getUser();
  }

  Future<void> _getUser() async {
    try {
      // Fetch the current user
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        this.user = currentUser;
        print('User active: ${user!.uid}');
      } else {
        print('No user logged in.');
      }
    } catch (error) {
      print('Error fetching user: $error');
    }
    notifyListeners();
  }
}
