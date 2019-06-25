import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class StarDisplay extends StatelessWidget {
  final int value;

  const StarDisplay({Key key, this.value = 0})
      : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Events>> _getEvents() async {
    var dio = Dio();
    Response dat = await dio.get("http://jeetmehta.pythonanywhere.com/");
    Map data = json.decode(dat.toString());

    if (data != null) {
      print("data received");
    }
    List<Events> events = [];
    for (var items in data['events']) {
      Events event = Events(items["name"], items["type"], items["sdesc"],
          items["ldesc"], int.parse(items["rating"]));
      events.add(event);
    }
    return events;
  }

  IconData addicon(String text) {
    if (text == 'code') {
      return Icons.code;
    } else if (text == 'puzzle') {
      return Icons.extension;
    } else if (text == 'design') {
      return Icons.border_color;
    } else {
      return Icons.navigate_next;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.calendar_today),
          title: Text("Events"),
        ),
        body: Container(
            child: FutureBuilder(
          future: _getEvents(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return new Card(
                        child: new ListTile(
                      leading: Icon(addicon(snapshot.data[index].type)),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Container(
                            child: Text(snapshot.data[index].name,
                                textAlign: TextAlign.left),
                          ),
                          IconTheme(
                            data: IconThemeData(
                              color: Colors.amber,
                              size: 24,
                            ),
                            child:
                                StarDisplay(value: snapshot.data[index].rating),
                          ),
                        ],
                      ),
                      subtitle: Text(snapshot.data[index].sdesc),
                    ));
                  });
            }
          },
        )));
  }
}

class Events {
  final String name;
  final String type;
  final String sdesc;
  final String ldesc;
  final int rating;

  Events(this.name, this.type, this.sdesc, this.ldesc, this.rating);
}
