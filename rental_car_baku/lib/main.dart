// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
void main() => runApp(MyApp());
const styleOfText = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Rental Car Baku';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.black, Colors.black87])),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: false,
            pinned: true,
            snap: false,
            backgroundColor: Colors.transparent,
            expandedHeight: 350.0,
            iconTheme: new IconThemeData(color: Colors.orangeAccent),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              centerTitle: true,
              background: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 40.0),
                      padding: EdgeInsets.only(left: 32.0, right: 32.0),
                      child: Text(
                        'Rental',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.josefinSans(
                            fontSize: 70.0, color: Colors.orangeAccent),
                      )),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/homesilverappcar.png'),
                        Container(
                          margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                          child: Text(
                            "Car",
                            style: GoogleFonts.josefinSans(
                                fontSize: 50.0, color: Colors.orangeAccent),
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                      padding: EdgeInsets.only(left: 32.0, right: 32.0),
                      child: Text(
                        'Baku',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.josefinSans(
                            fontSize:70.0, color: Colors.orangeAccent),
                      )),
                  SizedBox(
                    height: 40.0,
                  ),

                ]
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) => listItem(
                    theIndex: index,
                  ))),
        ],
      ),
    );
  }
}

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Search"),
    );
  }
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Profile"),
    );
  }
}

int _selectedIndex = 0;

class willRoute extends StatefulWidget {
  @override
  _willRouteState createState() => _willRouteState();
}

class _willRouteState extends State<willRoute> {
  @override
  Widget build(BuildContext context) {
    if (_selectedIndex == 0) {
      return Home();
    } else if (_selectedIndex == 1) {
      return Search();
    } else if (_selectedIndex == 2) {
      return Profile();
    }
  }
}

class listItem extends StatefulWidget {
  final int theIndex;
  listItem({Key key, @required this.theIndex}) : super(key: key);
  @override
  _listItemState createState() => _listItemState();
}

class _listItemState extends State<listItem> {
  @override
  Widget build(BuildContext context) {
    if(widget.theIndex%2==0){
      return Column(
        children: <Widget>[
          SizedBox(
            height: 100.0,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                  decoration: BoxDecoration(
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        bottomLeft: const Radius.circular(20.0),
                      ),
                      color: Colors.white10
                  ),
                  width: 300.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child:Image(width: 100,image: NetworkImage("https://cdn.iconscout.com/icon/free/png-512/bmw-5-202750.png"),) ,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[

                                  Text("BMW M4",style: GoogleFonts.josefinSans(fontSize: 30.0,color: Colors.orangeAccent,fontWeight: FontWeight.bold),),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text("100 AZN",style: GoogleFonts.josefinSans(color:Colors.white,fontWeight: FontWeight.w700),),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      
                      
                      SizedBox(
                        height: 20.0,
                      ),
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(math.pi),
                        child: Container(
                          child: Image.asset('assets/images/homesilverappcar.png',width: 500, fit:BoxFit.cover  ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }else{
      return Column(
        children: <Widget>[
          SizedBox(
            height: 100.0,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
                  decoration: BoxDecoration(
                      borderRadius: new BorderRadius.only(
                        topRight: const Radius.circular(20.0),
                        bottomRight: const Radius.circular(20.0),
                      ),
                      color: Colors.white10
                  ),
                  width: 300.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            child:Image(width: 100,image: NetworkImage("https://cdn.iconscout.com/icon/free/png-512/bmw-5-202750.png"),) ,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[

                                  Text("BMW M4",style: GoogleFonts.josefinSans(fontSize: 30.0,color: Colors.orangeAccent,fontWeight: FontWeight.bold),),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text("100 AZN",style: GoogleFonts.josefinSans(color:Colors.white,fontWeight: FontWeight.w700),),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),


                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        child: Image.asset('assets/images/homesilverappcar.png',width: 500, fit:BoxFit.cover  ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }

  }
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: willRoute(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.orangeAccent,
            ),
            title: Text(
              '',
              style: styleOfText,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.orangeAccent,
            ),
            title: Text(
              '',
              style: styleOfText,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.orangeAccent,
            ),
            title: Text(
              '',
              style: styleOfText,
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
