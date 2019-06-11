import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output = "0";
  String out = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String op = "";
  buttonPressed(String buttonText){
    if(buttonText == "CLEAR"){
      output = "0";
      out = "0";
      num1 = 0.0;
      num2 = 0.0;
      op = "";
    }
    else if(buttonText == "+" || buttonText == "X" || buttonText == "-" || buttonText == "/"){
      num1 = double.parse(output);
      op = buttonText;
      out = "0";
    }
    else if(buttonText == "."){
      if(out.contains(".")){
        print("Already contains a decimal");
        return;
      }
      else{
        out = out + buttonText;
      }
    }
    else if(buttonText == "="){
      num2 = double.parse(output);
      if(op == "+"){
        out = (num1 + num2).toString();
      }
      else if(op == "-"){
        out = (num1 - num2).toString();
      }
      else if(op == "X"){
        out = (num1 * num2).toString();
      }
      else if(op == "/"){
        out = (num1/num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      op = "";
    }
    else{
      out = out + buttonText;
    }
    setState(() {
      output = double.parse(out).toStringAsFixed(2);
    });
  }

  Widget BuildButton(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
        child: new Text(
          buttonText,
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(buttonText),
        padding: new EdgeInsets.all(30.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(
          child: new Column(
        children: <Widget>[
          new Container(
              alignment: Alignment.centerRight,
              padding: new EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: new Text(
                output,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              )),
          new Expanded(child: new Divider()),
          new Column(children: [
            new Row(children: [
              BuildButton("1"),
              BuildButton("2"),
              BuildButton("3"),
              BuildButton("+")
            ]),
            new Row(children: [
              BuildButton("4"),
              BuildButton("5"),
              BuildButton("6"),
              BuildButton("-")
            ]),
            new Row(children: [
              BuildButton("7"),
              BuildButton("8"),
              BuildButton("9"),
              BuildButton("/")
            ]),
            new Row(children: [
              BuildButton("."),
              BuildButton("0"),
              BuildButton("00"),
              BuildButton("X")
            ]),
            new Row(children: [
              BuildButton("CLEAR"),
              BuildButton("=")
            ],)
          ])
        ],
      )),
    );
  }
}
