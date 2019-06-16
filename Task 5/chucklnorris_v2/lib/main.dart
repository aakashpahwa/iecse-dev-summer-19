import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.deepPurple,title: Center(child: Text('Chuck Norris API')),),
      body: Center(child: RaisedButton(onPressed: (){
        Navigator.of(context)
            .push(MaterialPageRoute<Null>(builder: (BuildContext context){return new GenerateJoke() ;}));
      },child: Text('Generate Random Joke',style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,),),
        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black,width: 2.0),borderRadius: BorderRadius.all(Radius.circular(10.0))),
        color: Colors.deepPurple,),),
    );
  }

}


class GenerateJoke extends StatefulWidget {
  @override
  _GenerateJokeState createState() => _GenerateJokeState();
}

class _GenerateJokeState extends State<GenerateJoke> {
  final Future<Post> post;

  _GenerateJokeState({Key key,this.post});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(backgroundColor: Colors.deepPurple,title: Text('         Chuck Norris API')),
        body: Center(child: FutureBuilder(
          future: Dio().get('http://api.icndb.com/jokes/random'),
          builder: (context,snapshot) {
            if (!snapshot.hasData)
              return CircularProgressIndicator();
            else {
              Response response = snapshot.data;
              Map dat = response.data;
              if (dat['type'] == 'success')
                return Card(color: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        side: BorderSide(color: Colors.black,
                            width: 2.0,
                            style: BorderStyle.solid)),
                    child: Text(dat['value']['joke'], style: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),));
            }
          },
        )
    ));
  }
}

Future<Post> fetchPost() async{
  final response = await http.get('http://api.icndb.com/jokes/random?');
  return Post.fromJson(json.decode(response.body));
}

class Post {
  String type;
  Value value;

  Post({this.type, this.value});

  factory Post.fromJson(Map<String, dynamic> parsedjson) {
    return Post(
      type: parsedjson['type'],
      value: Value.fromJson(parsedjson['value']),
    );
  }
}

class Value {
  double id;
  String joke;

  Value({
    this.id,
    this.joke
});

  factory Value.fromJson(Map<String, dynamic> json){
    return Value(
      id: json['id'],
      joke: json['joke']
    );
  }
}

