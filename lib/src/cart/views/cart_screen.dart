import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping_cart/src/cart/bloc/cart_bloc.dart';
import 'package:shopping_cart/src/cart/views/widgtes/cart_item_widget.dart';
import 'package:shopping_cart/src/cart/views/widgtes/empty_cart_widget.dart';
import 'package:shopping_cart/src/cart/views/widgtes/loading_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  void getCartItem(BuildContext context) {
    context.read<CartBloc>().add(const GetCartItemsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartPlaceOrderState) {
            Fluttertoast.showToast(
                msg: "Your order has been placed successfully!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            getCartItem(context);
          }
        },
        builder: (context, state) => state is EmptyCartState
            ? const EmptyCartWidget()
            : state is CartGetItemsState
                ? ListView.builder(
                    itemCount: state.cartItems.length,
                    itemBuilder: (ctx, i) {
                      final model = state.cartItems[i];
                      return CartItemWidget(model: model);
                    })
                : state is CartOrderIsLoadingState
                    ? const LoadingWidget(message: 'Placing Your Order...',)
                    : const EmptyCartWidget(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<CartBloc>().add(const PlaceOrderEvent());
        },
        label: const Text('Place Order'),
        icon: const Icon(Icons.check_box_outlined),
      ),
    );
  }
}
