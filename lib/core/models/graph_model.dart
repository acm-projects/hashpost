import 'package:hashpost/core/models/base_model.dart';

class GraphModel extends BaseModel {

  void fetchData() async {
    updateState(ViewState.Busy);
    await Future.delayed(Duration(seconds: 4));
    updateState(ViewState.Idle);
  }
}