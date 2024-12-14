import 'package:bek_task/src/app/favorite/controller/favorite_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteProvider = StateNotifierProvider<FavoriteNotifier, List<int>>((ref) {
  return FavoriteNotifier();
});