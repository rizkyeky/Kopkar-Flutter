part of 'bloc.dart';

class HistoryPembelianBloc implements Bloc {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  final HistoryService _historyService = locator.get<HistoryService>();

  Future<List<Map>> getItems() {
    return _historyService.getRiwayat(HistoryType.pembelian, 
      nik: '07380',
      dateAwal: '2020-04-01', 
      dateAkhir: '2020-04-30'
    );
  }
}