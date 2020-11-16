library bloc;

// import 'dart:math';
// import 'package:rxdart/rxdart.dart';

import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../locator.dart';
import '../model/model.dart';
import '../service/service.dart';
// import 'package:flutter/foundation.dart';

part 'bloc_home.dart';
part 'bloc_login.dart';
part 'bloc_profile.dart';
part 'bloc_pinjaman.dart';
part 'bloc_simpanan.dart';

part 'bloc_history_ppbo.dart';
part 'bloc_history_simpanan.dart';
part 'bloc_history_pembelian.dart';
part 'bloc_history_potongan.dart';

part 'bloc_detail_pinjaman.dart';

abstract class Bloc {
  void init();
  void dispose();
}