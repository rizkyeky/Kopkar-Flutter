part of 'bloc.dart';

class PinjamanBloc implements Bloc {
  @override
  void dispose() {
    
  }

  @override
  Future<void> init() async {
    if (jenisPinjaman.isEmpty) {
      jenisPinjaman.addAll(await getJenisPinjaman());
    }
  }

  String nikAnggota;
  String gajiPokok;
  Map<String, String> inputJenisPinjaman;
  String nominalPinjaman;
  String tenor;
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

  Future<List<Map>> getJenisPinjaman() async {
    return _pinjamanBerjalanService.getJenisPinjaman();
  }

}