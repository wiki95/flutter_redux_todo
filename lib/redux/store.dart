import 'package:frontEnd/model/app_state.dart';
import 'package:frontEnd/redux/reducers/index.dart';
import 'package:redux/redux.dart';

Future<Store<AppState>> createStore() async {
  return Store(
    appReducer,
    initialState: AppState.initial(),
  );
}
