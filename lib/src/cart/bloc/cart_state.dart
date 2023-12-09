part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {
  const CartInitial();
}

class CartGetItems extends CartState {
  final ResultProducts<List<ProductModel>> cartItems;
  const CartGetItems(this.cartItems);
}

class CartGetItemsState extends CartState {
  const CartGetItemsState(this.cartItems);
  final List<Product> cartItems;
}

class EmptyCartState extends CartState {
  const EmptyCartState();
}

class CartOrderIsLoadingState extends CartState {
  const CartOrderIsLoadingState();
}

class CartPlaceOrderState extends CartState {
  const CartPlaceOrderState();
}

