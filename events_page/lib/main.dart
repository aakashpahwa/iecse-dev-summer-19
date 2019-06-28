import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_star_rating/smooth_star_rating.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}


class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final Future<Details> post;

  _LandingPageState({Key key,this.post});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(actions: <Widget>[
          IconButton(onPressed: null,icon: Icon(Icons.event,color: Colors.white,),),
        ],backgroundColor: Colors.deepPurple,title: Text('         Event Details')),
        body: ListView(scrollDirection: Axis.vertical,children: <Widget>[
          Card(color: Colors.deepPurple,margin: EdgeInsets.all(10.0),child: FutureBuilder(
          future: Dio().get('http://ChakshuSaraswat.pythonanywhere.com/getEvents'),
          builder: (context,snapshot) {
            if (!snapshot.hasData)
              return CircularProgressIndicator();
            else {
              Response response = snapshot.data;
              Map dat = response.data;
               return Row(children: <Widget>[
                 IconButton(onPressed: null,icon: Icon(Icons.settings_ethernet,color: Colors.white,size: 40,),),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
                    Card(color: Colors.deepPurple,
                      child: Text(dat['1']['name'], style: TextStyle(
                       color: Colors.white, fontStyle: FontStyle.italic),textAlign: TextAlign.left,),),
                    SmoothStarRating(
                      allowHalfRating: false,
                      starCount: 5,
                      rating: double.parse(dat['1']['rating']),
                      color: Colors.white,
                    ),
                    Card(color: Colors.deepPurple,
                        child: Text(dat['1']['short_description'], style: TextStyle(
                         color: Colors.white, fontStyle: FontStyle.italic),))],),
               ],);

            }
          },
        )
        ),
          Card(color: Colors.deepPurple,margin: EdgeInsets.all(10.0),child: FutureBuilder(
            future: Dio().get('http://ChakshuSaraswat.pythonanywhere.com/getEvents'),
            builder: (context,snapshot) {
              if (!snapshot.hasData)
                return CircularProgressIndicator();
              else {
                Response response = snapshot.data;
                Map dat = response.data;
                return Row(children: <Widget>[
                  IconButton(onPressed: null,icon: Icon(Icons.settings_ethernet,color: Colors.white,size: 40,),),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
                    Card(color: Colors.deepPurple,
                      child: Text(dat['2']['name'], style: TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic),textAlign: TextAlign.left,),),
                    SmoothStarRating(
                      allowHalfRating: false,
                      starCount: 5,
                      rating: double.parse(dat['2']['rating']),
                      color: Colors.white,
                    ),
                    Card(color: Colors.deepPurple,
                        child: Text(dat['2']['short_description'], style: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),))],),
                ],);

              }
            },
          )
          )
        ],));
  }
}

Future<Details> fetchDetails() async{
  final response = await http.get('http://ChakshuSaraswat.pythonanywhere.com/getEvents');
  return Details.fromJson(json.decode(response.body));
}

class Details{
  Event event1;
  Event event2;
  Event event3;
  Event event4;
  Event event5;

  Details({this.event1,this.event2,this.event3,this.event4,this.event5});

  factory Details.fromJson(Map<String, dynamic> parsedJson){
    return Details(
      event1: Event.fromJson(parsedJson['property'])
    );
  }
}

class Event{
  String name;
  String short_description;
  String long_description;
  String reviews;
  int rating;
  String status;

  Event({
    this.status,this.short_description,this.reviews,this.rating,this.name,this.long_description
  });

  factory Event.fromJson(Map<String, dynamic> json){
    return Event(
      name: json['name'],
      short_description: json['short_description'],
      long_description: json['long_description'],
      reviews: json['reviews'],
      rating: json['rating'],
      status: json['status']
    );
  }
}