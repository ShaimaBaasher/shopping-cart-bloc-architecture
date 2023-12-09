import 'package:shopping_cart/core/utils/typedaf.dart';

import '../../domain/entities/product.dart';
import '../../domain/repositories/cart_repository.dart';
import '../data_source/authentication_local_data_source.dart';

class CartRepositoryImplementation implements CartRepository {
  const CartRepositoryImplementation(this._repository);

  final CartLocalDataSource _repository;

  @override
  ResultProducts<List<Product>> getProducts() {
    return _repository.getProducts();
  }

}
