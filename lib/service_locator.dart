import 'package:get_it/get_it.dart';
import 'package:setlistherofl/services/auth_service.dart';
import 'package:setlistherofl/services/event_service.dart';
import 'package:setlistherofl/services/band_service.dart';
import 'package:setlistherofl/services/song_service.dart';
import 'package:setlistherofl/services/storage_service.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  locator.registerLazySingleton<AuthService>(() => AuthService());
  locator.registerLazySingleton<EventService>(() => EventService());
  locator.registerLazySingleton<SongService>(() => SongService());
  locator.registerLazySingleton<BandService>(() => BandService());
  locator.registerLazySingleton<StorageService>(() => StorageService());
}