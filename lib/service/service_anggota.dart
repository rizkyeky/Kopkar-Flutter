part of 'service.dart';

class UserService {

  final String _homeBase = '185.210.144.158';
  final String _subBase = 'koperasi_api/api/account/getLogin';
  
  final http.Client _client = http.Client();
  
  Future<Anggota> login(String nik, String password) async {
    
    final Uri _uri = Uri.http(_homeBase, _subBase);
    
    final http.Response response = await _client.post(_uri, body: {
      'nik': nik,
      'password': password
    })
      .timeout(const Duration(seconds: 10));

    final Map data = json.decode(response.body) as Map;
    final bool isSuccess = data['status'] == '200';
    final List<Map> result = List<Map>.from(data['data'] as List);

    if (response.statusCode != 200 || !isSuccess) {
      return Anggota.initial();
    } else {
      return Anggota.fromJSON(result as Map<String, dynamic>);
    }
  }
}