import 'dart:ui';

import 'package:bek_task/src/app/product/model/product_model.dart';
import 'package:bek_task/src/common/constant/color_helper.dart';
import 'package:bek_task/src/common/widgets/custom_app_bar_widget.dart';
import 'package:bek_task/src/common/widgets/custom_text_widget.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  Product product;
  ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: const CustomAppBarWidget(
        title: 'Details',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black12,
              ),
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(product.image),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextWidget(text: product.title, fontSize: 20, fontWeight: FontWeight.w600,),
            const SizedBox(
              height: 18,
            ),
            CustomTextWidget(text: product.category, fontSize: 14, fontWeight: FontWeight.w600,),
            const SizedBox(
              height: 18,
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

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    '(${product.rating!.count.toString()})',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                        color: Color(0xff808488)
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: CustomTextWidget(text: "\$${2390}",color: Color(0xff808488),textDecoration: TextDecoration.lineThrough,),
                ),
                const SizedBox(
                  width: 6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CustomTextWidget(text: '\$${product.price.toString()}' ,color: ColorHelper.buttonColor, fontSize: 14, fontWeight: FontWeight.w600,),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            const CustomTextWidget(text: "Product Details", fontSize: 14, fontWeight: FontWeight.w600,),
            const SizedBox(
              height: 10,
            ),
            CustomTextWidget(text: product.description, fontSize: 12, fontWeight: FontWeight.w600,),
          ],
        ),
      ),
    );
  }
}
