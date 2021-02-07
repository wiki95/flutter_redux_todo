import 'package:flutter/foundation.dart';

import 'item_state.dart';

@immutable
class AppState {
  final ItemState itemState;

  AppState({@required this.itemState});

  factory AppState.initial() {
    return AppState(itemState: ItemState.initial());
  }

  AppState copyWith({ItemState itemState}) {
    return AppState(itemState: itemState ?? this.itemState);
  }
}
