import 'package:bek_task/src/common/constant/storage_helper.dart';
import 'package:bek_task/src/utils/storage_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class FavoriteNotifier extends StateNotifier<List<int>> {
  FavoriteNotifier() : super([]) {
    _loadFavorites();
  }

  // Load favorites
  Future<void> _loadFavorites() async {
    final favoriteIds = StorageUtil.getListString(StorageHelper.favorites).map(int.parse).toList() ?? [];
    state = favoriteIds;
  }

  // Add favorites
  Future<void> addFavorite(int id) async {
    if (!state.contains(id)) {
      state = [...state, id];
      await _saveFavorites();
    }
  }

  // Remove favorites
  Future<void> removeFavorite(int id) async {
    if (state.contains(id)) {
      state = state.where((favId) => favId != id).toList();
      await _saveFavorites();
    }
  }

  // Save favorites
  Future<void> _saveFavorites() async {
    await StorageUtil.putListString('favorites', state.map((id) => id.toString()).toList());
  }
}