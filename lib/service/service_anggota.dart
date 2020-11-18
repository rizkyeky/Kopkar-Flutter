part of 'service.dart';

class AnggotaService {

  final String _homeBase = '185.210.144.158';
  final String _subBase = 'koperasi_api/api/account/getLogin';
  
  final http.Client _client = http.Client();
  
  Future<ServiceResult> login(String nik, String password) async {
    

    try {
      final Uri _uri = Uri.http(_homeBase, _subBase);
      
      final http.Response response = await _client.post(_uri, body: {
        'nik': nik,
        'password': password
      })
        .timeout(const Duration(seconds: 20));

      final Map data = json.decode(response.body) as Map;
      final bool isSuccess = data['status'] == '200';

      if (response.statusCode != 200 || !isSuccess) {
        return ServiceResult(massage: 'not success');
      } else {
        final Map result = Map.from(data['data'][0] as Map);
        return ServiceResult(result: Anggota.fromJSON(Map<String, dynamic>.from(result)));
      }
    } catch (e) {
      return ServiceResult(massage: 'not success');
    }
  }
}