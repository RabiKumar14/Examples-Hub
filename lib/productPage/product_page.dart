//todo Fix UI

import 'package:examples_hub/productPage/widgets/top_part.dart';

import '../home.dart';
import '../other_exports.dart';
import 'constant_data.dart';
import 'widgets/bottom_part.dart';

var productPage = HomeItem(
    title: 'Product',
    subtitle: 'Product Page UI',
    action: () {
      Get.to(const ProductPage());
    });

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF696D77), Color(0xFF292C36)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: screenAwareSize(20.0, context),
            ),
            onPressed: () {},
          ),
          title: Text("Energy Cloud",
              style: TextStyle(
                color: Colors.white,
                fontSize: screenAwareSize(18.0, context),
              )),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite_border,
                size: screenAwareSize(20.0, context),
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const <Widget>[
              ProductScreenTopPart(),
              ProductScreenBottomPart()
            ],
          ),
        ),
      ),
    );
  }
}
