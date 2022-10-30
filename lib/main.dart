import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruit_hub/view/screens/home_screen/home_screen.dart';
import 'package:fruit_hub/view/screens/splash_screen/splash_screen.dart';


import 'controller/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) =>
      runApp(const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const SplashScreen(),
    );
  }
}
