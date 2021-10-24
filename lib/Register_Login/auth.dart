import 'package:firebase_auth/firebase_auth.dart';
import 'package:ParkingApp/Register_Login/models/AppUserInfo.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebaseuser
  AppUserInfo? _userFromFirebaseUser(User user)
  {
    return user != null ? AppUserInfo(uid: user.uid) : null;
  }

  //Sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
