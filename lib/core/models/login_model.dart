import 'package:hashpost/core/services/services.dart';
import 'package:hashpost/locator.dart';

import 'base_model.dart';

class LoginModel extends BaseModel {

  final _auth = locator<Auth>();

  Future<bool> loginEmailPassword(String email, String password) async {
    var user = await _auth.emailAndPasswordSignIn(email, password);
    if(user != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> loginGoogleAuth() async {
    var user = await _auth.googleSignIn();
    if(user != null) {
      return true;
    } else {
      return false;
    }
  }
}