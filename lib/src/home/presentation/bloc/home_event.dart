part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class GetProductsEvent extends HomeEvent {
  const GetProductsEvent();
}

class GetLoadedProductsEvent extends HomeEvent {
  const GetLoadedProductsEvent();
}

class UpdateProductQtyEvent extends HomeEvent {
  final Product product;
  final CounterEvent counterEvent;
  const UpdateProductQtyEvent(this.product, this.counterEvent);
  @override
  List<Object> get props => [product,];
}

class RemoveProductEvent extends HomeEvent {
  final Product product;
  const RemoveProductEvent(this.product);
  @override
  List<Object> get props => [product,];
}

