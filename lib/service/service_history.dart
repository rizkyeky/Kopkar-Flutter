part of 'service.dart';

class HistoryService {

  final http.Client _client = http.Client();
  final String _homeBase = '185.210.144.158';
  final String _subBase = 'koperasi_api/api_v1/';
  final Map<HistoryType, Map<String, String>> _typeBases = {
    HistoryType.pembelian: {
      'base': 'getPosTransDate',
      'detail': 'getPosTransDtl',
    },
    HistoryType.pinjaman: {
      'base': 'getTransPinjamBlm',
      'detail': 'getDetailAngsuranBerjalan',
    },
    HistoryType.ppbo: {
      'base': 'getPpobTrans',
    },
    HistoryType.potongan: {
      'baseYear': 'getPotonganYearHead',
      'baseDate': 'getPotonganDateHead',
      'detail': 'getPotonganDetail'
    },
    HistoryType.simpananwajib: {
      'baseYear': 'getTransSimpanWajibByYear',
      'baseDate': 'getTransSimpanWajib',
    },
    HistoryType.simpanansuk: {
      'baseYear': 'getTransSimpanSukarelaByYear',
      'baseDate': 'getTransSimpanSukarela',
    },
  };

  Future<List<Map>> getRiwayat(HistoryType type, {
    bool isDetail = false, 
    String nik, String doc, String dateAwal, String dateAkhir
  }) async {
    
    String baseName = !isDetail ? 'base' : 'detail';

    Map<String, String> bodyPost;
    switch (type) {
      case HistoryType.pembelian:
        bodyPost = !isDetail ? {
          'nik_kar': nik,
          'dateAwal': dateAwal,
          'dateAkhir': dateAkhir
        } : {
          'doc_no': doc
        };
        break;
      case HistoryType.pinjaman:
        bodyPost = !isDetail ? {
          'nik': nik,
        } : {
          'doc_no': doc
        };
        break;
      case HistoryType.ppbo:
        bodyPost = {
          'nik_kar': nik,
        };
        break;
      case HistoryType.potongan:
        bodyPost = !isDetail ? {
          'nik_kar': nik,
          'dateAwal': dateAwal,
          'dateAkhir': dateAkhir
        } : {
          'nik_kar': nik,
          'doc_no': doc
        };
        baseName = 'baseDate';
        break;
      case HistoryType.simpananwajib:
        bodyPost = {
          'nik_kar': nik,
          'dateAwal': dateAwal,
          'dateAkhir': dateAkhir
        };
        baseName = 'baseDate';
        break;
      case HistoryType.simpanansuk:
        bodyPost = {
          'nik_kar': nik,
          'dateAwal': dateAwal,
          'dateAkhir': dateAkhir
        };
        baseName = 'baseDate';
        break;
    }
    
    final String _typeBase = _typeBases[type][baseName];
    final Uri _uri = Uri.http(_homeBase, _subBase+_typeBase);
    // print(_uri.origin+_uri.path);
    // print(bodyPost);
    
    try {
      final http.Response response = await _client.post(_uri, body: bodyPost)
        .timeout(const Duration(seconds: 20));
      
      final Map data = json.decode(response.body) as Map;
      final bool isSuccess = data['status'] == '200';
      // print(data);

      if (response.statusCode != 200 || !isSuccess) {
        // print('status code != 200');
        return [];
      } else {
        final List<Map> result = (data['result'] as List)
          .map((e) => Map.from(e as Map)).toList();
        return result;
      }
    } catch (e) {
      // print(e);
      return [];
    }
  }
}