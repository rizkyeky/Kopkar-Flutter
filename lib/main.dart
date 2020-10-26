import 'package:flutter/material.dart';

import 'router.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kopkar',
      theme: appTheme,
      initialRoute: '/',
      onGenerateRoute: generatorRouter,
    );
  }
}