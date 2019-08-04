import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';


class LoginPage extends StatefulWidget {
      @override
      LoginPageState createState() => LoginPageState();
    }

 class LoginPageState extends State<LoginPage> {
      final TextEditingController box1= new TextEditingController();
      final TextEditingController box2= new TextEditingController();
      TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

      String generateMd5(String input) {
        return md5.convert(utf8.encode(input)).toString();
      }
      @override
      Widget build(BuildContext context) {

        final emailField = TextField(
          obscureText: false,
          style: style,
          controller: box1,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Email",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12.0))),
        );
        final passwordField = TextField(
          obscureText: true,
          style: style,
          textAlign: TextAlign.center,
          controller: box2,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Password",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12.0))),
        );
        final loginButon = Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.black,
          child: MaterialButton(
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () 
            { if(generateMd5(box2.text) == '8b7b7dea625a99aa21858b4ffce4ba94')
            {
              Navigator.push( context,MaterialPageRoute(builder: (context) => MyHome(email: box1.text,)), );
            }
            else
            {
              final snackBar = SnackBar(
            content: Text('Email / Password Wrong'),
            action: SnackBarAction(
              label: 'Try Again',
              onPressed: () {
              },
            ),
          );
          Scaffold.of(context).showSnackBar(snackBar);
            }
            },
            child: Text("Login",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        );

        return Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child:SizedBox(
                      height: 100.0,
                      child: Image.asset(
                        "assets/iecse2.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    ),
                    Container(
                      child:SizedBox(
                            height: 50.0,
                            child: Text("LOGIN",style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  fontFamily: 'Roboto',
                ),),
                          ),
                    ),
                    SizedBox(height: 45.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }