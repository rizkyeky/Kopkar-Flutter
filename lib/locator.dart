import 'package:get_it/get_it.dart';

import 'bloc/bloc.dart';
// import 'model/model.dart';
import 'service/service.dart';

GetIt locator = GetIt.instance;

Future<void> setLocator() async {

  locator.registerLazySingleton(() => PinjamanService());
  locator.registerLazySingleton(() => ConnectionService.getInstance());
  // locator.registerLazySingleton(() => GraphService());
  
  locator.registerFactory(() => HomeBloc());
  locator.registerFactory(() => ProfileBloc());
  locator.registerFactory(() => LoginBloc());
  locator.registerFactory(() => PinjamanBloc());
  locator.registerFactory(() => SimpananBloc());
  locator.registerFactory(() => HistoryBloc());
  locator.registerFactory(() => HistoryOptionBloc());
  locator.registerFactory(() => DetailPinjamanBloc());
  
  await locator.allReady();
  // await locator.get<GraphService>().init();
}