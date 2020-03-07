import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc/counterBloc.dart';
import './provider/Counter.dart';

// import widgets
import './widgets/BlocHome.dart';
import './widgets/ProviderHome.dart';
import './widgets/MySetStateHome.dart';
import './widgets/VanillaBlocHome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter State Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      initialRoute: '/',
      routes: {
        '/': (ctx) => MySetStateHome(),
        '/provider': (ctx) => ChangeNotifierProvider(
            create: (ctx) => Counter(), child: ProviderHome()),
        '/bloc-package': (ctx) => BlocProvider(
              create: (BuildContext context) => CounterBloc(),
              child: BlocHome(),
            ),
        '/vanillaBloc': (ctx) => VanillaBlocHome()
      },
    );
  }
}
