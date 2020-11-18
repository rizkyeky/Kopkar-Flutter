part of 'bloc.dart';

class SimulationBloc implements Bloc {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  final PinjamanService _pinjamanService = locator.get<PinjamanService>();

  Future<Map> getMap(int total, int lama) async {
    return _pinjamanService.getSimulation(total, lama);
  }

}