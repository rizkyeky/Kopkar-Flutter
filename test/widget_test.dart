// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:kopkar/model/model.dart';
import 'package:kopkar/service/service.dart';
import 'package:kopkar/locator.dart';

Future<void> main() async {

  final HistoryService _service = HistoryService();
  final PinjamanService _pinjamanService = PinjamanService();
  // await _service.getPinjamanBerjalan('07380');
  // List<PinjamanBerjalan> pinjamanBerjalan = await _service.getPinjamanBerjalan('07380');
  Map data = await _pinjamanService.getSimulation(3000000, 12);
  
  print(data.length);
  data.forEach((key, val) {
    print(key);
  });
  // await _service.getSome();
}
