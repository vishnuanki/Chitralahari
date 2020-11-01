import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FUser {
  FUser({@required this.uid});
  final String uid;
}

abstract class AuthBase {
  Future<FUser> currentUser();
  Future<FUser> signInAnonymously();
  Future<void> signOut();
  Stream<FUser> get onAuthStateChanged;
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  FUser _userFromFirebase(User user) {
    return FUser(uid: user.uid);
  }

@override
  Stream<FUser> get onAuthStateChanged {
    // ignore: deprecated_member_use
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
  }

  @override
  Future<FUser> currentUser() async {
    final user =  _firebaseAuth.currentUser;
    return _userFromFirebase(user);
  }

  @override
  Future<FUser> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
