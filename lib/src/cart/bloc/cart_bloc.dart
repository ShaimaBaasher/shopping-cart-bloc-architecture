import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/utils/enums.dart';
import '../../../core/utils/typedaf.dart';
import '../../home/data/models/product_model.dart';
import '../../home/domain/entities/product.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartInitial()) {
    on<UpdateCartQtyEvent>(_updateCartItemsHandler);
    on<GetCartItemsEvent>(_getCartItemsHandler);
    on<RemoveItemFromCartEvent>(_removeCartItemsHandler);
    on<PlaceOrderEvent>(_placeOrderHandler);
  }

  var cartItems = <Product>[];

  void _updateCartItemsHandler(UpdateCartQtyEvent event, Emitter<CartState> emitter) async {
    emit(const CartInitial());
    final index = cartItems.indexWhere((item) => item.prID == event.product.prID);
    if (event.counterEvent == CounterEvent.decrement) {
      if (index != -1) {
        if (cartItems[index].qty > event.minimumDecrement) {
            cartItems[index] = event.product;
          emit(CartGetItemsState(cartItems));
        } else {
          if (event.minimumDecrement != 1) {
            cartItems.removeAt(index);
            checkCartListIfIsEmpty();
          } else {
            emit(CartGetItemsState(cartItems));
          }
        }
      }
    } else {
      if (index != -1) {
        cartItems[index] = event.product;
      } else {
        cartItems.add(event.product);
      }
      emit(CartGetItemsState(cartItems));
    }
  }

  void _getCartItemsHandler(GetCartItemsEvent event, Emitter<CartState> emitter) {
    checkCartListIfIsEmpty();
  }

  void _removeCartItemsHandler(
      RemoveItemFromCartEvent event, Emitter<CartState> emitter) {
    emit(const CartInitial());
    cartItems.removeWhere((item) => item.prID == event.product.prID);
    checkCartListIfIsEmpty();
  }

  void _placeOrderHandler(PlaceOrderEvent event, Emitter<CartState> emitter) {
    if (cartItems.isNotEmpty) {
      emit(const CartOrderIsLoadingState());
      Future.delayed(const Duration(seconds: 2), () {
        emit(const CartPlaceOrderState());
      });
    }
  }

  void checkCartListIfIsEmpty() {
    cartItems.isNotEmpty
        ? emit(CartGetItemsState(cartItems))
        : emit(const EmptyCartState());
  }
}
