import 'package:bek_task/src/app/favorite/controller/favorite_controller.dart';
import 'package:bek_task/src/app/favorite/controller/favorite_provider.dart';
import 'package:bek_task/src/app/favorite/presentation/widgets/favorite_product_widget.dart';
import 'package:bek_task/src/app/product/controller/product_provider.dart';
import 'package:bek_task/src/common/widgets/custom_app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);
    final favorites = ref.watch(favoriteProvider);
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: "Favorites",
      ),
      body: products.when(
        data: (productList) {
          final favoriteProducts = productList
              .where((product) => favorites.contains(product.id))
              .toList();

          if (favoriteProducts.isEmpty) {
            return const Center(child: Text('No favorites added yet.'));
          }
          return Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
            child: GridView.builder(
            itemCount: favoriteProducts.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 225,
            ),
            itemBuilder: (context, index) {
              final product = favoriteProducts[index];
              return FavoriteProductWidget(product: product);
            },
                    ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
