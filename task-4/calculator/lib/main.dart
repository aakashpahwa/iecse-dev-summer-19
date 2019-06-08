import 'package:flutter/material.dart';

final firstInput = TextEditingController();
final secondInput = TextEditingController();
final answer= TextEditingController();
double _answer = 0;



class InputRow extends StatefulWidget {
  @override
  _InputRowState createState() => _InputRowState();
}

class _InputRowState extends State<InputRow> {
  // @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          child: TextField(
            keyboardType: TextInputType.numberWithOptions(),
            controller: firstInput,
          ),
        ),
        Container(
          width: 100,
          child: TextField(
            keyboardType: TextInputType.numberWithOptions(),
            controller: secondInput,
          ),
        )
      ],
    );
  }
}

class ButtonRow extends StatefulWidget {
  @override
  _ButtonRowState createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(onPressed: () => {
          _answer = double.parse(firstInput.text) + double.parse(secondInput.text),
          answer.text = _answer.toString() 
        }, child: Text("+")),
        RaisedButton(onPressed: () => {
          _answer = double.parse(firstInput.text) - double.parse(secondInput.text),
          answer.text = _answer.toString() 
        }, child: Text("−")),
        RaisedButton(onPressed: () => {
          _answer = double.parse(firstInput.text) * double.parse(secondInput.text),
          answer.text = _answer.toString() 
        }, child: Text("×")),
        RaisedButton(onPressed: () => {
          _answer = double.parse(firstInput.text) / double.parse(secondInput.text),
          answer.text = _answer.toString() 
        }, child: Text("÷"))
      ],
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              InputRow(),
              ButtonRow(),
              Container(
                child: TextField(
                  controller: answer,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
