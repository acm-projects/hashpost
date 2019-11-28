import 'package:get_it/get_it.dart';
import 'package:hashpost/core/models/editing_model.dart';
import 'package:hashpost/core/models/graph_model.dart';
import 'package:hashpost/ui/theme/theme_data.dart';
import 'core/models/login_model.dart';
import 'core/services/services.dart';
import 'core/models/home_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  
  // these are global singletons
  locator.registerLazySingleton(() => Auth());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => HashPostTheme());

  // factories - they generate a new model per view.
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => EditingModel());
  locator.registerFactory(() => GraphModel());
}