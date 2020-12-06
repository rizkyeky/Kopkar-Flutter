part of 'service.dart';

class AnggotaService {
  
  final http.Client _client = http.Client();
  final API _api = API();

  Future<ServiceResult> login(String nik, String password) async {
    try {
      final http.Response response = await _client.post(_api.login, body: {
        'nik': nik,
        'password': password
      }).timeout(const Duration(seconds: 20));

      final Map data = json.decode(response.body) as Map;
      final bool isSuccess = data['status'] == '200';

      if (response.statusCode != 200 || !isSuccess) {
        return ServiceResult(massage: 'not success');
      } else {
        final Map result = Map.from(data['data'][0] as Map);
        return ServiceResult(
          value: Anggota.fromJSON(Map<String, dynamic>.from(result)));
      }
    } catch (e) {
      return ServiceResult(massage: 'not success');
    }
  }
}
