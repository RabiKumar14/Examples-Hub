import 'package:examples_hub/eCommerceApp2/themes/light_color.dart';
import 'package:examples_hub/eCommerceApp2/themes/theme.dart';
import 'package:examples_hub/eCommerceApp2/widgets/title_text.dart';
import 'package:examples_hub/eCommerceApp2/widgets/extentions.dart';
import '../../other_exports.dart';
import '../data_model.dart';

class ProductIcon extends StatelessWidget {
  // final String imagePath;
  // final String text;
  final ValueChanged<Category> onSelected;
  final Category model;
  const ProductIcon({Key? key, required this.model, required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Container(
        padding: AppTheme.hPadding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: model.isSelected ? LightColor.background : Colors.transparent,
          border: Border.all(
            color: model.isSelected ? LightColor.orange : LightColor.grey,
            width: model.isSelected ? 2 : 1,
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: model.isSelected ? const Color(0xfffbf2ef) : Colors.white,
              blurRadius: 10,
              spreadRadius: 5,
              offset: const Offset(5, 5),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Image.asset(model.image),
            TitleText(
              text: model.name,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            )
          ],
        ),
      ).ripple(
        () {
          onSelected(model);
        },
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
