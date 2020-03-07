import 'package:flutter/material.dart';
import './MyDrawer.dart';
import '../vanillaBloc/counterEvents.dart';
import '../vanillaBloc/vanillaCounterBloc.dart';

class VanillaBlocHome extends StatelessWidget {
  final _bloc = VanillaCounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text("Vanilla Bloc Pattern"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder(
                  stream: _bloc.counter,
                  initialData: 0,
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    return Text(
                      "Counter Value : ${snapshot.data}",
                      style: TextStyle(fontSize: 30, letterSpacing: 2),
                    );
                  }),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text(
                      "Increment",
                      textScaleFactor: 1.3,
                    ),
                    color: Colors.blueGrey,
                    onPressed: () {
                      _bloc.counterEventSink.add(IncrementEvent());
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      "Decrement",
                      textScaleFactor: 1.3,
                    ),
                    color: Colors.blueGrey,
                    onPressed: () {
                      _bloc.counterEventSink.add(DecrementEvent());
                    },
                  ),
                ],
              )
            ],
          ),
        ));
  }

  void dispose() {
    _bloc.dispose();
  }
}
