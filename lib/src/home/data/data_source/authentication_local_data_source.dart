
import '../models/product_model.dart';

abstract class CartLocalDataSource {
  List<ProductModel> getProducts();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  const CartLocalDataSourceImpl();

  @override
  List<ProductModel> getProducts() {
    return [
      ProductModel(prID: 1, prName: 'Prod1', price: 350, qty: 0),
      ProductModel(prID: 2, prName: 'Prod2', price: 250, qty: 0),
      ProductModel(prID: 3, prName: 'Prod3', price: 150, qty: 0),
      ProductModel(prID: 4, prName: 'Prod3', price: 450, qty: 0),
    ];
  }


}
