import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

enum ViewState {
  Idle,
  Busy,
  NoConnection,
}

class BaseModel extends ChangeNotifier {
  ViewState _state;
  ViewState get state => _state;

  

  void updateState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }

    Future<String> getUserToken(FirebaseUser user) async {
    IdTokenResult token = await user.getIdToken();
    print(token.token);
    return token.token;
  }
}