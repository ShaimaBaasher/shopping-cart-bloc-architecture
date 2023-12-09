part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
  @override
  List<Object> get props => [];
}

class GetCartItemsEvent extends CartEvent {
  const GetCartItemsEvent();
}

class PlaceOrderEvent extends CartEvent {
  const PlaceOrderEvent();
}

class RemoveItemFromCartEvent extends CartEvent {
  final Product product;
  const RemoveItemFromCartEvent(this.product);
  @override
  List<Object> get props => [product,];
}

class UpdateCartQtyEvent extends CartEvent {
  final Product product;
  final CounterEvent counterEvent;
  const UpdateCartQtyEvent(this.product, this.counterEvent);
  @override
  List<Object> get props => [product,];
}


