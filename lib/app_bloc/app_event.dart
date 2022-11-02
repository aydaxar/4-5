part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class AppFirstStartedEvent extends AppEvent {}

class UserAuthenticatedAppEvent extends AppEvent {}

class LocaleInitAppEvent extends AppEvent {}

class LocaleUserAppEvent extends AppEvent {}

class LogoutUserAppEvent extends AppEvent {}

class DeleteUserAppEvent extends AppEvent {}