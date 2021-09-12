import '../constants.dart';
import '../custom_responsive.dart';
import '../other_exports.dart';
import 'body_page.dart';
import 'drawer_page.dart';

final portfolio = HomeItem(
    title: 'Portfolio',
    subtitle: 'Portfolio UI Example',
    action: () {
      Get.to(const PortfolioPage());
    });

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomResponsive.desktopBool(context) == true
          ? null
          : AppBar(
              backgroundColor: bgColor,
              automaticallyImplyLeading:
                  CustomResponsive.desktopBool(context) == true ? false : true,
            ),
      drawer: const ProfileWidget(),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: maxWidth),
          child: Row(
            children: [
              CustomResponsive.desktopBool(context) == false
                  ? Container()
                  : const Expanded(
                      child: ProfileWidget(),
                      flex: 2,
                    ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: defPadding),
                    child: Column(
                      children: [
                        const BannerWidget(),
                        const NumbersWidget(),
                        Text(
                          'My Projects',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          height: defPadding,
                        ),
                        CustomResponsive.desktopBool(context)
                            ? const ProjectWidget()
                            : CustomResponsive.tabletLandscapeBool(context)
                                ? const ProjectWidget(
                                    childAspextRatio: 1.3,
                                  )
                                : const ProjectWidget(
                                    childAspextRatio: 1.2,
                                    crossAxisCount: 2,
                                  ),
                        const RecommendationWidget()
                      ],
                    ),
                  ),
                ),
                flex: 7,
              )
            ],
          ),
        ),
      ),
    );
  }
}
