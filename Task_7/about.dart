import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  @override
  AboutPageState createState() {
    return AboutPageState();
  }
}

class AboutPageState extends State<AboutPage> {

  _launchURL() async {
  const url = 'https://www.iecsemanipal.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
  @override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            leading: Icon(Icons.info),
            backgroundColor: Colors.black,
            title: Text('About'),
          ),
       body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding
              (
                padding: EdgeInsets.all(40.0),
                child:  SizedBox(
                      height: 80.0,
                      child: Image.asset(
                        "assets/iecse.png",
                        fit: BoxFit.contain,
                      ),
                    ),
              ),
              Container(
              margin: EdgeInsets.all(12.0),
               decoration: BoxDecoration(
               boxShadow: [BoxShadow(
               color: Colors.white,
               blurRadius: 1.0,
              ),],
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.white70,
                ),
              child :Padding(
              padding: EdgeInsets.all(12.0),
              child: new Text(
                'Lorem ipsum dolor sit amet, tempus etiam eget. Elementum ut justo ut, ipsum temporibus integer non imperdiet mi in. Consectetuer cras felis at, morbi mi, aliquam hymenaeos aenean, et proin id proin, vestibulum lectus fermentum urna felis. Ac elementum, eget imperdiet vulputate phasellus, libero ipsum wisi. Nibh ridiculus tellus, a quam, et in fames. Vel tempor, aliquam gravida sed tempus facilisis, tortor id nunc, scelerisque metus eu nonummy gravida ullamcorper. Nulla nec ut, luctus lectus conubi Lorem ipsum dolor sit amet, tempus etiam eget. Elementum ut justo ut, ipsum temporibus integer non imperdiet mi in. Consectetuer cras felis at, morbi mi, aliquam hymenaeos aenean, et proin id proin, vestibulum lectus fermentum urna felis. Ac elementum, eget imperdiet vulputate phasellus, libero ipsum wisi. Nibh ridiculus tellus, a quam, et in fames. Vel tempor, aliquam gravida sed tempus facilisis, tortor id nunc, scelerisque metus eu nonummy gravida ullamcorper. Nulla nec ut, luctus lectus conubi',
                style: new TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 10.0,
                  fontFamily: 'Roboto',
                ),
              ),
              )),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.black,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                    onPressed: _launchURL,
                    child: new Text("FOR MORE INFO"),
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}