import '../../Util/app_imports.dart';


class DailyContentState extends Equatable {
  final DailyItem? wisdom;
  final DailyItem? image;
  final DailyItem? quran;

  const DailyContentState({
    this.wisdom,
    this.image,
    this.quran,
  });

  @override
  List<Object?> get props => [wisdom, image, quran];
}