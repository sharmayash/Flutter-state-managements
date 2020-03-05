import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './provider/Counter.dart';
import './bloc/counterBloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: ChangeNotifierProvider(
          create: (ctx) => Counter(), child: MyHomePage()),
      // home: BlocProvider(
      //   create: (BuildContext context) => CounterBloc(),
      //   child: BlocHome(),
      // ),
    );
  }
}

class BlocHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

class MyHomePage extends StatelessWidget {
  // For provider
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Provider Package"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<Counter>(
                builder: (context, count, child) {
                  return Text(
                    "Counter Value : ${count.counterVal.toString()}",
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
                      Provider.of<Counter>(context, listen: false).increment();
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      "Decrement",
                      textScaleFactor: 1.3,
                    ),
                    color: Colors.blueGrey,
                    onPressed: () {
                      Provider.of<Counter>(context, listen: false).decrement();
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
