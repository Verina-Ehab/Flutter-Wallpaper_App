import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zetaton_wallpaper/features/home/controller/home_provider.dart';
import 'package:zetaton_wallpaper/features/search/controller/search_provider.dart';
import 'package:zetaton_wallpaper/features/skeleton/providers/skeleton_provider.dart';
import 'core/network/network_status.dart';
import 'features/authentication/controller/auth_provider.dart';
import 'features/favorite/controller/favorite_provider.dart';
import 'firebase_options.dart';
import 'core/theme/theme.dart';
import 'features/splash_screen/splash_screen.dart';
import 'injection_container.dart' as di;

// FirebaseAuth.instance.currentUser!.uid

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SkeletonProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
        StreamProvider<NetworkStatus>(
          create: (context) =>
              NetworkStatusService().networkStatusController.stream,
          initialData: NetworkStatus.Online,
        ),
        // ChangeNotifierProvider(create: (_) => di.locator<FavoriteProvider>()),
        // ChangeNotifierProvider(
        //     create: (_) => di.locator<AuthenticationProvider>()),
        // StreamProvider(
        //   // "read" to access the provider without triggering a rebuild to avoid unnecessary rebuilds.
        //   create: (context) =>
        //       context.read<AuthenticationProviderImp>().authStateChanges,
        //   initialData: null,
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wallpaper',
        themeMode: ThemeMode.system,
        theme: MyAppTheme.lightTheme,
        darkTheme: MyAppTheme.darkTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
