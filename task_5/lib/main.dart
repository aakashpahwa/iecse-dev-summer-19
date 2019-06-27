import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(Dioapp());

class Dioapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Diofunc()));
  }
}

class Diofunc extends StatefulWidget {
  @override
  DiofuncState createState() => DiofuncState();
}

String cat = "";
String joke = "";

class DiofuncState extends State<Diofunc> {
  Map data;
  List<String> items = [];
  DiofuncState() {
    fetchDioData();
    randomjokes();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                              return new GestureDetector( 
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>RandomJokes()) ),
              child: new Card( 
                child: new Column(
                  children: <Widget>[
                    new Padding(padding: new EdgeInsets.all(3.0)),
                    new Text('$index:${items[index]}',
                      style: new TextStyle(fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),),
            );
                }
              )
          )
      );
  }
  Widget build2(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Container(
            child: Text('$joke')
          )
        )
    );
  }

  Future<dynamic> fetchDioData() async //catergory wise
  {
    try {
      Response response =
          await Dio().get("https://api.chucknorris.io/jokes/categories");
      List dat = response.data;
      //String json='cat:$data';
      print(dat);
      for (var i in dat) {
        setState(() {
          items.add(i);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> randomjokes() async {
    try {
      Response response =
          await Dio().get("https://api.chucknorris.io/jokes/random");
      Map dat = response.data;
      setState(() {
        joke = dat["value"];
      });
    } catch (e) {
      print(e);
    }

  }
}
class RandomJokes extends StatelessWidget
{
  RandomJokes()
  {
    randomjokes();
  }
  @override
    Widget build(BuildContext context) 
    {
    return Scaffold(appBar: AppBar(title: Text('DeadAf'),),body: (Container(child: Text('$joke'))));
  }

  Future<dynamic> randomjokes() async {
    try {
      Response response =
          await Dio().get("https://api.chucknorris.io/jokes/random");
      Map dat = response.data;
      joke = dat["value"];
      }
    catch (e) {
      print(e);
    }

  }
}