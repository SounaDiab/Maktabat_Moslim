import '../../Util/app_imports.dart';

class ContainerScrollview extends StatelessWidget {
  final Widget widget;
  ContainerScrollview({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
          top: 10,
          right: 10,
          left: 10,
          bottom: 10,
        ),
        alignment: Alignment.topRight,
        child: widget,
      ),
    );
  }
}
