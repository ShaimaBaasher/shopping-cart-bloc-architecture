
import '../../../../core/utils/typedaf.dart';
import '../entities/product.dart';

abstract class CartRepository {
  const CartRepository();

  ResultProducts<List<Product>> getProducts();
}