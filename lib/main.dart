import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:login/fold/User.dart';
import 'package:login/signup.dart';
import 'package:login/whatsapp.dart';
import 'package:async/async.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  String _email,_passwd;
  final GlobalKey<FormState> _formkey= GlobalKey<FormState>();
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
                  key: _formkey,
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
                          onSaved: (input)=>_email=input,
                      ),
                       new TextFormField(
                            decoration:new InputDecoration(
                              labelText: "Password",
                              hintText: "********"                           
                            ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          onSaved: (input)=>_passwd=input,
                        ),
                        SizedBox(height: 50),
                          Row(
                            children: <Widget>[
                              new MaterialButton(
                                color: Colors.blueGrey,
                                onPressed:(){
                                  debugPrint("Login");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                     builder: (context){
                                       return WhatsApp();
                                     }
                                    )
                                  );
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

class Authservice{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Users _usersFromFirebase(FirebaseUser user){
    return user != null? Users(UserId:user.uid):null;
  }
  Future Log_In(String email,String password) async{
    try{
      AuthResult result =await _auth.signInWithEmailAndPassword(email: null, password: null);
      FirebaseUser firebaseUser=result.user;
      return _usersFromFirebase(firebaseUser);
    } 
    catch(e){
      print(e.toString());
    }
  }
  Future Sign_Up(String email,String password) async{
    try{
      AuthResult result =await _auth.createUserWithEmailAndPassword(email: null, password: null);
      FirebaseUser firebaseUser=result.user;
      return _usersFromFirebase(firebaseUser);
    } 
    catch(e){
      print(e.toString());
    }
  }
}