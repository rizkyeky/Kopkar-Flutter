part of 'bloc.dart';

class HistorySimpananBloc implements Bloc {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  final HistoryService _historyService = locator.get<HistoryService>();
  
  DateTime inputAwalDate;
  DateTime inputAkhirDate;

  Future<List<Map>> getListW() async {
    return _historyService.getRiwayat(HistoryType.simpananwajib, 
      nik:'01739', 
      dateAwal: inputAwalDate != null ? inputAwalDate.toLocal().toString().split(' ')[0] : '' , 
      dateAkhir: inputAkhirDate != null ? inputAkhirDate.toLocal().toString().split(' ')[0] : ''
    );
  }

  Future<List<Map>> getListS() async {
    return _historyService.getRiwayat(HistoryType.simpanansuk, 
      nik:'01739', 
      dateAwal: inputAwalDate != null ? inputAwalDate.toLocal().toString().split(' ')[0] : '' , 
      dateAkhir: inputAkhirDate != null ? inputAkhirDate.toLocal().toString().split(' ')[0] : ''
    );
  }

}