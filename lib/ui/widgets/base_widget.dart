import 'package:flutter/material.dart';
import 'package:hashpost/core/models/base_model.dart';
import 'package:hashpost/locator.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends BaseModel> extends StatefulWidget {

  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;

  const BaseWidget({
    this.builder,
    this.onModelReady
  });

  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends BaseModel> extends State<BaseWidget<T>> {

  T model = locator<T>();

  @override
  void initState() {
    super.initState();

    if(widget.onModelReady != null) {
      widget.onModelReady(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      builder: (context) => model,
      child: Consumer<T>(
          builder: widget.builder,
      ),
    );
  }
}