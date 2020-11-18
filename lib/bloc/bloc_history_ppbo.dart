part of 'bloc.dart';

class HistoryPPBOBloc implements Bloc {
  @override
  void dispose() {
  }

  @override
  void init() {
  }

  final HistoryService _historyService = locator.get<HistoryService>();
  final Anggota anggota = locator.get<Anggota>(instanceName: 'Anggota Active');

  Future<List<Map>> getList() async {
    return _historyService.getRiwayat(HistoryType.ppbo,
      nik: anggota.nikKar
    );
  }

}