import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Chuck Norris Jokes'),
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
  List<String> jokes = [];
  _MyHomePageState() {
    _getJokes();
  }
  Future<void> _getJokes() async {
    for (var items = 1; items <= 200; items++) {
      try {
        Response resp = await Dio().get("http://api.icndb.com/jokes/random");
        Map dat = resp.data;

        if (dat['type'] == 'success') {
          setState(() {
            jokes.add(dat['value']['joke']);
          });
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: jokes.length,
          itemBuilder: (context, index) {
            return new Card(
                color: Colors.lightBlueAccent,
                child: new ListTile(
                  leading: Text('${index + 1}.', style: TextStyle(color: Colors.white),),
                  title: Text('${jokes[index]}', style: TextStyle(color: Colors.white)),
                ),
                );
          }),
    );
  }
}
