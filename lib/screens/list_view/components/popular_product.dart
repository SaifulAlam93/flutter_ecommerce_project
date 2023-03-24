import 'package:ecommerce_ui/screens/list_view/components/product_card.dart';
import 'package:ecommerce_ui/screens/list_view/list_view.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_ui/models/Product.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [

        ...List.generate(

          demoProducts.length,

          (index) {
              return ProductCard(product: demoProducts[index]);
          },
        ),
        SizedBox(width: getProportionateScreenWidth(20))
      ],
    );
  }
}
