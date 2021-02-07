import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:frontEnd/redux/store.dart';
import 'package:redux/redux.dart';

import 'Screens/HomePage/MyHomePage.dart';
import 'SplashScreen.dart';
import 'model/app_state.dart';

void main() async {
  var store = await createStore();
  runApp(MyApp(store));
}

class MyApp extends StatefulWidget {
  final Store<AppState> store;

  MyApp(this.store);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: widget.store,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SplashScreen(),
          routes: <String, WidgetBuilder>{
            "/another": (BuildContext context) => MyHomePage()
          },
        ));
  }
}
