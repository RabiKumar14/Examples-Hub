import '../constants.dart';
import '../other_exports.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: const [
          AvatarInfo(),
          ResInfo(),
        ],
      ),
    );
  }
}

class ResInfo extends StatelessWidget {
  const ResInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defPadding),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: defPadding / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Residence',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text('Philippines')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: defPadding / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'City',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text('Lipa')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: defPadding / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Age',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text('23'),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defPadding),
              child: Text(
                'Skills',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            Row(
              children: const [
                SkillWidget(
                  percentage: 0.7,
                  skill: 'AutoCad',
                ),
                SizedBox(
                  width: defPadding,
                ),
                SkillWidget(percentage: 0.9, skill: 'Drawing'),
                SizedBox(
                  width: defPadding,
                ),
                SkillWidget(percentage: 0.3, skill: 'Architecture'),
              ],
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defPadding),
              child: Text(
                'Coding',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            Column(
              children: const [
                CodingSkills(
                  skill: 'Talking',
                  percentage: 0.55,
                ),
                CodingSkills(percentage: 0.1, skill: 'Laziness'),
                CodingSkills(percentage: 0.9, skill: 'Cooking')
              ],
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defPadding),
              child: Text(
                'Knowledge',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            const KnowledgeWidget(
              text: 'Architecture, AutoCad',
            ),
            const KnowledgeWidget(
              text: 'Architecture, AutoCad',
            ),
            const KnowledgeWidget(
              text: 'Architecture, AutoCad',
            ),
            const Divider(),
            TextButton(
              onPressed: () {},
              child: FittedBox(
                child: Row(
                  children: [
                    Text(
                      'Download CV',
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color),
                    ),
                    const SizedBox(
                      width: defPadding / 2,
                    ),
                    const Icon(
                      Icons.download,
                      color: bodyTextColor,
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.link),
                ),
                const SizedBox(
                  width: defPadding / 2,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.publish),
                ),
                const SizedBox(
                  width: defPadding / 2,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.table_chart),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class KnowledgeWidget extends StatelessWidget {
  final String text;
  const KnowledgeWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defPadding / 2),
      child: Row(
        children: [
          const Icon(
            Icons.check,
            color: priColour,
          ),
          const SizedBox(
            width: defPadding / 2,
          ),
          Text(text)
        ],
      ),
    );
  }
}

class CodingSkills extends StatelessWidget {
  final double percentage;
  final String skill;
  const CodingSkills({
    Key? key,
    required this.percentage,
    required this.skill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defPadding),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: percentage),
        duration: defDuration,
        builder: (context, double value, child) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  skill,
                  style: const TextStyle(color: Colors.white),
                ),
                Text((value * 100).toInt().toString() + '%'),
              ],
            ),
            const SizedBox(
              height: defPadding,
            ),
            LinearProgressIndicator(
              value: value,
              color: priColour,
              backgroundColor: darkColor,
            ),
          ],
        ),
      ),
    );
  }
}

class SkillWidget extends StatelessWidget {
  final double percentage;
  final String skill;
  const SkillWidget({
    Key? key,
    required this.percentage,
    required this.skill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: percentage),
              duration: defDuration,
              builder: (context, double value, child) => Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: value,
                    color: priColour,
                    backgroundColor: darkColor,
                  ),
                  Center(
                    child: Text(
                      (value * 100).toInt().toString() + '%',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: defPadding / 2,
          ),
          Text(
            skill,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle2,
          )
        ],
      ),
    );
  }
}

class AvatarInfo extends StatelessWidget {
  const AvatarInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: darkColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(img1),
            ),
            const Spacer(),
            Text(
              'Crystal',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const Text(
              'Architect',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w200, height: 1.5),
            ),
            const Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
