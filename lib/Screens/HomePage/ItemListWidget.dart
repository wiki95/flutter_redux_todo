import 'package:flutter/material.dart';
import 'package:frontEnd/Screens/HomePage/MyHomePage.dart';
import 'package:frontEnd/model/item.dart';

class ItemListWidget extends StatelessWidget {
  final ItemViewModel model;
  ItemListWidget(this.model);
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: model.items
            .map(
              (Item item) => ListTile(
                title: Text(item.body),
                leading: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => model.onRemoveItem(item),
                ),
              ),
            )
            .toList());
  }
}
