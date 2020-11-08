part of 'bloc.dart';

class PinjamanBloc implements Bloc {
  @override
  void dispose() {
    
  }

  @override
  void init() {
    
  }

  String nikAnggota;
  String gajiPokok;
  String jenis;
  String jenisPinjaman;
  String nominalPinjaman;
  String tenor;
  String keperluan;

  final PinjamanService _pinjamanBerjalanService = locator.get<PinjamanService>();

  Future<List<PinjamanBerjalan>> getPinjamanBerjalanFromService(String nik) async {
    return _pinjamanBerjalanService.getPinjamanBerjalan(nik);
  } 

  Future<List<PinjamanAjuan>> getPinjamanAjuanFromService(String nik) async {
    return _pinjamanBerjalanService.getPinjamanAjuan(nik);
  } 

  
}