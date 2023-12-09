import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/src/home/presentation/views/home_screen.dart';

import 'core/routes/app_routes.dart';
import 'core/routes/pages.dart';
import 'core/service/injection_container.dart';
import 'core/utils/custom_scroll_behavior.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        debugShowCheckedModeBanner: false,
        navigatorObservers: [AppPages.observer],
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
