import 'package:examples_hub/constants.dart';
import 'package:examples_hub/eCommerceApp/screens/shop/check_out_page.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models.dart';
import 'shop_product.dart';

class ShopBottomSheet extends StatefulWidget {
  const ShopBottomSheet({Key? key}) : super(key: key);

  @override
  _ShopBottomSheetState createState() => _ShopBottomSheetState();
}

class _ShopBottomSheetState extends State<ShopBottomSheet> {
  List<Product> products = [
    Product(img1, 'Boat roackerz 400 On-Ear Bluetooth Headphones',
        'description', 45.3),
    Product(img1, 'Boat roackerz 100 On-Ear Bluetooth Headphones',
        'description', 22.3),
    Product(img1, 'Boat roackerz 300 On-Ear Bluetooth Headphones',
        'description', 58.3)
  ];

  @override
  Widget build(BuildContext context) {
    Widget confirmButton = InkWell(
      onTap: () async {
        Navigator.of(context).pop();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => CheckOutPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom == 0
                ? 20
                : MediaQuery.of(context).padding.bottom),
        child: const Center(
            child: Text("Confirm",
                style: TextStyle(
                    color: Color(0xfffefefe),
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 20.0))),
        decoration: BoxDecoration(
            gradient: mainButton,
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
      ),
    );

    return Container(
        decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.9),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24), topLeft: Radius.circular(24))),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Image.asset(
                  img1,
                  height: 24,
                  width: 24.0,
                  fit: BoxFit.cover,
                ),
                onPressed: () {},
                iconSize: 48,
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (_, index) {
                    return Row(
                      children: <Widget>[
                        ShopProduct(
                          products[index],
                          onRemove: () {
                            setState(() {
                              products.remove(products[index]);
                            });
                          },
                        ),
                        index == 4
                            ? const SizedBox()
                            : Container(
                                width: 2,
                                height: 200,
                                color: const Color.fromRGBO(100, 100, 100, 0.1))
                      ],
                    );
                  }),
            ),
            confirmButton
          ],
        ));
  }
}
