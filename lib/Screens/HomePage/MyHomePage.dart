import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:frontEnd/model/app_state.dart';
import 'package:frontEnd/model/item.dart';
import 'package:frontEnd/redux/actions.dart';
import 'package:redux/redux.dart';

import 'AddItemWidget.dart';
import 'ItemListWidget.dart';
import 'RemoveItemsButton.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: StoreConnector<AppState, ItemViewModel>(
        converter: (Store<AppState> store) => ItemViewModel.create(store),
        builder: (BuildContext context, ItemViewModel viewModel) => Column(
          children: [
            AddItemWidget(viewModel),
            Expanded(
              child: ItemListWidget(viewModel),
            ),
            RemoveItemsButton(viewModel),
          ],
        ),
      ),
    );
  }
}

class ItemViewModel {
  final List<Item> items;
  final Function(String) onAddItem;
  final Function(Item) onRemoveItem;
  final Function() onRemoveItems;

  ItemViewModel(
      {this.items, this.onAddItem, this.onRemoveItem, this.onRemoveItems});

  factory ItemViewModel.create(Store<AppState> store) {
    _onAddItem(String body) {
      store.dispatch(AddItemAction(body));
    }

    _onRemoveItem(Item item) {
      store.dispatch(RemoveItemAction(item));
    }

    _onRemoveItems() {
      store.dispatch(RemoveItemsAction());
    }

    return ItemViewModel(
        items: store.state.itemState.items,
        onAddItem: _onAddItem,
        onRemoveItem: _onRemoveItem,
        onRemoveItems: _onRemoveItems);
  }
}
