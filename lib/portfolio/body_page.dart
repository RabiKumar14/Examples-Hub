import 'package:animated_text_kit/animated_text_kit.dart';

import '../constants.dart';
import '../custom_responsive.dart';
import '../other_exports.dart';
import 'dataModels/project_and_recommendations.dart';

class RecommendationWidget extends StatelessWidget {
  const RecommendationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recommendations',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: defPadding,
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    recommendationsList.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(right: defPadding),
                          child: RecommendationCard(
                            recommendation: recommendationsList[index],
                          ),
                        )),
              )),
        ],
      ),
    );
  }
}

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
    Key? key,
    required this.recommendation,
  }) : super(key: key);

  final Recommendation recommendation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defPadding),
      width: 400,
      color: secColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            recommendation.name!,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(recommendation.source!),
          const SizedBox(
            height: defPadding,
          ),
          Text(
            recommendation.text!,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(height: 1.5),
          )
        ],
      ),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({
    Key? key,
    this.crossAxisCount = 3,
    this.childAspextRatio = 1.3,
  }) : super(key: key);
  final int crossAxisCount;
  final double childAspextRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: projects.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: defPadding,
            mainAxisSpacing: defPadding,
            childAspectRatio: childAspextRatio),
        itemBuilder: (context, index) => Container(
              color: secColor,
              padding: const EdgeInsets.all(defPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    projects[index].title!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  const Spacer(),
                  Text(
                    projects[index].des!,
                    maxLines:
                        CustomResponsive.mobilePortraitBool(context) ? 3 : 4,
                    style: const TextStyle(height: 1.5),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Read More',
                        style: TextStyle(color: priColour),
                      ))
                ],
              ),
            ));
  }
}

class NumbersWidget extends StatelessWidget {
  const NumbersWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: defPadding, vertical: defPadding / 2),
      child: DefaultTextStyle(
        style: CustomResponsive.mobilePortraitBool(context)
            ? const TextStyle(fontSize: 11, color: Colors.white)
            : Theme.of(context).textTheme.subtitle2!,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                AnimatedCounter(
                  count: 1116,
                  text: '+',
                ),
                SizedBox(
                  width: defPadding / 2,
                ),
                Text(
                  'Viewers',
                )
              ],
            ),
            Row(
              children: const [
                AnimatedCounter(
                  count: 202,
                  text: '+',
                ),
                SizedBox(
                  width: defPadding / 2,
                ),
                Text(
                  'Followerss',
                )
              ],
            ),
            Row(
              children: const [
                AnimatedCounter(
                  count: 45,
                  text: '+',
                ),
                SizedBox(
                  width: defPadding / 2,
                ),
                Text(
                  'Subscribers',
                )
              ],
            ),
            Row(
              children: const [
                AnimatedCounter(
                  count: 5,
                  text: '',
                ),
                SizedBox(
                  width: defPadding / 2,
                ),
                Text(
                  'Viewers',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedCounter extends StatelessWidget {
  const AnimatedCounter({
    Key? key,
    required this.count,
    this.text,
  }) : super(key: key);
  final int count;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: IntTween(begin: 0, end: count),
      duration: defDuration,
      builder: (context, value, child) => Text(
        '$value$text',
        style: CustomResponsive.mobilePortraitBool(context)
            ? const TextStyle(fontSize: 12, color: priColour)
            : Theme.of(context).textTheme.headline6!.copyWith(color: priColour),
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            img1,
            fit: BoxFit.cover,
          ),
          Container(
            color: darkColor.withOpacity(0.66),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Discover the amazing \nbeauty of Architecture',
                  style: CustomResponsive.desktopBool(context)
                      ? Theme.of(context).textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white)
                      : CustomResponsive.tabletPortraitBool(context)
                          ? Theme.of(context).textTheme.headline4!.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.white)
                          : Theme.of(context).textTheme.headline5!.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.white),
                ),
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.subtitle1!,
                  child: AnimatedTextKit(animatedTexts: [
                    TyperAnimatedText('Well Done!'),
                    TyperAnimatedText('Crystal'),
                    TyperAnimatedText('Keep it up!')
                  ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
