import 'package:flutter/material.dart';
import 'package:project_flutter/pages/qr_scann_page.dart';

class AuthenticatedApp extends StatefulWidget {
  const AuthenticatedApp({super.key});

  @override
  State<AuthenticatedApp> createState() => _AuthenticatedAppState();
}

class _AuthenticatedAppState extends State<AuthenticatedApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      // localizationDelegates: provider.delegates,
      // supportedLocales: provider.supportedLocales,
      // locale: provider.locale,
      initialRoute: '/page1',
      routes: {
        '/page1': (context) => const QrScannPage(),
      },
    );
  }
}