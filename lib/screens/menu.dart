import 'package:flutter/material.dart';
import 'package:merchzie/widgets/left_drawer.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Home Page"),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: const LeftDrawer(),
      
      body: Center(
        child: Text("Hello, World!"),
      ),
    );
  }
}
