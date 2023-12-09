
import '../models/product_model.dart';

abstract class CartLocalDataSource {
  List<ProductModel> getProducts();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  const CartLocalDataSourceImpl();

  @override
  List<ProductModel> getProducts() {
    return [
      ProductModel(prID: 1, prName: 'prName', price: '350', qty: 0),
      ProductModel(prID: 2, prName: 'prCame', price: '250', qty: 0),
      ProductModel(prID: 3, prName: 'prXame', price: '150', qty: 0),
      ProductModel(prID: 4, prName: 'prRame', price: '450', qty: 0),
    ];
  }


}
