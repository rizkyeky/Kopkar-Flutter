part of 'service.dart';

class UserService {

  final String _homeBase = '185.210.144.158';
  final String _subBase = 'koperasi_api/api_v1/get_login';
  
  final http.Client _client = http.Client();
  
  Future<Anggota> getAnggota() async {
    
    final Uri _uri = Uri.http(_homeBase, _subBase);
    
    final http.Response response = await _client.get(_uri)
      .timeout(const Duration(seconds: 10));

    final Map data = json.decode(response.body) as Map;
    final bool isLogin = data['message'] == 'Login Berhasil';

    if (response.statusCode != 200 || !isLogin) {
      return Anggota.initial();
    } else {
      return Anggota.fromJSON(data as Map<String, dynamic>);
    }
  }
}