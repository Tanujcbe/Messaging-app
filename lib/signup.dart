import 'package:flutter/material.dart';
import 'package:login/main.dart';

class SignUp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
      theme: new ThemeData(
        // backgroundColor: Colors.lightBlueAccent,
      ),
    );
  }
}

class SignUpPage extends StatefulWidget{
  @override
  State createState()=> new SignUpPageState();
  }

class SignUpPageState extends State<SignUpPage> with SingleTickerProviderStateMixin{
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  @override
  void initState(){
    super.initState();
    _iconAnimationController=new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 100),
      );
      _iconAnimation=new CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.easeOut,
        );
        _iconAnimation.addListener(()=>this.setState((){}));
        _iconAnimationController.forward();
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          new Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new FlutterLogo(
                  size: _iconAnimation.value*100,
                ),
            new Stack(
              children:<Widget>[
                  new Form(
                    child: Theme(
                  data: new ThemeData(
                    // brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                        color: Colors.teal,
                        fontSize: 20.0,
                      )
                    )
                  ),
                  child: new Container(
                    padding:const EdgeInsets.all(40.0),
                    child:new Column(
                      children: <Widget>[
                          new TextFormField(
                            decoration:new InputDecoration(
                              labelText: "Email Address",
                              hintText: "yourmail@example.com"
                            ),
                          keyboardType: TextInputType.emailAddress,
                          ),

                          new TextFormField(
                            decoration:new InputDecoration(
                              labelText: "Username",
                              hintText: "UserName"
                            ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          decoration:new InputDecoration(
                            labelText: "Password",
                            hintText: "Password"
                          ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        ),
                        new TextFormField(
                          decoration:new InputDecoration(
                            labelText: "Password",
                            hintText: "Password"
                          ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        ),
                        new MaterialButton(
                          color: Colors.blueGrey,
                          onPressed:(){
                            debugPrint("Created");
                            },
                          child: new Text("Create"),
                        ),
                      ],
                    )
                  ),  
                )
              ),
              ],
            ),
          ]
        )
      ],  
      )    
    ); 
  }
}