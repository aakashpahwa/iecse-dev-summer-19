import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'events.dart';
import 'login.dart';
import 'about.dart';
import 'contact.dart';
import 'schedule.dart';



void main() {
  runApp(MyApp(
  ));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}

class StarDisplay extends StatelessWidget {
  final int value;
  StarDisplay({this.value = 0});
  @override
  Widget build(BuildContext context) {
    return Row (
      mainAxisSize: MainAxisSize.min,
      children: List.generate(value, (index) {
          return Icon(
          index < value ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}

class MyHome extends StatefulWidget {
  final String email;
  MyHome({this.email});
  @override
  MyHomeState createState() => new MyHomeState(this.email);
}

class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
 TabController controller;
 String email;
 MyHomeState(String email)
 {
     email = this.email;
 }

  @override
  void initState() {
    super.initState();

    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: SizedBox(
                      height: 50.0,
                      child: Image.asset(
                        "assets/prom.jpg",
                        fit: BoxFit.contain,
                      ),
                    ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
               GestureDetector(
            onTap: () {
              setState(() { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyCustomForm()),
            ); });
            },
            child:  Container(
            padding: EdgeInsets.all(12.0),
            margin: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 3.5, bottom: 3.5),
            decoration: BoxDecoration(
               boxShadow: [BoxShadow(
               color: Colors.grey,
            blurRadius: 1.0,
          ),],
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              color: Colors.white,
            ),
            child: ListTile(
              leading: Icon(Icons.home),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 7.0, right: 8.0, top: 2.0, bottom: 2.0),
                    child: Text('Home',
                     style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  fontFamily: 'Roboto',
                ),),
                  )
                ],
              ),
            ),
          ),
        ),
           GestureDetector(
            onTap: () {
              setState(() { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SchedulePage()),
            ); });
            },
            child:  Container(
            padding: EdgeInsets.all(12.0),
            margin: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 3.5, bottom: 3.5),
            decoration: BoxDecoration(
               boxShadow: [BoxShadow(
               color: Colors.grey,
            blurRadius: 1.0,
          ),],
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              color: Colors.white,
            ),
            child: ListTile(
              leading: Icon(Icons.calendar_today),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 7.0, right: 8.0, top: 2.0, bottom: 2.0),
                    child: Text('Schedules',style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  fontFamily: 'Roboto',
                ),),
                  )
                ],
              ),
            ),
          ),
        ),
           GestureDetector(
            onTap: () {
              setState(() { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactPage()),
            ); });
            },
            child:  Container(
            padding: EdgeInsets.all(12.0),
            margin: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 3.5, bottom: 3.5),
            decoration: BoxDecoration(
               boxShadow: [BoxShadow(
               color: Colors.grey,
            blurRadius: 1.0,
          ),],
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              color: Colors.white,
            ),
            child: ListTile(
              leading: Icon(Icons.contacts),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 7.0, right: 8.0, top: 2.0, bottom: 2.0),
                    child: Text('Contact Us',style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  fontFamily: 'Roboto',
                ),),
                  )
                ],
              ),
            ),
          ),
        ),
           GestureDetector(
            onTap: () {
              setState(() { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutPage()),
            ); });
            },
            child:  Container(
            padding: EdgeInsets.all(12.0),
            margin: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 3.5, bottom: 3.5),
            decoration: BoxDecoration(
               boxShadow: [BoxShadow(
               color: Colors.grey,
            blurRadius: 1.0,
          ),],
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              color: Colors.white,
            ),
            child: ListTile(
              leading: Icon(Icons.info_outline),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 7.0, right: 8.0, top: 2.0, bottom: 2.0),
                    child: Text('About Us',style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  fontFamily: 'Roboto',
                ),),
                  )
                ],
              ),
            ),
          ),
        ),
            ],
          ),
        ),
      body: new TabBarView(
        children: <Widget>[
          new MyCustomForm(),
          new SchedulePage(),
          new ContactPage(),
          new AboutPage(),
        ],
        controller: controller,
      ),
      bottomNavigationBar: new Material(
        shadowColor: Colors.white,
        color: Colors.black,
        child: new TabBar(
          tabs: <Tab>[
            new Tab(
              icon: new Icon(
                Icons.home,
                size: 25.0,
              ),
            ),
            new Tab(
              icon: new Icon(
                Icons.calendar_today,
                size: 25.0,
              ),
            ),
            new Tab(
              icon: new Icon(
                Icons.contacts,
                size: 25.0,
              ),
            ),
            new Tab(
              icon: new Icon(
                Icons.info,
                size: 25.0,
              ),
            ),
          ],
          controller: controller,
        ),
      ),
    );
  }
}