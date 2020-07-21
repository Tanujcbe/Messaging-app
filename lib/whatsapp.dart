import 'package:flutter/material.dart';
import 'package:async/async.dart';

class WhatsApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WhatsAppPage(),
      theme: new ThemeData(
        // backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}

class WhatsAppPage extends StatefulWidget{
  @override
    // TODO: implement createState
    State createState() => new WhatsAppPageState();
}


class WhatsAppPageState extends State<WhatsAppPage> with SingleTickerProviderStateMixin{
  TabController _tabControler;
  @override
  void initState(){
    super.initState();
    _tabControler=new TabController(vsync: this,initialIndex: 1,length: 4);
  }
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.teal[900],
        elevation: 0.7,
        title: Text("WhatsApp"),
        bottom: new TabBar(
          controller: _tabControler,
          indicatorColor: Colors.white,
          tabs:<Widget>[
            new Tab(icon: new Icon(Icons.camera_alt)),
            new Tab(text: ("CHATS"),),
            new Tab(text:("STATUS")), 
            new Tab(text: ("CALLS")),
          ]
        ),
      ),
      body: new Scaffold()
    );
  }
}