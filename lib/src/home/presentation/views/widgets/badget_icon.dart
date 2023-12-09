import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cart/bloc/cart_bloc.dart';

class BadgetIconWidget extends StatelessWidget {
  const BadgetIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Text('${BlocProvider.of<CartBloc>(context).cartItems.length}',
          style: const TextStyle(color: Colors.white, fontSize: 8),
          textAlign: TextAlign.center,
        );
      },
    );
  }
}
