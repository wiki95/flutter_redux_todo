import 'package:frontEnd/model/app_state.dart';

import 'itemReducer.dart';

AppState appReducer(AppState state, dynamic action) =>
    new AppState(itemState: itemReducer(state.itemState, action));
