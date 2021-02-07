import 'package:frontEnd/model/item.dart';
import 'package:frontEnd/model/item_state.dart';
import 'package:frontEnd/redux/actions.dart';
import 'package:redux/redux.dart';

final itemReducer = combineReducers<ItemState>([
  TypedReducer<ItemState, AddItemAction>(_addItem),
  TypedReducer<ItemState, RemoveItemAction>(_removeItem),
  TypedReducer<ItemState, RemoveItemsAction>(_removeItems),
]);

ItemState _addItem(ItemState state, AddItemAction action) {
  return state.copyWith(
      items: []
        ..addAll(state.items)
        ..add(Item(id: action.id, body: action.body)));
}

ItemState _removeItem(ItemState state, RemoveItemAction action) {
  return state.copyWith(
      items: List.unmodifiable(List.from(state.items)..remove(action.item)));
}

ItemState _removeItems(ItemState state, RemoveItemsAction action) {
  return state.copyWith(items: []);
}
