part of 'bloc.dart';

class HistoryPPBOBloc implements Bloc {
  @override
  void dispose() {
  }

  @override
  void init() {
  }

  final HistoryService _historyService = locator.get<HistoryService>();

  Future<List<Map>> getPPBOList() async {
    return _historyService.getRiwayatPPBO('07380');
  }

}