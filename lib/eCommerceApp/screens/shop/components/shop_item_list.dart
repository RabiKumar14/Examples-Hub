import 'package:examples_hub/eCommerceApp/screens/product/components/color_list.dart';
import 'package:examples_hub/eCommerceApp/screens/product/components/shop_product.dart';
import 'package:numberpicker/numberpicker.dart';
import '../../../../other_exports.dart';
import '../../../constants.dart';
import '../../../models.dart';

class ShopItemList extends StatefulWidget {
  final Product? product;
  final VoidCallback? onRemove;

  const ShopItemList(this.product, {Key? key, this.onRemove}) : super(key: key);

  @override
  _ShopItemListState createState() => _ShopItemListState();
}

class _ShopItemListState extends State<ShopItemList> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 130,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: const Alignment(0, 0.8),
            child: Container(
                height: 100,
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: shadow,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(top: 12.0, right: 12.0),
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.product!.name,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: darkGrey,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 160,
                                padding: const EdgeInsets.only(
                                    left: 32.0, top: 8.0, bottom: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    const ColorOption(Colors.red),
                                    Text(
                                      '\$${widget.product!.price}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: darkGrey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
//TODO: Work on scroll quantity
                      NumberPicker(
                        value: quantity,
                        minValue: 1,
                        maxValue: 10,
                        onChanged: (value) {
                          setState(() {
                            quantity = value;
                          });
                        },
                      )
                    ])),
          ),
          Positioned(
              top: 5,
              child: ShopProductDisplay(
                widget.product!,
                onPressed: widget.onRemove!,
              )),
        ],
      ),
    );
  }
}