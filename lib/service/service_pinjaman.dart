part of 'service.dart';

class PinjamanService {
  
  final http.Client _client = http.Client();

  Future<void> getPinjamanBerjalan(String nik) async {
    
    const String _homeBase = '185.210.144.158';
    const String _subBase = 'koperasi_api/Api_v1/getTransPinjamBlm';
    final Uri _uri = Uri.http(_homeBase, _subBase);
    
    final http.Response response = await _client.post(_uri, body: {
      'nik': nik
    })
      .timeout(const Duration(seconds: 10));

    final Map data = json.decode(response.body) as Map;
    final bool isLogin = data['message'] == 'Login Berhasil';

    if (response.statusCode != 200 || !isLogin) {
    } else {
    }
  }

  Future<void> getPinjamanAjuan(String nik) async {
    
    const String _homeBase = '185.210.144.158';
    const String _subBase = 'koperasi_api/Api_v1/getListPengajuanPinjaman';
    final Uri _uri = Uri.http(_homeBase, _subBase);
    
    final http.Response response = await _client.post(_uri, body: {
      'nik': nik
    })
      .timeout(const Duration(seconds: 10));

    final Map data = json.decode(response.body) as Map;
    final bool isLogin = data['message'] == 'Login Berhasil';

    if (response.statusCode != 200 || !isLogin) {
    } else {
    }
  }

  Future<void> getDetailPinjamanBerjalan(String docNo) async {
    const String _homeBase = '185.210.144.158';
    const String _subBase = 'koperasi_api/api_v1/getDetailAngsuranBerjalan';
    final Uri _uri = Uri.http(_homeBase, _subBase);
    
    final http.Response response = await _client.post(_uri, body: {
      'doc_no': docNo
    })
      .timeout(const Duration(seconds: 10));

    final Map data = json.decode(response.body) as Map;
    final bool isLogin = data['message'] == 'Login Berhasil';

    if (response.statusCode != 200 || !isLogin) {
    } else {
    }
  }
}