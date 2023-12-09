import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/size_utils.dart';
import '../../../../../core/theme/style.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../cart/bloc/cart_bloc.dart';
import '../../../domain/entities/product.dart';
import '../../bloc/home_bloc.dart';
import 'custom_image_view.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(width: width, height: 280 * fem,
      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 17*fem, 0*fem),
      padding: EdgeInsets.fromLTRB(8*fem, 8*fem, 8*fem, 8*fem),
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
      child: Column(children: [
        CustomImageView(
          url: product.img,
          height: 157*fem,
          width: width,
          fit: BoxFit.cover,
          radius: BorderRadius.circular(
            8,
          ),
          alignment: Alignment.center,
        ),
        SizedBox(height: 7.5*fem,),
        Text(product.prName, style: textMedium,),
        Text('\$${product.price}', style: label,),
        SizedBox(height: 7.5*fem,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                context.read<HomeBloc>().add(
                    UpdateProductQtyEvent(product, CounterEvent.decrement));
                context.read<CartBloc>().add(
                    UpdateCartQtyEvent(product, CounterEvent.decrement));
              },
              icon: const Icon(Icons.remove_circle_outlined, color: error300Default,),
            ),
            Text('${product.qty}'),
            IconButton(
              onPressed: () {
                context.read<HomeBloc>().add(
                    UpdateProductQtyEvent(product, CounterEvent.increment));
                context.read<CartBloc>().add(
                    UpdateCartQtyEvent(product, CounterEvent.increment));
              },
              icon: const Icon(Icons.add_circle, color: success400,),
            ),
          ],
        )
      ],),);
  }
}
