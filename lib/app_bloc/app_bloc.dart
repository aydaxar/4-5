import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_flutter/resources/app_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final _repository = AppRepository();
  AppBloc() : super(AppInitial()) {
      on<LocaleInitAppEvent>(_repository.onLocaleInitAppEvent);
      on<AppFirstStartedEvent>(_repository.onAppFirstStartedEvent);
      on<UserAuthenticatedAppEvent>(_repository.onUserAuthenticatedAppEvent);
    }
}
