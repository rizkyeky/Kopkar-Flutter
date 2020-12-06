part of 'service.dart';

class PinjamanService {
  final http.Client _client = http.Client();
  final API _api = API();

  Future<List<PinjamanBerjalan>> getPinjamanBerjalan(String nik) async {

    final http.Response response = await _client
      .post(_api.pinjamanBerjalan, body: {'nik': nik})
      .timeout(const Duration(seconds: 10));

    final Map data = json.decode(response.body) as Map;
    final List result = data['result'] as List;

    final bool isLogin = data['status'] == '200';

    if (response.statusCode != 200 || !isLogin) {
      return [];
    } else {
      return List.generate(
        result.length,
        (index) =>
          PinjamanBerjalan.fromJSON(result[index] as Map<String, dynamic>));
    }
  }

  Future<List<PinjamanAjuan>> getPinjamanAjuan(String nik) async {
    
    final http.Response response = await _client
        .post(_api.listPengajuanPinjaman, body: {'nik': nik})
        .timeout(const Duration(seconds: 10));

    final Map data = json.decode(response.body) as Map;
    final List result = data['result'] as List;

    final bool isLogin = data['status'] == '200';

    if (response.statusCode != 200 || !isLogin) {
      return [];
    } else {
      return List.generate(
        result.length,
        (index) =>
          PinjamanAjuan.fromJSON(result[index] as Map<String, dynamic>));
    }
  }

  Future<List<Map>> getDetailPinjamanBerjalan(String docNo) async {

    final http.Response response = await _client.post(_api.detailAngsuranBerjalan,
        body: {'doc_no': docNo}).timeout(const Duration(seconds: 10));

    final Map data = json.decode(response.body) as Map;
    final bool getError = data['status'] == '400';

    if (response.statusCode != 200 || getError) {
      return [{}];
    } else {
      final List<Map> result =
        (data['result'] as List).map((e) => Map.from(e as Map)).toList();
      return result;
    }
  }

  Future<List<Map>> getJenisPinjaman() async {

    final http.Response response = await _client.get(_api.jenisPinjaman)
      .timeout(const Duration(seconds: 10));

    final Map data = json.decode(response.body) as Map;
    final bool getStatus = data['status'] == '200';

    if (response.statusCode != 200 || !getStatus) {
      return [];
    } else {
      final List<Map> result =
        (data['result'] as List).map((e) => Map.from(e as Map)).toList();
      return result;
    }
  }

  Future<Map> getSimulation(int total, int lama) async {
   
    final http.Response response = await _client.post(_api.simulasiPinjaman, body: {
      'total_pinjaman': total.toString(),
      'lama_angsuran': lama.toString(),
    }).timeout(const Duration(seconds: 20));

    final Map data = json.decode(response.body) as Map;
    final bool getStatus = data['status'] == '200';

    if (response.statusCode != 200 || !getStatus) {
      return {};
    } else {
      data.remove('status');
      data.remove('desc');
      return data;
    }
  }

  Future<bool> simpanPinjaman(File fotoKTP, File fotoSlipGaji, File fotoNPWP,
      String jenisPinjaman, String totalPinjaman, String lamaPinjaman) async {
        
    final request = http.MultipartRequest('POST', _api.pengajuanPinjaman);
    
    request.files.add(
      http.MultipartFile(
        'foto_ktp',
        fotoKTP.readAsBytes().asStream(),
        fotoKTP.lengthSync(),
        filename: 'ktp',
        contentType: MediaType('image', 'jpg'),
      ),
    );

    request.files.add(
      http.MultipartFile(
        'foto_slip_gaji',
        fotoSlipGaji.readAsBytes().asStream(),
        fotoSlipGaji.lengthSync(),
        filename: 'foto_slip_gaji',
        contentType: MediaType('image', 'jpg'),
      ),
    );

    request.files.add(
      http.MultipartFile(
        'foto_npwp',
        fotoNPWP.readAsBytes().asStream(),
        fotoNPWP.lengthSync(),
        filename: 'foto_npwp',
        contentType: MediaType('image', 'jpg'),
      ),
    );

    final Anggota anggota =
        locator.get<Anggota>(instanceName: 'Anggota Active');

    request.fields.addAll({
      'jenis_pinjaman': jenisPinjaman,
      'total_pinjaman': totalPinjaman,
      'lama_pinjaman': lamaPinjaman,
      'doc_remarks': '',
      'nik_kar': anggota.nikKar,
    });

    final http.StreamedResponse response = await request.send();
    return response.statusCode == 200;
  }
}
