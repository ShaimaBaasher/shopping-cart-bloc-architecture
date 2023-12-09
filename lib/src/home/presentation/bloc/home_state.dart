part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class ProductLoadedState extends HomeState {
  const ProductLoadedState(this.products);
  final List<Product> products;
}

class UpdateProdQtyState extends HomeState {
  const UpdateProdQtyState();
}

class ResetProduct extends HomeState {
  const ResetProduct();
}