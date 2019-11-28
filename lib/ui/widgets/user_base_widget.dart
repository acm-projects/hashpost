import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hashpost/core/models/base_model.dart';
import 'package:hashpost/core/services/services.dart';
import 'package:hashpost/locator.dart';
import 'package:provider/provider.dart';

class UserBaseWidget<T extends BaseModel> extends StatefulWidget {

  final Widget Function(BuildContext context, T model, FirebaseUser user, Widget child) builder;
  final Function(T) onModelReady;

  const UserBaseWidget({
    this.builder,
    this.onModelReady
  });

  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends BaseModel> extends State<UserBaseWidget<T>> {

  T model = locator<T>();

  @override
  void initState() {
    super.initState();

    if(widget.onModelReady != null) {
      widget.onModelReady(model);
    }
  }

  // ! CHANGED CONSUMER TO CONSUMER2 FOR FIREBASEUSER
  // consider making a separate base widget that doesnt 
  // have firebaseuser, like the original one
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      builder: (context) => model,
      child: Consumer2<T, FirebaseUser>(
          builder: widget.builder,
      ),
    );
  }
}