import '../Util/app_imports.dart';

class CustomPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  CustomPageRoute({required this.page})
      : super(
          transitionDuration: const Duration(milliseconds: 50),
          reverseTransitionDuration: const Duration(milliseconds: 50),
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.easeInExpo,
              ),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.05, 0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInExpo,
                )),
                child: child,
              ),
            );
          },
        );
}
