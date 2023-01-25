// ignore_for_file: constant_identifier_names

import 'package:pace_assignment/data/network/error_handler.dart';
import 'package:pace_assignment/data/responses/responses.dart';

const CACHE_NEWS_KEY = "CACHE_HOME_KEY";
const CACHE_NEWS_INTERVAL = 60 * 1000;

abstract class LocalDataStorage {
  Future<HomeResponce> getNews();
  Future<void> saveNewsToCache(HomeResponce homeResponce);
  void clearCache();
  void removeFromCache(String key);
}

class LocalDataStorageImplementer extends LocalDataStorage {
  Map<String, CachedItem> cacheMap = Map();

  @override
  Future<HomeResponce> getNews() async {
    CachedItem? cachedItem = cacheMap[CACHE_NEWS_KEY];

    if (cachedItem != null && cachedItem.isValid(CACHE_NEWS_INTERVAL)) {
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<void> saveNewsToCache(HomeResponce homeResponce) async {
    cacheMap[CACHE_NEWS_KEY] = CachedItem(homeResponce);
  }

  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }
}

class CachedItem {
  dynamic data;
  int cacheTime = DateTime.now().microsecondsSinceEpoch;
  CachedItem(this.data);
}

extension CachedItemExtension on CachedItem {
  bool isValid(int expTime) {
    int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch;
    bool isCacheValid = currentTimeInMillis - expTime < cacheTime;
    return isCacheValid;
  }
}
