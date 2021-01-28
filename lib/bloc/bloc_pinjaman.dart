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
    // return _pinjamanBerjalanService.getPinjamanBerjalan(nik);
    await Future.delayed(const Duration(seconds: 2));
    return [
      PinjamanBerjalan(
        '101010', 
        '10 Desember 2020',
        'Lunas',
        '1',
        '2',
        '3',
        '4',
        '5', 
        '6',
        '7',
        '8',
        '9',
        '11',
        '12 Bulan',
        '2 Bulan',
        'Rp1.200.000',
        'Rp600.000',
      ),
      PinjamanBerjalan(
        '101010', 
        '10 Desember 2020',
        'Lunas',
        '1',
        '2',
        '3',
        '4',
        '5', 
        '6',
        '7',
        '8',
        '9',
        '11',
        '24 Bulan',
        '10 Bulan',
        'Rp10.000.000',
        'Rp3.000.000',
      ),
      PinjamanBerjalan(
        '101010', 
        '10 Desember 2020',
        'Lunas',
        '1',
        '2',
        '3',
        '4',
        '5', 
        '6',
        '7',
        '8',
        '9',
        '11',
        '10 Bulan',
        '1 Bulan',
        'Rp2.000.000',
        'Rp100.000',
      ),
    ];
  } 

  Future<List<PinjamanAjuan>> getPinjamanAjuanFromService(String nik) async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      PinjamanAjuan(
        '101010', 
        '10 Desember 2020',
        'Rp1.200.000',
        'Rp600.000',
        'OPEN',
      ),
      PinjamanAjuan(
        '101010', 
        '10 Desember 2020',
        'Rp1.200.000',
        'Rp600.000',
        'CLOSE',
      ),
      PinjamanAjuan(
        '101010', 
        '10 Desember 2020',
        'Rp1.200.000',
        'Rp600.000',
        'PENDING',
      ),
    ];
  }

  Future<List<Map>> getJenisPinjaman() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      {
        'jenis_pinjaman_name': 'BANK',
      },
      {
        'jenis_pinjaman_name': 'INVESTASI',
      },
      {
        'jenis_pinjaman_name': 'BANK BBRI',
      },
      {
        'jenis_pinjaman_name': 'CICILAN',
      }
    ];
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