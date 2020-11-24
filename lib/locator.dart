import 'package:get_it/get_it.dart';

import 'bloc/bloc.dart';
import 'model/model.dart';
import 'service/service.dart';

GetIt locator = GetIt.instance;

enum HistoryType {pembelian, simpananwajib, simpanansuk, ppbo, potongan, pinjaman}

Future<void> setLocator() async {

  locator.registerLazySingleton(() => ConnectionService());
  locator.registerLazySingleton(() => PinjamanService());
  locator.registerLazySingleton(() => HistoryService());
  locator.registerLazySingleton(() => AnggotaService());
  locator.registerLazySingleton(() => LocalService());
  
  locator.registerFactory(() => ProfileBloc());
  locator.registerFactory(() => LoginBloc());
  locator.registerFactory(() => PinjamanBloc());
  locator.registerFactory(() => SimpananBloc());
  
  locator.registerFactory(() => HistorySimpananBloc());
  locator.registerFactory(() => HistoryPembelianBloc());
  locator.registerFactory(() => HistoryPPBOBloc());
  locator.registerFactory(() => HistoryPotoganBloc());
  locator.registerFactory(() => SimulationBloc());
  
  await locator.get<ConnectionService>().init();
  await locator.get<LocalService>().init();
}