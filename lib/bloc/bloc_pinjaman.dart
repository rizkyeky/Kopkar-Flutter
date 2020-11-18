part of 'bloc.dart';

class PinjamanBloc implements Bloc {
  @override
  void dispose() {
  }

  @override
  void init() {
  }

  Map<String, String> inputJenisPinjaman;
  String inputTotalPinjaman;
  String inputLamaPinjaman;
  String keperluan;

  File inputFotoKTP;
  File inputFotoSlipGaji;
  File inputFotoNPWP;

  List<Map> jenisPinjaman = [];

  final PinjamanService _pinjamanBerjalanService = locator.get<PinjamanService>();

  Future<List<PinjamanBerjalan>> getPinjamanBerjalanFromService(String nik) async {
    return _pinjamanBerjalanService.getPinjamanBerjalan(nik);
  } 

  Future<List<PinjamanAjuan>> getPinjamanAjuanFromService(String nik) async {
    return _pinjamanBerjalanService.getPinjamanAjuan(nik);
  }

  Future<void> getJenisPinjaman() async {
    if (jenisPinjaman.isEmpty) {
      jenisPinjaman.addAll(await _pinjamanBerjalanService.getJenisPinjaman());
    }
  }

  Future<List<Map>> getTable(String docNo) {
    return _pinjamanBerjalanService.getDetailPinjamanBerjalan(docNo);
  }

}