import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:convert';

void main() {
  runApp(MyApp(
  ));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

var x;

class StarDisplay extends StatelessWidget {
  final int value;
  StarDisplay({this.value = 0});
  @override
  Widget build(BuildContext context) {
    return Row (
      mainAxisSize: MainAxisSize.min,
      children: List.generate(value, (index) {
          return Icon(
          index < value ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}

class EventTile extends StatefulWidget {
  final int id;
  EventTile({this.id});
  @override
  createState() => EventTileState(this.id);
}

class EventTileState extends State<EventTile> {
  int id;
  bool fetched = false;
  var name;
  var description;
  var ratings;
  var icon;
  EventTileState(int id) {
    this.id = id;
    fetched = false;
    fetchData();
  }
  Future<void> fetchData() async {
    try {
      print(this.id);
      var dio =
          Dio(BaseOptions(contentType: ContentType.parse("application/json")));
      Map data = {"event_id": id};
      Response resp = await dio.post(
          "http://itsnitigya.pythonanywhere.com/getEventData",
          data: json.encode(data));
      Map received = await json.decode(resp.toString());
      if (!received.containsKey('winner'))
        print("None");
      else {
        setState(() {
          fetched = true;
          name = received['name'];
          description = received['s_description'];
          ratings = int.parse(received['ratings']);
          if(received['type']=='Dev')
          {
            icon = Icon(Icons.laptop_mac);
          }
          if(received['type']=='Code')
          {
            icon = Icon(Icons.code);
          }
          if(received['type']=='Design')
          {
            icon = Icon(Icons.edit);
          }
          if(received['type']=='Web')
          {
            icon = Icon(Icons.web);
          }
        });
      }
    } catch (e) {
      print(e);
      print("None");
    }
  }

  @override
  Widget build(BuildContext context) {
    return fetched == false
        ? CircularProgressIndicator()
        : Container(
            padding: EdgeInsets.all(12.0),
            margin: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 3.5, bottom: 3.5),
            decoration: BoxDecoration(
               boxShadow: [BoxShadow(
               color: Colors.grey,
            blurRadius: 1.0,
          ),],
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Colors.white,
            ),
            child: ListTile(
              leading: icon,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 7.0, right: 8.0, top: 2.0, bottom: 2.0),
                    child: Text('$name'),
                  )
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 2.0, right: 8.0, top: 2.0, bottom: 2.0),
                    child: IconTheme(
                      data: IconThemeData(
                        color: Colors.yellow,
                        size: 22,
                      ),
                      child: StarDisplay(value: ratings),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 7.0, right: 8.0, top: 2.0, bottom: 2.0),
                    child: Text('$description'),
                  )
                ],
              ),
            ),
          );
  }
}

//var result=' ';

class MyCustomFormState extends State<MyCustomForm> {
  //Map data;
  //int currentState;
  //List<String> items = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.purpleAccent,
            title: Text('Events'),
            leading: Icon(Icons.event),
          ),
          body: ListView(
            children: <Widget>[
              Container(
                child: EventTile(id: 1),
              ),
              Container(
                child: EventTile(id: 2),
              ),
              Container(
                child: EventTile(id: 3),
              ),
              Container(
                child: EventTile(id: 4),
              ),
            ],
          )),
    );
  }
}