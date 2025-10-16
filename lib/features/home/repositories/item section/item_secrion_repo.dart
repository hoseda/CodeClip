import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snippet_code/features/home/model/menu_item_model.dart';

final selectedMenuItemStateProvider = StateProvider<ItemModel>((ref) {
  return ItemModel.all;
});

final isMenuItemSeleted = Provider.family<bool, ItemModel>((ref, item) {
  final repo = ref.watch(selectedMenuItemStateProvider);
  if (repo == item) {
    return true;
  }
  return false;
});
