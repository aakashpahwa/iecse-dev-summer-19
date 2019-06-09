import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  String s1="", s2=""; int n1=0,n2=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(child: Text('Calculator')),
        ),
        body: Center( child: Column(
            children: <Widget> [
              Container(
                  constraints:BoxConstraints.tight(Size(150, 150)) ,

                  child: Center(child: Card(
                    child: TextField(keyboardType: TextInputType.numberWithOptions(decimal: true,signed: true),keyboardAppearance: Brightness.light,
                      decoration:
                      InputDecoration.collapsed(hintText: 'Enter number 1'),onSubmitted: (String text) {
                      s1 = text;
                      n1= int.parse(s1);
                      },),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    color: Colors.white,))),

              Container(
                  constraints: BoxConstraints.tight(Size(150, 150)),

                  child: Center(child: Card(
                    child: TextField(keyboardType: TextInputType.numberWithOptions(decimal: true,signed: true),keyboardAppearance: Brightness.light,
                      decoration:
                      InputDecoration.collapsed(hintText: 'Enter number 2'),onSubmitted: (String text1) {
                        s2 = text1;
                        n2 = int.parse(s2);
                      },),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    color: Colors.white,))),


              RaisedButton(
                color: Colors.blue,
                child: Text('Calculate'),
                onPressed: () {
                  //Use`Navigator` widget to push the second screen to out stack of screens
                  Navigator.of(context)
                      .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                    return new SecondScreen(a: n1,b: n2);
                  }));
                },
              ),
            ]
        ),
        ));}
}

class SecondScreen extends StatefulWidget {
  final int a, b;

  SecondScreen({Key key, this.a, this.b}) : super(key: key);

  @override
  _SecondScreen createState() => new _SecondScreen();
}

class _SecondScreen extends State<SecondScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(child:
      Column(children: <Widget> [
        Container(child: Text((widget.a+widget.b).toString(),style: TextStyle(color: Colors.white),),color: Colors.blue,constraints: BoxConstraints.loose(Size(150, 150)),),
        Card(child: Text((widget.a-widget.b).toString(),style: TextStyle(color: Colors.white),),color: Colors.blue,),
        Card(child: Text((widget.a*widget.b).toString(),style: TextStyle(color: Colors.white),),color: Colors.blue,),
        Card(child: Text((widget.a/widget.b).toString(),style: TextStyle(color: Colors.white),),color: Colors.blue,),
        RaisedButton(color: Colors.blue,
          child: Text('Go back to Calculator'),
          onPressed: () {
            //Use`Navigator` widget to pop oir go back to previous route / screen

            Navigator.pop(context);
          },
        ),
      ],)
    ));
  }
}
