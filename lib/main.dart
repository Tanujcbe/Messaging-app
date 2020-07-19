import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:login/signup.dart';
import 'package:async/async.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: new ThemeData(
        // backgroundColor: Colors.lightBlueAccent,
      ),

    );
  }
}

class LoginPage extends StatefulWidget{
  @override
  State createState()=> new LoginPageState();
  }

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
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
    return new Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true
        ),
      body: new Stack(
        children: <Widget>[
          new Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value*100,
              ),
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
                      padding: const EdgeInsets.all(40.0),
                      child: new Column(
                        children: <Widget>[
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
                              hintText: "********"
                              
                            ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        SizedBox(height: 50),
                          Row(
                            children: <Widget>[
                              new MaterialButton(
                                color: Colors.blueGrey,
                                onPressed:(){
                                  debugPrint("Login");
                                },
                                child: new Text(
                                  "Login"
                                ),
                              ),
                              SizedBox(width: 100),
                              new MaterialButton(
                                color: Colors.blueGrey,
                                onPressed:(){
                                  debugPrint("SignUp");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                     builder: (context){
                                       return SignUp();
                                     }
                                      )
                                  );
                                },
                                child: new Text(
                                  "SignUp"
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

