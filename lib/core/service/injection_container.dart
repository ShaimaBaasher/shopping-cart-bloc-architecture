import 'package:get_it/get_it.dart';
import 'package:shopping_cart/src/cart/bloc/cart_bloc.dart';

import '../../src/home/data/data_source/authentication_local_data_source.dart';
import '../../src/home/data/repositories/authentication_repository_implementation.dart';
import '../../src/home/domain/repositories/cart_repository.dart';
import '../../src/home/domain/usecase/get_products.dart';
import '../../src/home/presentation/bloc/home_bloc.dart';
final sl = GetIt.instance;

Future<void> init() async {
  // AppLogic
  sl..registerFactory(() => HomeBloc(getProductsUseCase: sl()))
  // UseCases
    ..registerLazySingleton(() => CartBloc())
    ..registerLazySingleton(() => GetProductsUseCase(sl()))
  // Repositories
    ..registerLazySingleton<CartRepository>(() => CartRepositoryImplementation(sl()))
  // DataSources
    ..registerLazySingleton<CartLocalDataSource>(() => CartLocalDataSourceImpl());

}
