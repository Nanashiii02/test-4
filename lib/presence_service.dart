import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class PresenceService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  void initialize() {
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        _setUserStatus(user.uid, 'online');
        _database.ref('presence/${user.uid}').onDisconnect().set({
          'status': 'offline',
          'lastSeen': ServerValue.timestamp,
        });
      } else {
        // Handle user sign-out case if needed
      }
    });
  }

  void _setUserStatus(String uid, String status) {
    final ref = _database.ref('presence/$uid');
    ref.set({
      'status': status,
      'lastSeen': ServerValue.timestamp,
    });
  }

  void goOffline() {
    final user = _auth.currentUser;
    if (user != null) {
      _setUserStatus(user.uid, 'offline');
    }
  }

  void goOnline() {
    final user = _auth.currentUser;
    if (user != null) {
      _setUserStatus(user.uid, 'online');
    }
  }
}
