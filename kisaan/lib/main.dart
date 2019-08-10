import 'package:flutter/material.dart';
import 'package:kisaan/homepage.dart';
import 'package:kisaan/pages/dataentry.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kisaan',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        accentColor: Colors.cyan,
        primaryColor: Colors.blue
      ),
      routes: {
          '/': (BuildContext context) =>DataEntry(),
          // ScopedModelDescendant(
          //       builder: (BuildContext context, Widget child, MainModel model) {
          //         return _model.user == null
          //             ? AuthPage()
          //             : ProductsPage(_model);
          //       },
          //     ),
          // '/admin': (BuildContext context) =>,
        },
    );
  }
}
