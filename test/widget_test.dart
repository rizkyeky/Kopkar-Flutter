// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

import 'package:kopkar/model/model.dart';
import 'package:kopkar/service/service.dart';

Future<void> main() async {

  final HistoryService _service = HistoryService();
  // await _service.getPinjamanBerjalan('07380');
  // List<PinjamanBerjalan> pinjamanBerjalan = await _service.getPinjamanBerjalan('07380');
  List<Map> data = await _service.getPpobTrans('07380');
  print(data.length);
  data.forEach((element) {
    print(element);
  });
  // await _service.getSome();
}
