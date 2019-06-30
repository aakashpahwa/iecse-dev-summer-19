import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      debugShowCheckedModeBanner: false,
      home: MyEventPage(),
    );
  }
}

Future<List<Event>> getEvents() async {
  List<Event> events = [];
  Response response =
      await Dio().get('http://dennisj.pythonanywhere.com/getEvents');
  Map data = response.data;

  for (var item in data["events"]) {
    Event event =
        Event(item["name"], item["description"], item["type"], item["rating"]);

    events.add(event);
  }

  if (data != null) print(events);

  return events;
}

IconData assignIcon(String text) {
  if (text == 'code')
    return Icons.code;
  else if (text == 'dev')
    return Icons.build;
  else if (text == 'design')
    return Icons.brush;
  else
    return Icons.equalizer;
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

class MyEventPage extends StatefulWidget {
  @override
  _MyEventPageState createState() => _MyEventPageState();
}

class _MyEventPageState extends State<MyEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.event_note),
          title: Text('Events'),
        ),
        body: Container(
          child: FutureBuilder(
            future: getEvents(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else
                return Container(
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(5),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 7.0, right: 8.0, top: 10.0, bottom: 10.0),
                          child:ListTile(
                            leading:
                                Icon(assignIcon(snapshot.data[index].type)),
                            subtitle: Text(snapshot.data[index].description),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(snapshot.data[index].name,
                                      textAlign: TextAlign.left),
                                ),
                                IconTheme(
                                  data: IconThemeData(
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  child: StarDisplay(
                                      value: snapshot.data[index].rating),
                                )
                              ],
                            )),
                        )
                      );
                    },
                  ),
                );
            },
          ),
        ));
  }
}

class Event {
  String name;
  String description;
  String type;
  int rating;

  Event(this.name, this.description, this.type, this.rating);
}
