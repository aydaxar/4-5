import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app_bloc/app_bloc.dart';

class AppLocaleSelectPage extends StatefulWidget {
  const AppLocaleSelectPage({super.key});

  @override
  State<AppLocaleSelectPage> createState() => _AppLocaleSelectPageState();
}

class _AppLocaleSelectPageState extends State<AppLocaleSelectPage> {
  late AppBloc appBloc;

  @override
  void initState() {
    appBloc = BlocProvider.of<AppBloc>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () async {
               await context.setLocale(Locale('ru'));
               appBloc.add(AppFirstStartedEvent());
              },
              child: Text("RU"),
            ),
            ElevatedButton(
              onPressed: () async {
                await context.setLocale(Locale('kk'));
                appBloc.add(AppFirstStartedEvent());
              },
                child: Text("KZ"),
            ),
            ElevatedButton(
              onPressed: () async {
                await context.setLocale(Locale('en'));
                appBloc.add(AppFirstStartedEvent());
              },
              child: Text("EN"),
            ),
          ]
        )
      )
    );
  }
}