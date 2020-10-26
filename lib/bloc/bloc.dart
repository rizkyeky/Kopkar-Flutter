library bloc;

// import 'dart:math';
// import 'package:rxdart/rxdart.dart';

// import 'package:flutter/foundation.dart';
// import 'package:test_thumbrand/locator.dart';
// import 'package:test_thumbrand/model/model.dart';
// import 'package:test_thumbrand/service/service.dart';

part 'bloc_history.dart';
part 'bloc_home.dart';
part 'bloc_login.dart';
part 'bloc_profile.dart';
part 'bloc_pinjaman.dart';
part 'bloc_simpanan.dart';


abstract class Bloc {
  void init();
  void dispose();
}