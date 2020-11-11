part of 'service.dart';

class HistoryService {

  final http.Client _client = http.Client();

  Future<List<Map>> getPpobTrans(String nik) async {
    
    const String _homeBase = '185.210.144.158';
    const String _subBase = 'koperasi_api/api_v1/getPpobTrans';
    final Uri _uri = Uri.http(_homeBase, _subBase);
    
    final http.Response response = await _client.post(_uri, body: {
      'nik_kar': nik
    })
      .timeout(const Duration(seconds: 10));

    final Map data = json.decode(response.body) as Map;
    final bool getData = data['status'] == '400';

    if (response.statusCode != 200 || getData) {
      return [{}];
    } else {
      final List<Map> result = (data['result'] as List)
        .map((e) => Map.from(e as Map)).toList();
      return result;
    }
  }
}