import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hashpost/locator.dart';
import 'package:hashpost/ui/router.dart';
import 'package:hashpost/ui/screens/screens.dart';
import 'package:hashpost/ui/theme/theme_data.dart';
import 'package:provider/provider.dart';
import 'core/services/services.dart';

void main() {
  setupLocator();
  FluroRouter.setupRouter();
  runApp(HashPost());
}

class HashPost extends StatelessWidget {
  const HashPost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(value: locator<Auth>().user),
        StreamProvider<ThemeData>.value(value: locator<HashPostTheme>().theme)
      ],
      child: Consumer<ThemeData>(
        builder: (context, theme, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          // theme manager
          theme: theme != null ? theme : HashPostTheme.darkTheme,
          // routes
          onGenerateRoute: FluroRouter.router.generator,
          initialRoute: '/',
        ),
      ),
    );
  }
}

