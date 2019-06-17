import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chuck Norris Jokes',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chuck Norris Jokes'),
        ),
        body: HomePage()
      ),
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:RaisedButton(
        child: Text("Get a joke!"),
        onPressed: () {Navigator.push(
          context,MaterialPageRoute(builder: (context)=>JokePage()),
        );
       }
      )
    );
  }
}
class JokePage extends StatefulWidget {
  @override
  _JokePageState createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joke',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Joke'),
        ),
        body: Column(
      children: <Widget>[
        FutureBuilder(
          future: Dio().get("http://api.icndb.com/jokes/random"),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return CircularProgressIndicator();
            else if (snapshot.hasError)
              return Text('Error');
            else {
              Response response = snapshot.data;
              Map dat = response.data;
              if (dat['type'] == 'success') {
                return Center(
                    child: Padding(
                  child: Text(dat['value']['joke']),
                  padding: EdgeInsets.all(25.0),
                ));
              } else {
                return Text('Error');
              }
            }
          },
        ),
        RaisedButton(
          child: Text("Back"),
          onPressed: (){Navigator.pop(context);},
        )
      ],
    )
      ),
    );
  }
 
}


