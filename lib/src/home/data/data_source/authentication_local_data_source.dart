
import '../models/product_model.dart';

abstract class CartLocalDataSource {
  List<ProductModel> getProducts();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  const CartLocalDataSourceImpl();

  @override
  List<ProductModel> getProducts() {
    return [
      ProductModel(prID: 1, img: 'https://images.unsplash.com/photo-1539252554453-80ab65ce3586?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', prName: 'Prod1', price: 350, qty: 0),
      ProductModel(prID: 2, img: 'https://images.unsplash.com/photo-1539252554453-80ab65ce3586?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', prName: 'Prod2', price: 250, qty: 0),
      ProductModel(prID: 3, img: 'https://images.unsplash.com/photo-1539252554453-80ab65ce3586?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', prName: 'Prod3', price: 150, qty: 0),
      ProductModel(prID: 4, img: 'https://images.unsplash.com/photo-1539252554453-80ab65ce3586?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', prName: 'Prod3', price: 450, qty: 0),
    ];
  }


}
