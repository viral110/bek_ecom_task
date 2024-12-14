import 'package:bek_task/src/app/favorite/controller/favorite_controller.dart';
import 'package:bek_task/src/app/product/model/product_model.dart';
import 'package:bek_task/src/common/constant/color_helper.dart';
import 'package:bek_task/src/routes/app_route_name.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductWidget extends ConsumerWidget {
  Product product;
  bool isFavorite;
  ProductWidget({super.key, required this.product, required this.isFavorite});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteProvider);
    return InkWell(
      onTap: () {
        context.push(AppRouteName.productDetailPage,extra: {
          'product' : product
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              offset: const Offset(
                3.0,
                3.0,
              ),
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      product.image,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 5,
                  child: IconButton(
                    onPressed: () {
                      if (isFavorite) {
                        ref.read(favoriteProvider.notifier).removeFavorite(product.id);
                      } else {
                        ref.read(favoriteProvider.notifier).addFavorite(product.id);
                      }
                    },
                    color: isFavorite ? ColorHelper.buttonColor : null,
                    icon: isFavorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                product.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                product.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: RatingBar.readOnly(
                    size: 15,
                    filledIcon: Icons.star,
                    emptyIcon: Icons.star_border,
                    initialRating: double.tryParse(product.rating!.rate.toString())!,
                    maxRating: 5,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
