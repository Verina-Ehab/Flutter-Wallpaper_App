import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:zetaton_wallpaper/features/search/controller/search_provider.dart';

import 'features/authentication/controller/auth_provider.dart';
import 'features/favorite/controller/favorite_provider.dart';
import 'features/home/controller/home_provider.dart';
import 'features/skeleton/providers/skeleton_provider.dart';
// import 'features/authentication/data/datasources/auth_remote_data_source.dart';

final locator = GetIt.instance;

Future<void> init() async {
  //! Features - posts

  // Provider - initialize it on main for materialApp

  locator.registerFactory(() => SkeletonProvider());
  locator.registerFactory(() => HomeProvider());
  locator.registerFactory(() => SearchProvider());
  locator.registerFactory(() => FavoriteProvider());
  locator.registerFactory(() => AuthenticationProvider());

  // //! Core

  // selector.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(selector()));
  //! External

  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);
  locator.registerLazySingleton(() => http.Client());
}
