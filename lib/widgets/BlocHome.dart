import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './MyDrawer.dart';
import '../bloc/counterBloc.dart';

class BlocHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text("Bloc Pattern(flutter_bloc & bloc)"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<CounterBloc, int>(
                builder: (BuildContext context, int state) {
                  return Text(
                    "Counter Value : $state",
                    style: TextStyle(fontSize: 30, letterSpacing: 2),
                  );
                },
              ),
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
                      BlocProvider.of<CounterBloc>(context)
                          .add(CounterEvents.increment);
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      "Decrement",
                      textScaleFactor: 1.3,
                    ),
                    color: Colors.blueGrey,
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add(CounterEvents.decrement);
                    },
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
