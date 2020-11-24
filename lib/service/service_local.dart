part of 'service.dart';

class LocalService {
  SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<ServiceResult<Anggota>> getLocalUser() async {
    try {
      final userData = prefs.getStringList('ActiveUser');
      if (userData.length == 9) {
        return ServiceResult(massage: 'Success', value: Anggota.fromLocal(userData));
      } else {
        return ServiceResult(massage: 'Not Success');
      }
    } catch (e) {
      return ServiceResult(massage: 'Not Success');
    }
  }

  Future<ServiceResult<bool>> setLocalUser(Anggota anggota) async {
    try {
      await prefs.setStringList('ActiveUser', anggota.toLocal);
      return ServiceResult(massage: 'Success', value: true);
    } catch (e) {
      return ServiceResult(massage: 'Not Success');
    }
  }
}