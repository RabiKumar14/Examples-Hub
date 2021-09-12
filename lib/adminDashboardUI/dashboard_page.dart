//todo Fix UI

import 'package:examples_hub/constants.dart';
import 'package:flutter_svg/svg.dart';

import '../custom_responsive.dart';
import '../other_exports.dart';
import 'components/header.dart';
import 'components/my_fields.dart';
import 'components/recent_files.dart';
import 'components/storage_details.dart';
import 'models/my_file.dart';

var dashboard = HomeItem(
    title: 'Dashboard Example',
    subtitle: 'Dashboard with UI components and data table',
    action: () {
      Get.to(const DasboardPage());
    });

class DasboardPage extends StatelessWidget {
  const DasboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (CustomResponsive.desktopBool(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const MyFiles(),
                      const SizedBox(height: defaultPadding),
                      const RecentFiles(),
                      if (CustomResponsive.mobilePortraitBool(context))
                        const SizedBox(height: defaultPadding),
                      if (CustomResponsive.mobilePortraitBool(context))
                        const StarageDetails(),
                    ],
                  ),
                ),
                if (!CustomResponsive.mobilePortraitBool(context))
                  const SizedBox(width: defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!CustomResponsive.mobilePortraitBool(context))
                  const Expanded(
                    flex: 2,
                    child: StarageDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(img1),
          ),
          DrawerListTile(
            title: "Dashbord",
            svgSrc: svg1,
            press: () {},
          ),
          DrawerListTile(
            title: "Transaction",
            svgSrc: svg1,
            press: () {},
          ),
          DrawerListTile(
            title: "Task",
            svgSrc: svg1,
            press: () {},
          ),
          DrawerListTile(
            title: "Documents",
            svgSrc: svg1,
            press: () {},
          ),
          DrawerListTile(
            title: "Store",
            svgSrc: svg1,
            press: () {},
          ),
          DrawerListTile(
            title: "Notification",
            svgSrc: svg1,
            press: () {},
          ),
          DrawerListTile(
            title: "Profile",
            svgSrc: svg1,
            press: () {},
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: svg1,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
