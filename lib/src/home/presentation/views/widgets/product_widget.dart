import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../cart/bloc/cart_bloc.dart';
import '../../../domain/entities/product.dart';
import '../../bloc/home_bloc.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(product.prName),
              Text('\$${product.price}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  context.read<HomeBloc>().add(UpdateProductQtyEvent(product, CounterEvent.decrement));
                  context.read<CartBloc>().add(UpdateCartQtyEvent(product, CounterEvent.decrement));
                },
                icon: const Icon(Icons.remove),
              ),
              Text('${product.qty}'),
              IconButton(
                onPressed: () {
                  context.read<HomeBloc>().add(UpdateProductQtyEvent(product, CounterEvent.increment));
                  context.read<CartBloc>().add(UpdateCartQtyEvent(product, CounterEvent.increment));
                },
                icon: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
