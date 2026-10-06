import '../Util/app_imports.dart';

class WisdomOfDay extends StatelessWidget {
  const WisdomOfDay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyContentCubit, DailyContentState>(
      builder: (context, state) {
        final item = state.wisdom;

        if (item == null) {
          return InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              _showBottomSheet(context, 'حكمة اليوم', 'لا يوجد حكمة لليوم');
            },
            child: CardWidget(
              title: 'حكمة اليوم',
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                child: Text(
                  'لا يوجد حكمة لليوم',
                  key: ValueKey('لا يوجد حكمة لليوم'),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          );
        }

        return InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            _showBottomSheet(context, item.title, item.text);
          },
          child: CardWidget(
            title: item.title,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              child: Text(
                item.text,
                key: ValueKey(item.text),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
        );
      },
    );
  }
}

void _showBottomSheet(BuildContext context, String title, String text) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).cardColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
