
import 'package:shopping_cart/core/utils/typedaf.dart';

import '../../../../core/usecase/usecase.dart';
import '../entities/product.dart';
import '../repositories/cart_repository.dart';

class GetProductsUseCase extends UseCaseWithoutParams<ResultProducts> {
  const GetProductsUseCase(this._repository);

  final CartRepository _repository;

  @override
  ResultProducts<List<Product>> call() => _repository.getProducts();

}