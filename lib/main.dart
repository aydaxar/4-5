import "package:easy_localization/easy_localization.dart";
import 'package:flutter/material.dart';
import 'package:project_flutter/pages/register_form_page.dart';
import 'package:project_flutter/translations/codegen_loader.g.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('kk'),
        Locale('ru'),
        Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('kk'),
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegisterFormPage(),
    );
  }
}

