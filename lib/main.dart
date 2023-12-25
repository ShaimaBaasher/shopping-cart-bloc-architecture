import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/src/home/presentation/views/home_screen.dart';

import 'core/routes/app_routes.dart';
import 'core/routes/pages.dart';
import 'core/service/injection_container.dart';
import 'core/utils/custom_scroll_behavior.dart';
import 'firebase_options.dart';
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.provideBlocs(context)],
      child: MaterialApp(
        title: 'Shopping Cart',
        navigatorObservers: <NavigatorObserver>[observer],
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.INITIAL,
        onGenerateRoute: AppPages.generateRouteSetting,
        scrollBehavior: CustomScrollBehavior(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
