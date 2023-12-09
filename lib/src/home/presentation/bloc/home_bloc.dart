import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecase/get_products.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  var productList = <Product>[];

  HomeBloc({required GetProductsUseCase getProductsUseCase})
      : _getProductsUseCase = getProductsUseCase,
        super(HomeInitial()) {
    on<GetProductsEvent>(_getProductsHandler);
    on<GetLoadedProductsEvent>(_getLoadedProductsHandler);
    on<UpdateProductQtyEvent>(_updateProductHandler);
    on<RemoveProductEvent>(_resetProductQtyHandler);
  }

  final GetProductsUseCase _getProductsUseCase;

  void _getProductsHandler(GetProductsEvent event, Emitter<HomeState> emitter) {
    final result = _getProductsUseCase();
    productList.clear();
    productList.addAll(result);
    emit(ProductLoadedState(productList));
  }

  void _getLoadedProductsHandler(GetLoadedProductsEvent event, Emitter<HomeState> emitter) {
    emit(ProductLoadedState(productList));
  }

  void _updateProductHandler(UpdateProductQtyEvent event, Emitter<HomeState> emitter) {
    emit(const UpdateProdQtyState());
    if (event.counterEvent == CounterEvent.increment) {
      event.product.qty++;
    } else {
      if (event.product.qty > 0) {
        event.product.qty--;
      }
    }
    emit(ProductLoadedState(productList));
  }

  void _resetProductQtyHandler(RemoveProductEvent event, Emitter<HomeState> emitter) {
    event.product.qty = 0;
    emit(const ResetProduct());
  }
}
