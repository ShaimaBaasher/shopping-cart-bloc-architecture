import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/style.dart';
import '../../../home/domain/entities/product.dart';
import '../../../home/presentation/bloc/home_bloc.dart';
import '../../bloc/cart_bloc.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.model,
  });

  final Product model;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(model.prID.toString()),
      onDismissed: (direction) {
        final cartBloc = context.read<CartBloc>();
        final homeBloc = context.read<HomeBloc>();
        cartBloc.add(RemoveItemFromCartEvent(model));
        homeBloc.add(RemoveProductEvent(model));
      },
      child: Card(
        child: ListTile(
          title: Text(model.prName, style: textMedium),
          subtitle:  Text('\$${model.price}', style: label,),
        ),
      ),
    );
  }
}
