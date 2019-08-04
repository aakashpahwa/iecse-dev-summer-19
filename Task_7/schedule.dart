import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class SchedulePage extends StatefulWidget {
      @override
      SchedulePageState createState() => SchedulePageState();
    }

 class SchedulePageState extends State<SchedulePage> {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            leading: Icon(Icons.calendar_today),
            backgroundColor: Colors.black,
            title: Text('Schedules'),
          ),
        backgroundColor: Colors.white,
          body: 
            ListView(
            children: <Widget>[
          Container(
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.only(
                left: 8.0, right: 8.0, top: 5, bottom: 5),
            decoration: BoxDecoration(
               boxShadow: [BoxShadow(
               color: Colors.white,
            blurRadius: 1.0,
          ),],
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Colors.black,
            ),
            child: ListTile(
              trailing:Text('6 PM',
                      style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 13.0,
                      fontFamily: 'Roboto',
                      ),
                      ),
              leading: Padding( 
                      padding:  EdgeInsets.only(
                        left: 8.0, right: 7.0, top: 2.0, bottom: 2.0),
                      child:SizedBox(
                      height: 30.0,
                      child: Image.asset(
                        "assets/gambit.png",
                        fit: BoxFit.contain,
                      ),
                    ), 
                    ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 33.0, right: 25.0, top: 2.0, bottom: 2.0),
                    child: Text('Gambit',style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      ),
                      ),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 25.0, top: 2.0, bottom: 2.0),
                    child: Text('17th July',style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 25.0, top: 2.0, bottom: 2.0),
                    child: Text('NLH',style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      ),),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.only(
                left: 8.0, right: 8.0, top: 5, bottom: 5),
            decoration: BoxDecoration(
               boxShadow: [BoxShadow(
               color: Colors.black,
            blurRadius: 1.0,
          ),],
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Colors.black,
            ),
            child: ListTile(
              trailing:  Text('8 PM',
                      style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0,
                      color :Colors.white,
                      fontFamily: 'Roboto',
                      ),
                      ),
              leading: SizedBox(
                      height: 250.0,
                      child: Image.asset(
                        "assets/negativespace.png",
                        fit: BoxFit.contain,
                      ),
                    ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 7.0, right: 8.0, top: 2.0, bottom: 2.0),
                    child: Text('Negative Space',
                    style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      ),),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 7.0, right: 8.0, top: 2.0, bottom: 2.0),
                    child: Text('17th July',
                    style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 7.0, right: 8.0, top: 2.0, bottom: 2.0),
                    child: Text('NLH',style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      ),),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.only(
                left: 8.0, right: 8.0, top: 5, bottom: 5),
            decoration: BoxDecoration(
               boxShadow: [BoxShadow(
               color: Colors.white,
            blurRadius: 1.0,
          ),],
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Colors.black,
            ),
            child: ListTile(
              leading: SizedBox(
                      height: 350.0,
                      child: Image.asset(
                        "assets/cicada.png",
                        fit: BoxFit.contain,
                      ),
                    ),
               trailing:  Text('6 PM',
                      style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0,
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      ),
                      ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 7.0, right: 8.0, top: 2.0, bottom: 2.0),
                    child: Text('Cicada',
                    style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      ),),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 7.0, right: 8.0, top: 2.0, bottom: 2.0),
                    child: Text('18th July'
                    ,style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 7.0, right: 8.0, top: 2.0, bottom: 2.0),
                    child: Text('NLH',
                    style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      ),),
                  ),
                ],
              ),
            ),
          ),
           Container(
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.only(
                left: 8.0, right: 8.0, top: 5, bottom: 5),
            decoration: BoxDecoration(
               boxShadow: [BoxShadow(
               color: Colors.white,
            blurRadius: 1.0,
          ),],
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Colors.black,
            ),
            child: ListTile(
              leading: SizedBox(
                      height: 250.0,
                      child: Image.asset(
                        "assets/mr.png",
                        fit: BoxFit.contain,
                      ),
                    ),
              trailing:  Text('8 PM',
                      style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0,
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      ),
                      ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 7.0, right: 8.0, top: 2.0, bottom: 2.0),
                    child: Text('Mystery Rooms',
                    style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      ),),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 7.0, right: 8.0, top: 2.0, bottom: 2.0),
                    child: Text('18th July',
                    style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 7.0, right: 8.0, top: 2.0, bottom: 2.0),
                    child: Text('NLH',
                    style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      ),),
                  ),
                ],
              ),
            ),
          ),
            ],
          )
        );
      }
    }