import 'package:flutter/material.dart';

import 'MyHomePage.dart';

class AddItemWidget extends StatefulWidget {
  final ItemViewModel model;

  AddItemWidget(this.model);

  @override
  _AddItemWidgetState createState() => _AddItemWidgetState();
}

class _AddItemWidgetState extends State<AddItemWidget> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(hintText: "Add an item"),
      onSubmitted: (String s) {
        widget.model.onAddItem(s);
        controller.text = '';
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
