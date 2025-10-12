import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CacheManagerWidget {
  static const key = 'quranCache';
  static CacheManager instance = CacheManager(
    Config(
      key,
      stalePeriod: const Duration(days: 3650000),
      maxNrOfCacheObjects: 1000000000000,
    ),
  );
}
