part of 'service.dart';

class PinjamanService {
  
  final http.Client _client = http.Client();

  Future<List<PinjamanBerjalan>> getPinjamanBerjalan(String nik) async {
    
    const String _homeBase = '185.210.144.158';
    const String _subBase = 'koperasi_api/Api_v1/getTransPinjamBlm';
    final Uri _uri = Uri.http(_homeBase, _subBase);
    
    final http.Response response = await _client.post(_uri, body: {
      'nik': nik
    })
      .timeout(const Duration(seconds: 10));

    final Map data = json.decode(response.body) as Map;
    final List result = data['result'] as List;

    final bool isLogin = data['status'] == '200';

    if (response.statusCode != 200 || !isLogin) {
      return [];
    } else {
      return List.generate(result.length, (index) => 
        PinjamanBerjalan.fromJSON(result[index] as Map<String, dynamic>));
    }
  }

  Future<List<PinjamanAjuan>> getPinjamanAjuan(String nik) async {
    
    const String _homeBase = '185.210.144.158';
    const String _subBase = 'koperasi_api/Api_v1/getListPengajuanPinjaman';
    final Uri _uri = Uri.http(_homeBase, _subBase);
    
    final http.Response response = await _client.post(_uri, body: {
      'nik': nik
    })
      .timeout(const Duration(seconds: 10));

    final Map data = json.decode(response.body) as Map;
    final List result = data['result'] as List;

    final bool isLogin = data['status'] == '200';

    if (response.statusCode != 200 || !isLogin) {
      return [];

    } else {
      return List.generate(result.length, (index) => 
        PinjamanAjuan.fromJSON(result[index] as Map<String, dynamic>));
    }
  }

  Future<List<Map>> getDetailPinjamanBerjalan(String docNo) async {
    const String _homeBase = '185.210.144.158';
    const String _subBase = 'koperasi_api/api_v1/getDetailAngsuranBerjalan';
    final Uri _uri = Uri.http(_homeBase, _subBase);
    
    final http.Response response = await _client.post(_uri, body: {
      'doc_no': docNo
    })
      .timeout(const Duration(seconds: 10));

    final Map data = json.decode(response.body) as Map;
    final bool getError = data['status'] == '400';

    if (response.statusCode != 200 || getError) {
      return [{}];
    } else {
      final List<Map> result = (data['result'] as List)
        .map((e) => Map.from(e as Map)).toList();
      return result;
    }
  }

  Future<List<Map>> getJenisPinjaman() async {
    const String _homeBase = '185.210.144.158';
    const String _subBase = 'koperasi_api/api_v1/getJenisPinjaman';
    final Uri _uri = Uri.http(_homeBase, _subBase);
    
    final http.Response response = await _client.get(_uri)
      .timeout(const Duration(seconds: 10));

    final Map data = json.decode(response.body) as Map;
    final bool getStatus = data['status'] == '200';

    if (response.statusCode != 200 || !getStatus) {
      return [];
    } else {
      final List<Map> result = (data['result'] as List)
        .map((e) => Map.from(e as Map)).toList();
      return result;
    }
  }

  Future<Map> getSimulation(int total, int lama) async {
    const String _homeBase = '185.210.144.158';
    const String _subBase = 'koperasi_api/api_v1/simulasiPinjaman';
    final Uri _uri = Uri.http(_homeBase, _subBase);
    
    final http.Response response = await _client.post(_uri, body: {
      'total_pinjaman': total.toString(), 
      'lama_angsuran': lama.toString(),
    })
      .timeout(const Duration(seconds: 20));

    // print(response.body);

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

  Future<void> uploadFoto(
    File file, 
    String jenisPinjaman, 
    String totalPinjaman, 
    String lamaPinjaman
  ) async {

    const String _homeBase = '185.210.144.158';
    const String _subBase = 'koperasi_api/api_v1/simulasiPinjaman';
    final Uri _uri = Uri.http(_homeBase, _subBase);

    final request = http.MultipartRequest('POST', _uri);
    request.files.add(
      http.MultipartFile(
        'foto_ktp',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: 'ktp',
        contentType: MediaType('image','jpg'),
      ),
    );

    request.fields.addAll({
      'jenis_pinjaman': jenisPinjaman,
      'total_pinjaman': totalPinjaman,
      'lama_pinjaman': lamaPinjaman,
      // 'foto_ktp': , 
      // 'foto_slip_gaji': , 
      // 'foto_npwp': ,
      'doc_remarks': '', 
      'nik_kar': '07380',
    }); 
    
    final http.StreamedResponse response = await request.send();
    print(response.reasonPhrase);
  }
}