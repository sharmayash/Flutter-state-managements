import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  Widget buildListTile(String title, Function tapHandler) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 20, letterSpacing: 2),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.center,
            child: Text(
              "Flutter State Managements",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
                letterSpacing: 2.5,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile("Set State", () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile("Provider", () {
            Navigator.of(context).pushReplacementNamed('/provider');
          }),
          buildListTile("Bloc from Scratch", () {
            Navigator.of(context).pushReplacementNamed('/vanillaBloc');
          }),
          buildListTile("Bloc and flutter_bloc Packages", () {
            Navigator.of(context).pushReplacementNamed('/bloc-package');
          }),
        ],
      ),
    );
  }
}
