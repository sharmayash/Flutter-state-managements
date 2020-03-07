import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './MyDrawer.dart';
import '../provider/Counter.dart';

class ProviderHome extends StatelessWidget {
  // For provider
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
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
