import 'package:flutter/material.dart';
import 'package:halt/PermissionProvider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halt App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PermissionProvider>(
      create: (_) => PermissionProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Consumer<PermissionProvider>(
            builder: (BuildContext context, PermissionProvider provider,
                Widget child) {
              provider.checkPermission();
              return Container(
                child: Center(
                  child: provider.isPermissionGiven
                      ? Text("permission is given")
                      : Text('waiting for the location permission to be given'),
                ),
              );
            },
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
