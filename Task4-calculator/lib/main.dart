import 'package:flutter/material.dart';

void main() => runApp(CalcItDead());

class CalcItDead extends StatefulWidget 
{
  @override
  State createState() =>  new CalcItDeadState();
}


class CalcItDeadState extends State<CalcItDead>
{
  var a,b,ans="🖖";
  final TextEditingController box1= new TextEditingController(text:"0");
  final TextEditingController box2= new TextEditingController(text:"0");

  void Addition()
  {
    setState(() 
    {
      a=int.parse(box1.text);
      b=int.parse(box2.text);
      ans=a+b;
    }
    );
  }

  
  void Subtraction()
  {
    setState(() 
    {
      a=int.parse(box1.text);
      b=int.parse(box2.text);
      ans=a-b;
    }
    );
  }
  
  void Multiplication()
  {
    setState(() 
    {
      a=int.parse(box1.text);
      b=int.parse(box2.text);
      ans=a*b;
    }
    );
  }
  
  void Division()
  {
    setState(() 
    {
      a=int.parse(box1.text);
      b=int.parse(box2.text);
      ans=a+b;
    }
    );
  }
  
  void Clear()
  {
    setState(() 
    {
      a="0";
      b="0";
    }
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: new AppBar(title: Text("May The Force Be With You")),
      body: new Container
      (
        padding: EdgeInsets.all(40.00),
        child: new Column
        (
          children: <Widget>[
            new Text(
              "Result: $ans",
              style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple),
            ),
             new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(hintText: "Enter Number 1"),
              controller: box1,
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(hintText: "Enter Number 2"),
              controller: box2,
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("+"),
                  color: Colors.greenAccent,
                  onPressed: Addition,
                ),
                new MaterialButton(
                  child: new Text("-"),
                  color: Colors.greenAccent,
                  onPressed: Subtraction,
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("X"),
                  color: Colors.greenAccent,
                  onPressed: Multiplication,
                ),
                new MaterialButton(
                  child: new Text("/"),
                  color: Colors.greenAccent,
                  onPressed: Division,
                ),
              ],
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("Clear"),
                  color: Colors.greenAccent,
                  onPressed: Clear,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}