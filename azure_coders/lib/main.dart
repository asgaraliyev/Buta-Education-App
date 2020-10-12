import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'AS-RENT-A-CAR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Message {
  final String email;
  final String firstname;
  final String lastname;
  final String amessage;
  final String phone;
  Message(this.email, this.firstname, this.lastname, this.amessage, this.phone);
}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {});
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text('Mesajlar'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_car_wash),
            title: Text('Icarə istəkləri'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: MessagesWidget(
        indexofpage: _selectedIndex,
      ),
    );
  }
}

class MessagesWidget extends StatefulWidget {
  int indexofpage;
  MessagesWidget({Key key, @required this.indexofpage}) : super(key: key);
  @override
  _MessagesWidgetState createState() => _MessagesWidgetState();
}
class myResponse {
  String dateresponse;
  String fullnameresponse;
  String mailresponse;
  String phoneresponse;
  int caridresponse;
  int totalPriceresponse;
  String pickdateresponse;
  String dropdateresponse;
  myResponse(this.dateresponse, this.fullnameresponse, this.mailresponse, this.phoneresponse, this.caridresponse, this.totalPriceresponse, this.pickdateresponse, this.dropdateresponse);
}

class _MessagesWidgetState extends State<MessagesWidget> {
  String basicAuthenticationHeader(String username, String password) {
    return 'Basic ' + base64Encode(utf8.encode('$username:$password'));
  }

  Future<List<Message>> getData() async {
    http.Response response = await http.get(
        'http://asrentacar.herokuapp.com/messages',
        headers: <String, String>{
          'authorization': basicAuthenticationHeader('username', 'password'),
          "Accept": "application/json"
        });
    List data = [];
    data = json.decode(response.body);
    List<Message> messages = [];
    for (var u in data) {
      Message message = Message(
          u['email'], u['firstname'], u['lastname'], u['message'], u['phone']);
      print(message);
      messages.add(message);
    }
    print(messages.length);
    return messages;
  }



  Future<List<myResponse>> getresponses() async {
    http.Response response = await http.get(
        'https://asrentacar.herokuapp.com/responses',
        headers: <String, String>{
          'authorization': basicAuthenticationHeader('username', 'password'),
          "Accept": "application/json"
        });
    List data = [];
    data = json.decode(response.body);
    print(data);
    List<myResponse> responseList = [];
    for (var a in data) {
      myResponse ares=myResponse(a['date'], a['fullname'],  a['mail'],  a['phone'], a['carid'],  a['totalPrice'],  a['pickdate'],  a['dropdate']);
      responseList.add(ares);
      print(ares);
    }


    return responseList;

  }

  @override
  Widget build(BuildContext context) {
    _launchURL(String url) async {
      String url1 = url;
      print(url);
      if (await canLaunch(url1)) {
        await launch(url1);
      } else {
        throw 'Could not launch $url1';
      }
    }
    if (widget.indexofpage == 0) {
      return Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          child: FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.amberAccent,
                        child: ListTile(
                          title: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    " ${snapshot.data[index].firstname} ${snapshot.data[index].lastname}",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Telefon: ${snapshot.data[index].phone}",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Mail: ${snapshot.data[index].email}",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Mesaj: ${snapshot.data[index].amessage}",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: RaisedButton(
                                    onPressed: (){
                                      launch("tel:${snapshot.data[index].phone}");
                                    },
                                    child: Text("Zəng et:${snapshot.data[index].phone} "),
                                  ),
                                ),
                                Container(
                                  child: RaisedButton(
                                    onPressed: (){
                                      launch("https://wa.me/${snapshot.data[index].phone}");
                                    },
                                    child: Text("Whatsappda cavab yaz:${snapshot.data[index].phone} "),
                                  ),
                                ),
                                Container(
                                  child: RaisedButton(
                                    onPressed: (){
                                      launch("mailto:${snapshot.data[index].email}");
                                    },
                                    child: Text("Maildə cavab yaz:${snapshot.data[index].email} "),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
            },
          ),
        ),
      );
    } else {
      return Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          child: FutureBuilder(
            future: getresponses(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.amberAccent,
                        child: ListTile(
                          title: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    " ${snapshot.data[index].fullnameresponse} ",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Mail: ${snapshot.data[index].mailresponse}",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Götürülmə: ${snapshot.data[index].pickdateresponse}",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Təslim etmə: ${snapshot.data[index].dropdateresponse}",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Qiymət: ${snapshot.data[index].totalPriceresponse} manat",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "İstək tarixi: ${snapshot.data[index].dateresponse}",
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: RaisedButton(
                                    onPressed: (){
                                      _launchURL('https://asrentacar.herokuapp.com/car/${snapshot.data[index].caridresponse}');
                                    },
                                    child: Text("Maşını göstər"),
                                  ),
                                ),
                                Container(
                                  child: RaisedButton(
                                    onPressed: (){
                                      launch("tel:${snapshot.data[index].phoneresponse}");
                                    },
                                    child: Text("Zəng et:${snapshot.data[index].phoneresponse} "),
                                  ),
                                ),
                                Container(
                                  child: RaisedButton(
                                    onPressed: (){
                                      launch("https://wa.me/${snapshot.data[index].phoneresponse}");
                                    },
                                    child: Text("Whatsappda cavab yaz:${snapshot.data[index].phoneresponse} "),
                                  ),
                                ),
                                Container(
                                  child: RaisedButton(
                                    onPressed: (){
                                      launch("mailto:${snapshot.data[index].mailresponse}");
                                    },
                                    child: Text("Maildə cavab yaz:${snapshot.data[index].mailresponse} "),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
            },
          ),
        ),
      );
    }
  }
}
