import 'package:flutter/material.dart';

import 'locator.dart';
import 'theme.dart';
import 'view/page/page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setLocator();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: true,
      title: 'Kopkar',
      theme: appTheme,
      home: LoginPage(),
    );
  }
}