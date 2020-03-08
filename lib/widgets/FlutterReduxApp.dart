import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import './MyDrawer.dart';

enum Actions { Increment, Decrement }

int counterReducer(int state, action) {
  switch (action) {
    case Actions.Increment:
      return state + 1;
      break;
    case Actions.Decrement:
      return state - 1;
      break;
    default:
  }

  return state;
}

class FlutterReduxApp extends StatelessWidget {
  final store = new Store(counterReducer, initialState: 0);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            title: Text("Redux & flutter_redux Package"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new StoreConnector<int, String>(
                  converter: (store) => store.state.toString(),
                  builder: (context, count) => new Text(
                    "Counter Value : $count",
                    style: TextStyle(fontSize: 30, letterSpacing: 2),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    StoreConnector<int, VoidCallback>(
                      converter: (store) =>
                          () => store.dispatch(Actions.Increment),
                      builder: (context, callback) => RaisedButton(
                        child: Text(
                          "Increment",
                          textScaleFactor: 1.3,
                        ),
                        color: Colors.grey[700],
                        onPressed: callback,
                      ),
                    ),
                    StoreConnector<int, VoidCallback>(
                      converter: (store) =>
                          () => store.dispatch(Actions.Decrement),
                      builder: (context, callback) => RaisedButton(
                        child: Text(
                          "Decrement",
                          textScaleFactor: 1.3,
                        ),
                        color: Colors.grey[700],
                        onPressed: callback,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
