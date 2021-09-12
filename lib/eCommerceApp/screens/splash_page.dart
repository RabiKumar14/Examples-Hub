import 'package:examples_hub/constants.dart';

import '../../home.dart';
import '../../other_exports.dart';
import '../constants.dart';
import 'auth/welcome_back_page.dart';

var eCommerce = HomeItem(
    title: 'ECommerce App',
    subtitle: 'Template for eCommerce',
    action: () {
      Get.to(SplashScreen());
    });

// ignore: use_key_in_widget_constructors
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation<double>? opacity;
  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2500), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller!)
      ..addListener(() {
        setState(() {});
      });
    controller!.forward().then((_) {
      navigationPage();
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  void navigationPage() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const WelcomeBackPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(img1), fit: BoxFit.cover)),
      child: Container(
        decoration: const BoxDecoration(color: transparentYellow),
        child: SafeArea(
          child: Scaffold(
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Opacity(
                      opacity: opacity!.value, child: Image.asset(img1)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: const TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(text: 'Powered by '),
                          TextSpan(
                              text: 'int2.io',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
