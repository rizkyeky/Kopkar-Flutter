import 'package:get_it/get_it.dart';

import 'bloc/bloc.dart';
// import 'model/model.dart';
import 'service/service.dart';

GetIt locator = GetIt.instance;

enum HistoryType {pembelian, simpananwajib, simpanansuk, ppbo, potongan, pinjaman}

Future<void> setLocator() async {

  locator.registerLazySingleton(() => ConnectionService.getInstance());
  locator.registerLazySingleton(() => PinjamanService());
  locator.registerLazySingleton(() => HistoryService());
  
  locator.registerFactory(() => ProfileBloc());
  locator.registerFactory(() => LoginBloc());
  locator.registerFactory(() => PinjamanBloc());
  locator.registerFactory(() => SimpananBloc());
  
  locator.registerFactory(() => HistorySimpananBloc());
  locator.registerFactory(() => HistoryPembelianBloc());
  locator.registerFactory(() => HistoryPPBOBloc());
  locator.registerFactory(() => HistoryPotoganBloc());
  
  await locator.allReady();
  // await locator.get<GraphService>().init();
}