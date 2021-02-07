import 'item.dart';

class ItemState {
  final List<Item> items;

  ItemState({this.items});

  ItemState copyWith({List<Item> items}) {
    return ItemState(items: items ?? this.items);
  }

  factory ItemState.initial() {
    return ItemState(items: List.unmodifiable(<Item>[]));
  }
}
