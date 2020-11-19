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
  final ValueNotifier<bool> awaitNotifier = ValueNotifier(false);

  Future<List<PinjamanBerjalan>> getPinjamanBerjalanFromService(String nik) async {
    return _pinjamanBerjalanService.getPinjamanBerjalan(nik);
  } 

  Future<List<PinjamanAjuan>> getPinjamanAjuanFromService(String nik) async {
    return _pinjamanBerjalanService.getPinjamanAjuan(nik);
  }

  Future<List<Map>> getJenisPinjaman() async {
    return _pinjamanBerjalanService.getJenisPinjaman();
  }

  Future<List<Map>> getTable(String docNo) {
    return _pinjamanBerjalanService.getDetailPinjamanBerjalan(docNo);
  }

  Future<bool> setPinjaman() async {
    awaitNotifier.value = true;
    bool isSuccess = false;
    await _pinjamanBerjalanService.simpanPinjaman(
      inputFotoKTP,
      inputFotoSlipGaji,
      inputFotoNPWP, 
      inputJenisPinjaman['jenis_pinjaman_code'], inputTotalPinjaman, inputLamaPinjaman)
    .then((value) {
      isSuccess = value;
      awaitNotifier.value = false;
    })
    .timeout(const Duration(seconds: 10));
    return isSuccess;
  }

}