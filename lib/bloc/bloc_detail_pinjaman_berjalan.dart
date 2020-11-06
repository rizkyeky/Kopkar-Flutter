part of 'bloc.dart';

class DetailPinjamanBloc implements Bloc {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  final PinjamanService _pinjamanBerjalanService = locator.get<PinjamanService>();

  Future<List<Map>> getTable(String docNo) {
    return _pinjamanBerjalanService.getDetailPinjamanBerjalan(docNo);
  }

}