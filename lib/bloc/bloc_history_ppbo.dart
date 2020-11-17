part of 'bloc.dart';

class HistoryPPBOBloc implements Bloc {
  @override
  void dispose() {
  }

  @override
  void init() {
  }

  final HistoryService _historyService = locator.get<HistoryService>();

  Future<List<Map>> getList() async {
    return _historyService.getRiwayat(HistoryType.ppbo,
      nik: '07380'
    );
  }

}