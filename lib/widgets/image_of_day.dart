import '../Util/app_imports.dart';

class ImageOfDay extends StatelessWidget {
  const ImageOfDay({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    // ─────────────────────────────────────────────────────────────
    // نراقب HijriOffsetCubit: عند تغيّر الإزاحة نُعيد تحميل
    // المحتوى اليومي تلقائياً بالإزاحة الجديدة
    // ─────────────────────────────────────────────────────────────
    return BlocListener<HijriOffsetCubit, HijriOffsetState>(
      listenWhen: (previous, current) => previous.offset != current.offset,
      listener: (context, offsetState) {
        context
            .read<DailyContentCubit>()
            .loadDailyContent(hijriOffset: offsetState.offset);
      },
      child: BlocBuilder<DailyContentCubit, DailyContentState>(
        builder: (context, state) {
          final item = state.image;
          debugPrint('صورة اليوم في الويجت: ${item?.image}');

          if (item == null) {
            return InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                _showBottomSheet(context, '', 'noImage1.jpeg');
              },
              child: CardWidget(
                title: '',
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 600),
                  child: ClipRRect(
                    key: const ValueKey('assets/images/noImage1.jpeg'),
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/noImage1.jpeg',
                      bundle: DefaultAssetBundle.of(context),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: height * 0.3,
                    ),
                  ),
                ),
              ),
            );
          }

          return InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              _showBottomSheet(context, 'صورة اليوم', '${item.imageUrl}');
            },
            child: CardWidget(
              title: 'صورة اليوم',
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                child: ClipRRect(
                  key: ValueKey(item.imageUrl),
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    key: UniqueKey(),
                    item.imageUrl!,
                    fit: BoxFit.cover,
                    width: width,
                    height: height * 0.3,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return const SizedBox(
                        height: 200,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/noImage1.jpeg',
                        fit: BoxFit.cover,
                        height: height * 0.3,
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

void _showBottomSheet(BuildContext context, String title, String image) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).cardColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            image,
            fit: BoxFit.cover,
            width: double.infinity,
            errorBuilder: (_, __, ___) {
              return Image.asset(
                'assets/images/noImage1.jpeg',
                fit: BoxFit.cover,
                height: 200,
              );
            },
          ),
        ),
      );
    },
  );
}