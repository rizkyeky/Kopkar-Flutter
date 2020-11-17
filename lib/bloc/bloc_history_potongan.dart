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

  DateTime inputAwalDate;
  DateTime inputAkhirDate;

  final HistoryService _historyService = locator.get<HistoryService>();

  Future<List<Map>> getList() async {
    return _historyService.getRiwayat(HistoryType.potongan, 
      nik:'01739', 
      dateAwal: inputAwalDate != null ? inputAwalDate.toLocal().toString().split(' ')[0] : '' , 
      dateAkhir: inputAkhirDate != null ? inputAkhirDate.toLocal().toString().split(' ')[0] : ''
    );
  }

  Future<List<Map>> getTable(String doc) {
    return _historyService.getRiwayat(HistoryType.potongan,
      isDetail: true,
      doc: doc,
      nik: '01739'
    );
  }
}