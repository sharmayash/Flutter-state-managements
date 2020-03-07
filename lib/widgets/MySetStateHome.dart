import 'package:flutter/material.dart';

import './MyDrawer.dart';

class MySetStateHome extends StatefulWidget {
  @override
  _MySetStateHomeState createState() => _MySetStateHomeState();
}

class _MySetStateHomeState extends State<MySetStateHome> {
  int _counter = 0;

  void setIncrement() {
    setState(() {
      _counter++;
    });
  }

  void setDecrement() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Set State Home"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Counter Value : ${_counter.toString()}",
            style: TextStyle(fontSize: 30, letterSpacing: 2),
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
                onPressed: () => setIncrement(),
              ),
              RaisedButton(
                child: Text(
                  "Decrement",
                  textScaleFactor: 1.3,
                ),
                color: Colors.blueGrey,
                onPressed: () => setDecrement(),
              ),
            ],
          )
        ],
      )),
    );
  }
}
