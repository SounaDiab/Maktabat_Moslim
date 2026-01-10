import '../../Util/app_imports.dart';

class BlocBuilderSalatLail extends StatelessWidget {
  final String? text;
  final double fontSize;
  final double fontSizeTablet;

  BlocBuilderSalatLail({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontSizeTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return BlocBuilder<SalatLailCubit, SalatLailState>(
        builder: (context, state) {
      if (state is SalatLailLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is SalatLailLoaded) {
        final albakiyatAlsalihat = state.items;
        String content = '';
        String twoContent = '';
        String threeContent = '';
        String fourContent = '';
        String oneTitle = '';
        String twoTitle = '';
        String threeTitle = '';
        String fourTitle = '';
        for (var item in albakiyatAlsalihat) {
            if (item.title == text) {
              //! Content 4
              content = item.content ?? '';
              twoContent = item.twoContent ?? '';
              threeContent = item.threeContent ?? '';
              fourContent = item.fourContent ?? '';

              //! Titles 4
              oneTitle = item.subtitle ?? '';
              twoTitle = item.twoSubtitle ?? '';
              threeTitle = item.threeSubtitle ?? '';
              fourTitle = item.fourSubtitle ?? '';
              break;
          }
        }

        return ContainerScrollview(
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SelectableText(
                  'بسم الله الرحمن الرحيم',
                  style: TextStyle(
                    fontSize: isTablet ? fontSizeTablet + 10 : fontSize,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'UthmanicHafs',
                  ),
                ),
              ),
              Center(
                child: SelectableText(
                  'اللهم صلِّ على محمد وآل محمد',
                  style: TextStyle(
                    fontSize: isTablet ? fontSizeTablet + 10 : fontSize,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'UthmanicHafs',
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: oneTitle != '' ? oneTitle : '',
                  subtitle: content,
                  weight: FontWeight.w600,
                  size: isTablet ? fontSizeTablet : fontSize,
                ),
              ),
              twoContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twoTitle != '' ? twoTitle : '',
                        subtitle: twoContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              threeContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: threeTitle != '' ? threeTitle : '',
                        subtitle: threeContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              fourContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: fourTitle != '' ? fourTitle : '',
                        subtitle: fourContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        );
      } else if (state is SalatLailError) {
        return Center(
          child: SelectableText(state.message),
        );
      }
      return const SizedBox();
    });
  }
}
