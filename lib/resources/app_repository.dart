import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_bloc/app_bloc.dart';

class AppRepository{
  Future<void> onLocaleInitAppEvent(LocaleInitAppEvent event, Emitter<AppState> emit) async {
    if (await isAuthenticated()) {
      emit(LocaleInitAppStore());
    } else {
      await onAppFirstStartedEvent(AppFirstStartedEvent(), emit);
    }
  }

  Future<void> onAppFirstStartedEvent(AppFirstStartedEvent event, Emitter<AppState> emit) async {
    if (await isAuthenticated()) {
    emit(AuthenticatedAppState());
    } else {
    emit(UnauthenticatedAppState());
    }
  }

  Future<void> onUserAuthenticatedAppEvent(
      UserAuthenticatedAppEvent event, Emitter<AppState> emit) async {
    emit(AuthenticatedAppState());
    }

  Future<bool> isAuthenticated() async {
    return true;
  }
}
