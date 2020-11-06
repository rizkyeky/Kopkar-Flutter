library bloc;

// import 'dart:math';
// import 'package:rxdart/rxdart.dart';

import '../locator.dart';
import '../model/model.dart';
import '../service/service.dart';
// import 'package:flutter/foundation.dart';

part 'bloc_history.dart';
part 'bloc_home.dart';
part 'bloc_login.dart';
part 'bloc_profile.dart';
part 'bloc_pinjaman.dart';
part 'bloc_simpanan.dart';
part 'bloc_historyoption.dart';
part 'bloc_detail_pinjaman_berjalan.dart';

abstract class Bloc {
  void init();
  void dispose();
}