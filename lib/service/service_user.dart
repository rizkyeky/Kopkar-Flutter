part of 'service.dart';

class UserService {

  final String _homeBase = '185.210.144.158';
  final String _subBase = 'koperasi_api/api_v1/get_login';
  
  final http.Client _client = http.Client();
  
  Future<void> getUser() async {
    
    final Uri _uri = Uri.http(_homeBase, _subBase);
    
    final http.Response response = await _client.get(_uri)
      .timeout(const Duration(seconds: 10));

    final Map data = json.decode(response.body) as Map;
    final bool isLogin = data['message'] == 'Login Berhasil';

    if (response.statusCode != 200 || !isLogin) {
      // Respone not success
      return Anggota.initial();
    } else {
      return Anggota(
        data['id_card'] as String,
        data['nama'] as String,
        email: data['email'] as String,
        alamat: data['alamat'] as String,
        noTelp: data['no_telp'] as String,
        statusAnggota: data['status_anggota'] == 'AKTIVE',
        simPokok: (data['sim_pokok'] as num).toInt(),
        simWajib: (data['sim_wajib'] as num).toInt(),
        gaji: (data['gaji'] as num).toInt(),
        batasPinjaman: (data['batas_pinjaman'] as num).toInt()
      );
    }
  }
}