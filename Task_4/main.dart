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

class MyCustomFormState extends State<MyCustomForm> {
  final TextEditingController box1= new TextEditingController();
  final TextEditingController box2= new TextEditingController();
  double num1 = 0 , num2 =0,result=0;
  void addnumbers()
  {
    setState(() 
    {
      num1=double.parse(box1.text);
      num2 =double.parse(box2.text);
      result=num1+num2;
    }
    );
  }

  
  void subtractnumbers()
  {
    setState(() 
    {
      num1=double.parse(box1.text);
      num2 =double.parse(box2.text);
      result=num1-num2;
    }
    );
  }
  
  void multiplynumbers()
  {
    setState(() 
    {
      num1=double.parse(box1.text);
      num2 =double.parse(box2.text);
      result=num1*num2;
    }
    );
  }
  
  void dividenumbers()
  {
    setState(() 
    {
      num1=double.parse(box1.text);
      num2 =double.parse(box2.text);
      result=num1/num2;
    }
    );
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar(title: Text("Calculator")),
      body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                '$result',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                  fontFamily: 'Roboto',
                ),
              ),
              new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(),
              controller: box1,
            ),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(),
              controller: box2,
            ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.black,
                    color: Colors.blue,
                    onPressed: addnumbers,
                    child: new Text("add"),
                  ),
                  new RaisedButton(
                    onPressed: subtractnumbers,
                    textColor: Colors.black,
                    color: Colors.red,
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      "Subtract",
                    ),
                  ),
                  new RaisedButton(
                    onPressed: multiplynumbers,
                    textColor: Colors.black,
                    color: Colors.green,
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      "Multiply",
                    ),
                  ),
                  new RaisedButton(
                    onPressed: dividenumbers,
                    textColor: Colors.black,
                    color: Colors.yellow,
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      "Divide",
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
