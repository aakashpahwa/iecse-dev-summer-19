import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactPage extends StatefulWidget {
  @override
  ContactPageState createState() {
    return ContactPageState();
  }
}

class ContactPageState extends State<ContactPage> {
TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
@override
Widget build(BuildContext context) {
  final nameField = TextField(
          obscureText: false,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "NAME",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
        );
    final emailField = TextField(
          obscureText: false,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "EMAIL",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
        );
    final phoneField = TextField(
          obscureText: false,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "PHONE",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
        );
    final messageField = TextField(
          obscureText: false,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "MESSAGE",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
        );
     final sendButton = Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.black,
          child: MaterialButton(
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () { },
            child: Text("Send",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        );
    return Scaffold(
       appBar: AppBar(
            leading: Icon(Icons.contacts),
            backgroundColor: Colors.black,
            title: Text('Contact'),
          ),
       body: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: new Container(              
                      width: 310.0,
                      child: nameField,
                    )
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: new Container(              
                      width: 310.0,
                      child: emailField,
                    )
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: new Container(              
                      width: 310.0,
                      child: phoneField,
                    )
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: new Container(              
                      width: 310.0,
                      child: messageField,
                    )
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    sendButton,
                  ],
                ),
              ),
            ),
          ),
    );
  }
}

