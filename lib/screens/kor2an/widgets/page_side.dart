import '../../../Util/app_imports.dart';

import '../core/index.dart';

class PageSide extends StatelessWidget {
  const PageSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quran = Provider.of<Quran>(context);

    return Column(
      children: [
        SvgPicture.asset(
          quran.isRightPage ? AppAsset.pageRight : AppAsset.pageLeft,
          color: Theme.of(context).iconTheme.color,
        ),
        Text(
          quran.hizbText,
          style: TextStyle(
            color: Theme.of(context).textTheme.labelMedium?.color,
          ),
        ),
      ],
    );
  }
}
