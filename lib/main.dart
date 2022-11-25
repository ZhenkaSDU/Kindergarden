import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_basics/core/constants/global_variables.dart';
import 'package:the_basics/core/get_it/injection_container.dart';
import 'package:the_basics/core/utils/hive/hive_init.dart';
import 'package:the_basics/home/logic/bloc/save_child_bloc.dart';
import 'package:the_basics/home/m2_add_screen.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<SaveChildBloc>(
          create: (_) => sl(),
        ),
      ],
      child: MaterialApp(
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
        home: const M2AddScreen(),
      ),
    );
  }
}
