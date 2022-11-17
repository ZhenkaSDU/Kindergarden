import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_basics/features/auth/auth_screen.dart';
import 'package:the_basics/core/constants/global_variables.dart';
import 'package:the_basics/core/get_it/injection_container.dart';
import 'package:the_basics/core/utils/hive/hive_init.dart';
import 'package:the_basics/home/home_screen.dart';

import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  await Hive.initFlutter();
  initHiveAdapters();
  await initHiveBoxes();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kindergarden',
        theme: ThemeData(
            scaffoldBackgroundColor: GlobalVariables.whiteColor,
            appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: GlobalVariables.blackColor,
              ),
            )),
      // home: const HomeScreen(),
      home: const AuthScreen(),
      );
  }
}
