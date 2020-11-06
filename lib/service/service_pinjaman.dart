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
    final List<Map> result = (data['result'] as List)
      .map((e) => Map.from(e as Map)).toList();

    if (response.statusCode != 200) {
      return [];
    } else {
      return result;
    }
  }

  Future<List<Map>> getDetailPinjamanAngsuran(String docNo) async {
    const String _homeBase = '185.210.144.158';
    const String _subBase = 'koperasi_api/api_v1/getDetailAngsuranBerjalan';
    final Uri _uri = Uri.http(_homeBase, _subBase);
    
    final http.Response response = await _client.post(_uri, body: {
      'doc_no': docNo
    })
      .timeout(const Duration(seconds: 10));

    final Map data = json.decode(response.body) as Map;
    final List<Map> result = (data['result'] as List)
      .map((e) => Map.from(e as Map)).toList();

    if (response.statusCode != 200) {
      return [];
    } else {
      return result;
    }
  }
}