import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/size_utils.dart';
import '../../../../core/theme/style.dart';
import '../../../home/domain/entities/product.dart';
import '../../../home/presentation/bloc/home_bloc.dart';
import '../../../home/presentation/views/widgets/custom_image_view.dart';
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
      child: Container(width: 327 * fem,
        height: 101 * fem,
        padding: EdgeInsets.all(8*fem),
        margin: EdgeInsets.all(2*fem),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.03999999910593033),
                offset: Offset(0, 4),
                blurRadius: 20),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomImageView(
                  imagePath: model.img,
                  width: 102 * fem,
                  height: 85 * fem,
                  radius: BorderRadius.circular(
                    12*fem,
                  ),
                  alignment: Alignment.center,
                ),
                SizedBox(
                  width: 8 * fem,
                ),
                Column(children: [
                  Text(model.prName, style: textMedium),
                  Text('\$${model.price}', style: label,),
                ],)
              ],
            ),
            Text('${model.qty} x', style: label.copyWith(color: neutralNeutral900default))
          ],
        ),
      )

    );
  }
}
