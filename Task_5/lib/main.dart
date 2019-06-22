import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dio/dio.dart';

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
var result=' ';

class MyCustomFormState extends State<MyCustomForm> {
  Map data;
  int currentState;
  List<String> items = [];
  MyCustomFormState(){
    fetchData();
  }
  Future<void> fetchData() async {
  for(var i=1;i<100;i++)
  {
    try {
      Response response = await Dio().get("http://api.icndb.com/jokes/random");
      Map dat = response.data;
      if( dat['type'] == 'success' ){
        setState(() {
           items.add(dat['value']['joke']);  
        });
      }
    } catch (e) {
      print(e);
    }
  }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          backgroundColor: Color(0xFF151026),
          title: Center(child: Text('Chuck Norris Jokes')),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('$index. ${items[index]}'),
            );
          },
        ),
      ),
    );
  }
}
