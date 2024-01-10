import 'package:flutter_cache_manager/flutter_cache_manager.dart';

final appCacheManager = CacheManager(
  Config(
    'customCacheKey',
    stalePeriod: const Duration(days: 10),
    maxNrOfCacheObjects: 100,
  ),
);