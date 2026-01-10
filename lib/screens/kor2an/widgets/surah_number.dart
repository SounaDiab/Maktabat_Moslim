import '../../../Util/app_imports.dart';

import '../core/index.dart';

class SurahNumber extends StatelessWidget {
  const SurahNumber({Key? key, required this.number}) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AppAsset.surahNumber,
          color: Theme.of(context).iconTheme.color,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Text(
            number.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).iconTheme.color,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}
