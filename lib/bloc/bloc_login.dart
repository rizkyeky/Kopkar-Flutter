part of 'bloc.dart';

class LoginBloc implements Bloc {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  String inputNIK;
  String inputPassword;

  final ValueNotifier<bool> awaitLogin = ValueNotifier(false);
  final AnggotaService _anggotaService = locator.get<AnggotaService>();

  Future<bool> getLogin() async {
    bool isSuccess;
    if (inputNIK != null && inputPassword != null) {
      awaitLogin.value = true;
      await _anggotaService.login(inputNIK, inputPassword).then((result) {
        if (result.value != null) {
          locator.registerSingleton(Anggota.duplicate(result.value as Anggota),
            instanceName: 'Anggota Active'
          );
          isSuccess = true;
        } else {
          isSuccess = false;
        }
        awaitLogin.value = false;
      });
    }
    return isSuccess;
  }

}