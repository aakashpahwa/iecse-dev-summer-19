import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(Dioapp());

class Dioapp extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(home: Scaffold(body: Diofunc()));
  }
}

class Diofunc extends StatefulWidget 
{
  @override
  DiofuncState createState() => DiofuncState();
}

class DiofuncState extends State<Diofunc> {
  List data;
  Map dat;
  DiofuncState() 
  {
    events();
  }
  @override
Widget task1(BuildContext context, int index)
  {
      return Container(
        child:GestureDetector(child:
        Card(
        child: ListTile(
          leading: Icon(icon(data[index]["type"])),
          title: Column(children:<Widget>[Container(child:Text('${data[index]["name"]}')),star(data[index]["rating"])]),
          subtitle: Text('${data[index]["sdesc"]}')
                    
        )
      ),
      onTap: ()=> Navigator.push(context,MaterialPageRoute(builder:(context)=>Info(data[index]["ldesc"],data[index]["name"]))),
      )
    );
  }
  Widget star(String val)
  {
    double value=double.parse(val);
    return Row(
      children: List.generate(5, (index){
        return Icon(index<value?Icons.star:Icons.star_border);
      }
    ),
    );
  }
  IconData icon(String type)
  {
    if (type == 'code') {
      return Icons.code;
    } else if (type == 'puzzle') {
      return Icons.extension;
    } else if (type == 'design') {
      return Icons.border_color;
    } else {
      return Icons.navigate_next;
    }
  }
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
              child: Center(
                    child: Column(
                      children: <Widget>[task1(context,0),task1(context,1),task1(context,2),task1(context,3),],
                    ),
                )
              )
            )
          );
  }
  Future<dynamic> events() async //catergory wise
  {
    try 
    {
      Response response =
          await Dio().get("https://DaHardik.pythonanywhere.com/");
      dat = response.data;
      setState(()
      {
        data=dat["events"];
      });
      print('1:${data[0]["ldesc"]},\nLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
      }
       catch (e) {
      print(e);
    }
  }
}
class Info extends StatelessWidget
{
  String datainfo,title;
  Info(String dat,String tit)
  {
    datainfo=dat;
    title=tit;
  }
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold (body: Container(
        child: Text('$datainfo')
      ),
      appBar: AppBar(title: Text('$title')),
    )
  );
  }
}