part of 'bloc.dart';

class ProfileBloc implements Bloc {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  final Anggota anggota = locator.get<Anggota>(instanceName: 'Anggota Active');
  

}