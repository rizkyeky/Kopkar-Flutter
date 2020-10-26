import 'package:flutter/material.dart';
import 'view/page/page.dart';

Route generatorRouter(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => HomePage());
      break;
    case '/login':
      return MaterialPageRoute(builder: (_) => LoginPage());
      break;
    case '/pinjaman':
      return MaterialPageRoute(builder: (_) => PinjamanPage());
      break;
    case '/simpanan':
      return MaterialPageRoute(builder: (_) => SimpananPage());
      break;
    case '/history':
      return MaterialPageRoute(builder: (_) => HistoryPage());
      break;
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}.'),
          ),
        ),
      );
    }
  }