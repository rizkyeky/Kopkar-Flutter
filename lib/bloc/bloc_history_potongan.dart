part of 'bloc.dart';

class HistoryPotoganBloc implements Bloc {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  final HistoryService _historyService = locator.get<HistoryService>();

  Future<List<Map>> getList() async {
    return _historyService.getRiwayat(HistoryType.potongan, 
      nik:' 01739', dateAwal: '2020-01-01', dateAkhir: '2020-07-30');
  }
}