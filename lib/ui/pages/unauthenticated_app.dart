import 'package:flutter/material.dart';
import 'package:project_flutter/pages/register_form_page.dart';

class UnauthenticatedApp extends StatefulWidget {
  const UnauthenticatedApp({super.key});

  @override
  State<UnauthenticatedApp> createState() => _UnauthenticatedAppState();
}

class _UnauthenticatedAppState extends State<UnauthenticatedApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      // localizationDelegates: provider.delegates,
      // supportedLocales: provider.supportedLocales,
      // locale: provider.locale,
      initialRoute: '/page2',
      routes: {
        '/page2': (context) => const RegisterFormPage(
        ),
      },
    );
  }
}