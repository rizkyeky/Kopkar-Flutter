part of 'bloc.dart';

class HistoryOptionBloc implements Bloc {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  final HistoryService _historyService = locator.get<HistoryService>();

  Future<List<Map>> getPPBOList() async {
    return _historyService.getPpobTrans('07380');
  } 

}