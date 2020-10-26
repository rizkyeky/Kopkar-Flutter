import 'package:flutter/material.dart';

Route generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      // return MaterialPageRoute(builder: (_) => HomePage());
      break;
    case '/inputwallet':
      // return MaterialPageRoute(builder: (_) => InputWalletPage());
      break;
    case '/detailswallet':
      // return MaterialPageRoute(builder: (_) => DetailWalletPage(wallet));
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