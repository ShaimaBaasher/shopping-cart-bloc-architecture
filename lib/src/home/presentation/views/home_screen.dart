import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopping_cart/src/home/presentation/bloc/home_bloc.dart';
import 'package:shopping_cart/src/home/presentation/views/widgets/badget_icon.dart';
import 'package:shopping_cart/src/home/presentation/views/widgets/product_widget.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/routes/pages.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void getInitProducts() {
    context.read<HomeBloc>().add(const GetProductsEvent());
  }

  void getCurrentList() {
    context.read<HomeBloc>().add(const GetLoadedProductsEvent());
  }

  @override
  void initState() {
    getInitProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(AppPages.generateRouteSetting(RouteSettings(name: AppRoutes.CART)));
                  },
                  icon: const Icon(Icons.shopping_cart_outlined)),
              Positioned(
                  child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                constraints: const BoxConstraints(maxHeight: 40, minWidth: 20),
                child: const BadgetIconWidget(),
              ))
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {
                if (state is ResetProduct) {
                  getCurrentList();
                }
              },
              builder: (context, state) {
                if (state is ProductLoadedState) {
                  return  AlignedGridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.products.length,
                    itemBuilder: (ctx, index) {
                      final product = state.products[index];
                      return ProductWidget(
                        product: product,
                      );
                    },
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 2,
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}


