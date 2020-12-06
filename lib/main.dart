import 'package:flutter/material.dart';

import 'locator.dart';
import 'model/model.dart';
import 'service/service.dart';
import 'theme.dart';
import 'view/page/page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setLocator();

  final ServiceResult<Anggota> serviceResult = await locator.get<LocalService>()
    .getLocalUser();

  final Anggota user = Anggota.initial();
  
  if (serviceResult.value != null) {
    user.duplicate(serviceResult.value);
  }
  
  locator.registerSingleton(Anggota.duplicate(user),
    instanceName: 'Anggota Active'
  );

  await locator.allReady();

  runApp(App(isLogin: serviceResult == null,));
}

class App extends StatelessWidget {

  final bool isLogin;
  const App({this.isLogin});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kopkar',
      theme: appTheme,
      home: isLogin ? MainPage() : LoginPage(),
    );
  }
}