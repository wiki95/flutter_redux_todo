import 'package:flutter/material.dart';
import 'package:frontEnd/Screens/HomePage/MyHomePage.dart';

class RemoveItemsButton extends StatelessWidget {
  final ItemViewModel model;

  RemoveItemsButton(this.model);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text('Delete All Items'),
        onPressed: () => model.onRemoveItems());
  }
}
