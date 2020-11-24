
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:kopkar/locator.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/model.dart';


part 'service_anggota.dart';
part 'service_pinjaman.dart';
part 'service_connection.dart';
part 'service_history.dart';
part 'service_local.dart';

enum ConnectionStatus { online, offline }

class ServiceResult<T> {
  String massage;
  T value;

  ServiceResult({this.massage, this.value});
}