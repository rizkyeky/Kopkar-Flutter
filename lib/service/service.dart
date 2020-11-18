
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
// import 'package:dio/dio.dart';
import 'package:kopkar/locator.dart';

import '../model/model.dart';


part 'service_anggota.dart';
part 'service_pinjaman.dart';
part 'service_connectivity.dart';
part 'service_history.dart';

class ServiceResult {
  String massage;
  dynamic result;

  ServiceResult({this.massage, this.result});
}