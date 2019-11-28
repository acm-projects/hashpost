import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hashpost/ui/screens/screens.dart';

class FluroRouter {
  static Router router = Router();

  static Handler _homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return HomeScreen();
    }
  );

  static Handler _loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return LoginScreen();
    }
  );

  static Handler _settingsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return SettingsScreen();
    }
  );

  static Handler _editingHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return EditingScreen();
    }
  );

  static void setupRouter() {
    router.define('/', handler: _homeHandler, transitionType: TransitionType.fadeIn);
    router.define('/login', handler: _loginHandler, transitionType: TransitionType.fadeIn);
    router.define('/settings', handler: _settingsHandler, transitionType: TransitionType.fadeIn);
    router.define('/editing', handler: _editingHandler, transitionType: TransitionType.fadeIn);
  }
}