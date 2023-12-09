import 'package:flutter/material.dart';
import 'package:shopping_cart/src/cart/bloc/cart_bloc.dart';

import '../../src/cart/views/cart_screen.dart';
import '../../src/home/presentation/bloc/home_bloc.dart';
import '../../src/home/presentation/views/home_screen.dart';
import '../service/injection_container.dart';
import 'app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages {
  static final RouteObserver<Route> observer = RouteObserver();

  static List<PageEntity> routes() {
    return [
      PageEntity(
        path: AppRoutes.INITIAL,
        page: HomeScreen(),
        bloc: BlocProvider(create: (_)=> sl<HomeBloc>()),
      ),
      PageEntity(
        path: AppRoutes.CART,
        page: const CartScreen(),
        bloc: BlocProvider(create: (_)=> sl<CartBloc>()),
      )
    ];
  }

  static List<dynamic> provideBlocs(BuildContext context) {
    List<dynamic> blocList = <dynamic>[];
    for (var bloc in routes()) {
      blocList.add(bloc.bloc);
    }
    return blocList;
  }

  static MaterialPageRoute generateRouteSetting(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);
      if (result.isNotEmpty) {
        return MaterialPageRoute<void>(builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute<void>(builder: (_) => HomeScreen(), settings: settings);
  }
}

class PageEntity<T> {
  const PageEntity({
    required this.path,
    required this.page,
    required this.bloc,
  });

  final String path;
  final Widget page;
  final dynamic bloc;
}
