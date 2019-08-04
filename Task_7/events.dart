import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:convert';
import 'main.dart';
import 'login.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:progress_indicators/progress_indicators.dart';


String formatHHMMSS(int seconds) {
  int hours = (seconds / 3600).truncate();
  seconds = (seconds % 3600).truncate();
  int minutes = (seconds / 60).truncate();

  String hoursStr = (hours).toString().padLeft(2, '0');
  String minutesStr = (minutes).toString().padLeft(2, '0');
  String secondsStr = (seconds % 60).toString().padLeft(2, '0');

  if (hours == 0) {
    return "$minutesStr:$secondsStr";
  }

  return "$hoursStr:$minutesStr:$secondsStr";
}

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({
    Key key,
    int secondsRemaining,
    this.countDownTimerStyle,
    this.whenTimeExpires,
    this.countDownFormatter,
  })  : secondsRemaining = secondsRemaining,
        super(key: key);

  final int secondsRemaining;
  final Function whenTimeExpires;
  final Function countDownFormatter;
  final TextStyle countDownTimerStyle;

  State createState() => new _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Duration duration;

  String get timerDisplayString {
    Duration duration = _controller.duration * _controller.value;
    return widget.countDownFormatter != null
        ? widget.countDownFormatter(duration.inSeconds)
        : formatHHMMSS(duration.inSeconds);
      // In case user doesn't provide formatter use the default one
     // for that create a method which will be called formatHHMMSS or whatever you like
  }


  void initState() {
    super.initState();
    duration = new Duration(seconds: widget.secondsRemaining);
    _controller = new AnimationController(
      vsync: this,
      duration: duration,
    );
    _controller.reverse(from: widget.secondsRemaining.toDouble());
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed || status == AnimationStatus.dismissed) {
        widget.whenTimeExpires();
      }
    });
  }

  void didUpdateWidget(CountDownTimer oldWidget) {
    if (widget.secondsRemaining != oldWidget.secondsRemaining) {
      setState(() {
        duration = new Duration(seconds: widget.secondsRemaining);
        _controller.dispose();
        _controller = new AnimationController(
          vsync: this,
          duration: duration,
        );
        _controller.reverse(from: widget.secondsRemaining.toDouble());
        _controller.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            widget.whenTimeExpires();
          } else if (status == AnimationStatus.dismissed) {
            print("Animation Complete");
          }
        });
      });
    }
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: AnimatedBuilder(
            animation: _controller,
            builder: (_, Widget child) {
              return Text(
                timerDisplayString,
                style: widget.countDownTimerStyle,
              );
            }));
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}


class MyCustomFormState extends State<MyCustomForm> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: Icon(Icons.dashboard),
            backgroundColor: Colors.black,
            title: Center(child: Text("Home"),),
            actions: <Widget>[
              IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () { Navigator.pop( context,MaterialPageRoute(builder: (context) => LoginPage()), ); },
            ),
          ],
          ),
          body: ListView(
            children: <Widget>[
              Container(
                child: EventTile(id: 1),
              ),
              Container(
                child: EventTile(id: 2),
              ),
              Container(
                child: EventTile(id: 3),
              ),
              Container(
                child: EventTile(id: 4),
              ),
            ],
          )),
    );
  }
}

class ImageTile extends StatefulWidget {
  ImageTile();
  @override
  createState() => ImageTileState();
}


class ImageTileState extends State<ImageTile> {

  final List<Widget> items = [
    Padding(
                padding :EdgeInsets.all(8.0),
                child: Container(
                decoration: BoxDecoration(
               boxShadow: [BoxShadow(
               color: Colors.black,
                blurRadius: 5.0,
              ),],
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.white,
                ),
                child: SizedBox(
                      height: 200.0,
                      child: Image.asset(
                        "assets/6.jpg",
                        fit: BoxFit.contain,
                      ),
                    ),
              ),
    ),
    Padding(
                padding :EdgeInsets.all(8.0),
                child: Container(
                decoration: BoxDecoration(
               boxShadow: [BoxShadow(
               color: Colors.black,
                blurRadius: 5.0,
              ),],
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.white,
                ),
                child: SizedBox(
                      height: 200.0,
                      child: Image.asset(
                        "assets/2.jpg",
                        fit: BoxFit.contain,
                      ),
                    ),
              ),
    ),
    Padding(
                padding :EdgeInsets.all(8.0),
                child: Container(
                decoration: BoxDecoration(
               boxShadow: [BoxShadow(
               color: Colors.black,
                blurRadius: 5.0,
              ),],
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.white,
                ),
                child: SizedBox(
                      height: 200.0,
                      child: Image.asset(
                        "assets/3.jpg",
                        fit: BoxFit.contain,
                      ),
                    ),
              ),
    ),
    Padding(
                padding :EdgeInsets.all(8.0),
                child: Container(
                decoration: BoxDecoration(
               boxShadow: [BoxShadow(
               color: Colors.black,
                blurRadius: 5.0,
              ),],
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.white,
                ),
                child: SizedBox(
                      height: 200.0,
                      child: Image.asset(
                        "assets/4.jpg",
                        fit: BoxFit.contain,
                      ),
                    ),
              ),
    ),
    Padding(
                padding :EdgeInsets.all(8.0),
                child: Container(
                decoration: BoxDecoration(
               boxShadow: [BoxShadow(
               color: Colors.black,
                blurRadius: 5.0,
              ),],
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.white,
                ),
                child: SizedBox(
                      height: 200.0,
                      child: Image.asset(
                        "assets/5.jpg",
                        fit: BoxFit.contain,
                      ),
                    ),
              ),
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
      children: [
        CarouselSlider(
          items: items,
          height: 400,
          aspectRatio: 16/9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 2),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          pauseAutoPlayOnTouch: Duration(seconds: 10),
          enlargeCenterPage: true,
          //onPageChanged: ,
          scrollDirection: Axis.vertical,
 )
      ]
    ),
    floatingActionButton: FloatingActionButton.extended(
      backgroundColor: Colors.black,
      elevation: 4.0,
      label: Container(
       width: 60.0,
       padding: EdgeInsets.only(top: 3.0, right: 4.0),
         child: CountDownTimer(
           secondsRemaining: 3242,
           whenTimeExpires: () {
              setState(() {
                // = true;
              });
            },
            countDownTimerStyle: TextStyle(
                color: Colors.redAccent,
                fontSize: 17.0,
                height: 1.2),
          ),
        ),
      onPressed: () {},
    ),
    floatingActionButtonLocation: 
      FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomAppBar(
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.timer),
            onPressed: () {},
          ),
        ],
      ),
    ),
    );
  }
}

class LeaderTile extends StatefulWidget {
  LeaderTile();
  @override
  createState() => LeaderTileState();
}

class LeaderTileState extends State<LeaderTile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
               color: Colors.grey,
            blurRadius: 5.0,
          ),],
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Colors.white,
            ),
            child: ListTile(
              trailing:Text('6120',
                      style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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
                        "assets/india.jpg",
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
                        left: 3.0, right: 25.0, top: 2.0, bottom: 2.0),
                    child: Text('Aakash',style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      ),
                      ),
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
               color: Colors.grey,
            blurRadius: 5.0,
          ),],
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Colors.white,
            ),
            child: ListTile(
              trailing:Text('5868',
                      style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 13.0,
                      fontFamily: 'Roboto',
                      ),
                      ),
              leading: Padding( 
                      padding:  EdgeInsets.only(
                        left: 8.0, right: 7.0, top: 2.0, bottom: 2.0),
                      child:SizedBox(
                      height: 23.0,
                      child: Image.asset(
                        "assets/usa.png",
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
                        left: 3.0, right: 25.0, top: 2.0, bottom: 2.0),
                    child: Text('Ram',style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      ),
                      ),
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
               color: Colors.grey,
            blurRadius: 5.0,
          ),],
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Colors.white,
            ),
            child: ListTile(
              trailing:Text('5671',
                      style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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
                        "assets/india.jpg",
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
                        left: 3.0, right: 25.0, top: 2.0, bottom: 2.0),
                    child: Text('Sparsh',style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      ),
                      ),
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
               color: Colors.grey,
            blurRadius: 5.0,
          ),],
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Colors.white,
            ),
            child: ListTile(
              trailing:Text('5134',
                      style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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
                        "assets/china.png",
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
                        left: 3.0, right: 25.0, top: 2.0, bottom: 2.0),
                    child: Text('Arav',style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      ),
                      ),
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
               color: Colors.grey,
            blurRadius: 5.0,
          ),],
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Colors.white,
            ),
            child: ListTile(
              trailing:Text('4878',
                      style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 13.0,
                      fontFamily: 'Roboto',
                      ),
                      ),
              leading: Padding( 
                      padding:  EdgeInsets.only(
                        left: 8.0, right: 7.0, top: 2.0, bottom: 2.0),
                      child:SizedBox(
                      height: 25.0,
                      child: Image.asset(
                        "assets/england.png",
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
                        left: 3.0, right: 25.0, top: 2.0, bottom: 2.0),
                    child: Text('Abhishek',style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      ),
                      ),
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
               color: Colors.grey,
            blurRadius: 5.0,
          ),],
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Colors.white,
            ),
            child: ListTile(
              trailing:Text('4200',
                      style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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
                        "assets/india.jpg",
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
                        left: 3.0, right: 25.0, top: 2.0, bottom: 2.0),
                    child: Text('Nitigya',style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      ),
                      ),
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


class DescriptionPage extends StatefulWidget {
  final int id;
  DescriptionPage({this.id});
  @override
  createState() => DescriptionPageState(this.id);
}

class DescriptionPageState extends State<DescriptionPage> {
  int id;
  bool fetched = false;
  var winner_1,winner_2,winner_3;
  var description;
  var announcemnets;
  var icon;
  var title;
  var img;
  DescriptionPageState(int id) {
    this.id = id;
    fetched = false;
    fetchData();
  }
  Future<void> fetchData() async {
    try {
      var dio =
          Dio(BaseOptions(contentType: ContentType.parse("application/json")));
      Map data = {"event_id": id};
      Response resp = await dio.post(
          "http://itsnitigya.pythonanywhere.com/getEventData",
          data: json.encode(data));
      Map received = await json.decode(resp.toString());
      if (!received.containsKey('success'))
        print("None");
      else {
        setState(() {
          fetched = true;
          title = received['name'];
          winner_1 =received['winner_1'];
          winner_2 =received['winner_2'];
          winner_3 =received['winner_3'];
          announcemnets =received['announcements'];
          description =received['l_description'];
          if(received['type']=='Dev')
          {
            icon = Icon(Icons.laptop_mac);
            img = 'assets/cicada.png';
          }
          if(received['type']=='Code')
          {
            icon = Icon(Icons.code);
            img = 'assets/gambit.png';
          }
          if(received['type']=='Design')
          {
            icon = Icon(Icons.edit);
            img = 'assets/negativespace.png'; 
          }
          if(received['type']=='Web')
          {
            icon = Icon(Icons.web);
            img = 'assets/mr.png';
          }
        });
      }
    } catch (e) {
      print(e);
      print("None");
    }
  }
  @override
  Widget build(BuildContext context) {
    return fetched == false
        ?  GlowingProgressIndicator(
  child: Icon(Icons.code),
)
        : MaterialApp(
          debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0), // here the desired height
          child: AppBar(
            backgroundColor: Colors.black,
           bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.image)),
                Tab(icon: Icon(Icons.people)),
              ],
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Image.asset('$img',
                  fit: BoxFit.contain,
                  height: 50,
              ),
            ],
          ),
          )
        ),
          body: TabBarView(
            children: [
              ImageTile(),
              LeaderTile(),
            ],
          ),
        ),
      ),
    );
  }
}

class EventTile extends StatefulWidget {
  final int id;
  EventTile({this.id});
  @override
  createState() => EventTileState(this.id);
}

class EventTileState extends State<EventTile> {
  int id;
  bool fetched = false;
  var name;
  var description;
  var ratings;
  var icon;
  EventTileState(int id) {
    this.id = id;
    fetched = false;
    fetchData();
  }
  Future<void> fetchData() async {
    try {
      var dio =
          Dio(BaseOptions(contentType: ContentType.parse("application/json")));
      Map data = {"event_id": id};
      Response resp = await dio.post(
          "http://itsnitigya.pythonanywhere.com/getEventData",
          data: json.encode(data));
      Map received = await json.decode(resp.toString());
      if (!received.containsKey('success'))
        print("None");
      else {
        setState(() {
          fetched = true;
          name = received['name'];
          description = received['s_description'];
          ratings = int.parse(received['ratings']);
          if(received['type']=='Dev')
          {
            icon = Icon(Icons.laptop_mac);
          }
          if(received['type']=='Code')
          {
            icon = Icon(Icons.code);
          }
          if(received['type']=='Design')
          {
            icon = Icon(Icons.edit);
          }
          if(received['type']=='Web')
          {
            icon = Icon(Icons.web);
          }
        });
      }
    } catch (e) {
      print(e);
      print("None");
    }
  }

  @override
  Widget build(BuildContext context) {
    return fetched == false
        ? GlowingProgressIndicator(
  child: Icon(Icons.code),
)
        : 
        GestureDetector(
  onTap: () {
    setState(() { Navigator.push(context, MaterialPageRoute(builder: (context) => DescriptionPage(id: id,)),
  ); });
  },
  child: Container(
            padding: EdgeInsets.all(12.0),
            margin: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 3.5, bottom: 3.5),
            decoration: BoxDecoration(
               boxShadow: [BoxShadow(
               color: Colors.grey,
            blurRadius: 1.0,
          ),],
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Colors.white,
            ),
            child: ListTile(
              leading: icon,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 7.0, right: 8.0, top: 2.0, bottom: 2.0),
                    child: Text('$name'),
                  )
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 7.0, right: 8.0, top: 2.0, bottom: 2.0),
                    child: Text('$description'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 2.0, right: 8.0, top: 2.0, bottom: 2.0),
                    child: IconTheme(
                      data: IconThemeData(
                        color: Colors.yellow,
                        size: 22,
                      ),
                      child: StarDisplay(value: ratings),
                    ),
                  ),
                ],
              ),
            ),
          ), 
);
  }
}