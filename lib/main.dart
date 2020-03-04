import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider/Counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: ChangeNotifierProvider(
          create: (ctx) => Counter(), child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Provider"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                child: Consumer<Counter>(
                  builder: (context, count, child) {
                    return Text(count.counterVal.toString());
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    child: FlatButton(
                      child: Text('Increment'),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      onPressed: () {
                        Provider.of<Counter>(context, listen: false)
                            .increment();
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: FlatButton(
                      child: Text('Decrement'),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      onPressed: () {
                        Provider.of<Counter>(context, listen: false)
                            .decrement();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
