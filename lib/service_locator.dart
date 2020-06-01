import 'package:get_it/get_it.dart';
import 'package:setlistherofl/services/auth_service.dart';
import 'package:setlistherofl/services/event_service.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  locator.registerLazySingleton<AuthService>(() => AuthService());
  locator.registerLazySingleton<EventService>(() => EventService());
}