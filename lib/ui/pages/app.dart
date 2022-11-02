import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_flutter/app_bloc/app_bloc.dart';
import 'package:project_flutter/ui/pages/app_locale_select_page.dart';
import 'package:project_flutter/ui/pages/unauthenticated_app.dart';

import 'authenticated_app.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppBloc appBloc;

  @override
  void initState() {
    appBloc = AppBloc();
    appBloc.add(LocaleInitAppEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: appBloc),
      ],
          child: ScreenUtilInit(
            designSize: Size(AppDisplay.mainWindth, AppDisplay.mainHeight),
            minTextAdapt: true,
            builder: (context, child) {
              return MaterialApp(
              theme: ThemeData(scaffoldBackgroundColor: Colors.white),
              debugShowCheckedModeBanner: false,
              // localizationDelegates: provider.delegates,
              // supportedLocales: provider.supportedLocales,
              // locale: provider.locale,
              home: child,
              );
            },
            child: BlocConsumer<AppBloc, AppState>(
              listener: (context, state) {
                if (state is FailureAppState) return;
              },
              builder: (context, state) {
                if (state is LocaleInitAppStore) return const AppLocaleSelectPage();
                if (state is UnauthenticatedAppState) return const UnauthenticatedApp();
                if (state is AuthenticatedAppState) return const AuthenticatedApp();
                if (state is FailureAppState) return const Scaffold();
                return const Scaffold(
                  body: Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.red,
                    )),
                  );
              },
            ),
          ),
    );
}
}
