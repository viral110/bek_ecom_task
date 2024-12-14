import 'package:bek_task/src/app/favorite/controller/favorite_controller.dart';
import 'package:bek_task/src/app/product/controller/product_provider.dart';
import 'package:bek_task/src/app/product/presentation/widgets/product_widget.dart';
import 'package:bek_task/src/common/widgets/custom_app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);
    final favorites = ref.watch(favoriteProvider);
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: "Products",
      ),
      body: products.when(
        data: (productList) => Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
          child: GridView.builder(
            itemCount: productList.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 225,
            ),
            itemBuilder: (context, index) {
              final product = productList[index];
              final isFavorite = favorites.contains(product.id);
              return ProductWidget(product: product, isFavorite: isFavorite);
            },
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
