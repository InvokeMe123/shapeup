import 'package:flutter/material.dart';
import 'package:shapeup/screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: 'test_public_key_47494fae63fd48158448b80bf362f95e',
      builder: (context, navigatorKey) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ne', 'NP'),
          ],
          localizationsDelegates: const [
            KhaltiLocalizations.delegate,
          ],
          title: 'Flutter Demo',
          theme: ThemeData(
            backgroundColor: Colors.white,
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
