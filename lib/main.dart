import 'package:assignment/features/authentication/models/campaign_model.dart';
import 'package:assignment/features/authentication/models/category_model.dart';
import 'package:assignment/features/authentication/models/favorite_provider.dart';
import 'package:assignment/features/authentication/screens/settings_screen.dart';
import 'package:provider/provider.dart';
import 'package:assignment/features/authentication/screens/contact-us.dart';
import 'package:assignment/features/authentication/screens/profile.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:assignment/features/authentication/screens/splash_screen.dart';
import 'package:assignment/firebase_options.dart';
import 'package:assignment/repository/authentication_repository/authentication_repository.dart';
import 'package:assignment/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeNotifier = ThemeNotifier(ThemeMode.system);
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
    .then((value) => Get.put(AuthenticationRepository()));
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(MyApp(themeNotifier: themeNotifier));
}

class MyApp extends StatelessWidget {
  final ThemeNotifier themeNotifier;
  const MyApp({Key? key, required this.themeNotifier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (context, themeMode, child) {
        return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoryModel()),
        ChangeNotifierProvider(create: (context) => CampaignModel()),
        ChangeNotifierProvider(create: (context) => FavouriteModel()),
      ],
      child: GetMaterialApp(     
      debugShowCheckedModeBanner: false,         
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
      routes: {
        '/profile': (context) => profile(),
        '/contact-us':(context) => contactus(),
        '/settings': (context) => settings(themeNotifier: themeNotifier),
      },
    ),
    );
      }

    );
    
    
  } 
}
