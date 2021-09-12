import 'package:examples_hub/constants.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models.dart';

class ShopProduct extends StatelessWidget {
  final Product product;
  final VoidCallback onRemove;

  const ShopProduct(this.product, {Key? key, required this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          children: <Widget>[
            ShopProductDisplay(
              product,
              onPressed: onRemove,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: darkGrey,
                ),
              ),
            ),
            Text(
              '\$${product.price}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: darkGrey, fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ],
        ));
  }
}

class ShopProductDisplay extends StatelessWidget {
  final Product product;
  final VoidCallback onPressed;

  const ShopProductDisplay(this.product, {Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 200,
      child: Stack(children: <Widget>[
        Positioned(
          left: 25,
          child: SizedBox(
            height: 150,
            width: 150,
            child: Transform.scale(
              scale: 1.2,
              child: Image.asset(img1),
            ),
          ),
        ),
        Positioned(
          left: 50,
          top: 5,
          child: SizedBox(
              height: 80,
              width: 80,
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
              )),
        ),
        Positioned(
          right: 30,
          bottom: 25,
          child: Align(
            child: IconButton(
              icon: Image.asset(img1),
              onPressed: onPressed,
            ),
          ),
        )
      ]),
    );
  }
}
