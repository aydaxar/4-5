import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:project_flutter/translations/locale_keys.g.dart';


class Home extends StatefulWidget {
  const Home({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LocaleKeys.hello.tr()),
            Text(LocaleKeys.edited.tr()),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () async{

                      await context.setLocale(const Locale('kk'));
                    },
                    child: const Text("KZ")),
                ElevatedButton(onPressed: () async{
                  await context.setLocale(const Locale('ru'));

                }, child: const Text("RU")),
                ElevatedButton(
                    onPressed: () async{

                      await context.setLocale(const Locale('en'));
                    },
                    child: const Text("US"))
              ],)
          ],
        ),
      ),
    );
  }
}