import 'package:get_it/get_it.dart';

import 'bloc/bloc.dart';
import 'model/model.dart';
import 'service/service.dart';

GetIt locator = GetIt.instance;

Future<void> setLocator() async {

  locator.registerLazySingleton(() => PinjamanService());
  // locator.registerLazySingleton(() => DummyService());
  // locator.registerLazySingleton(() => GraphService());
  
  locator.registerFactory(() => HomeBloc());
  locator.registerFactory(() => ProfileBloc());
  locator.registerFactory(() => LoginBloc());
  locator.registerFactory(() => PinjamanBloc());
  locator.registerFactory(() => SimpananBloc());
  locator.registerFactory(() => HistoryBloc());
  locator.registerFactory(() => HistoryOptionBloc());
  
  await locator.allReady();
  // await locator.get<QuoteService>().init();
  // await locator.get<GraphService>().init();
}