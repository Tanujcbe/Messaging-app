import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
<<<<<<< HEAD
import 'package:login/fold/User.dart';
import 'package:login/signup.dart';
import 'package:login/whatsapp.dart';
import 'package:async/async.dart';
import 'package:firebase_auth/firebase_auth.dart';

=======
import 'package:login/signup.dart';
import 'package:async/async.dart';
>>>>>>> 31096ccfe98a9d62c493cb6d9ee8c724a2bc1983
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
<<<<<<< HEAD
  String _email,_passwd;
  final GlobalKey<FormState> _formkey= GlobalKey<FormState>();
=======
  
>>>>>>> 31096ccfe98a9d62c493cb6d9ee8c724a2bc1983
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
<<<<<<< HEAD
                  key: _formkey,
=======
>>>>>>> 31096ccfe98a9d62c493cb6d9ee8c724a2bc1983
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
<<<<<<< HEAD
                          onSaved: (input)=>_email=input,
=======
>>>>>>> 31096ccfe98a9d62c493cb6d9ee8c724a2bc1983
                      ),
                       new TextFormField(
                            decoration:new InputDecoration(
                              labelText: "Password",
<<<<<<< HEAD
                              hintText: "********"                           
                            ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          onSaved: (input)=>_passwd=input,
=======
                              hintText: "********"
                              
                            ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
>>>>>>> 31096ccfe98a9d62c493cb6d9ee8c724a2bc1983
                        ),
                        SizedBox(height: 50),
                          Row(
                            children: <Widget>[
                              new MaterialButton(
                                color: Colors.blueGrey,
                                onPressed:(){
                                  debugPrint("Login");
<<<<<<< HEAD
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                     builder: (context){
                                       return WhatsApp();
                                     }
                                    )
                                  );
=======
>>>>>>> 31096ccfe98a9d62c493cb6d9ee8c724a2bc1983
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
<<<<<<< HEAD
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
=======
  }
}

>>>>>>> 31096ccfe98a9d62c493cb6d9ee8c724a2bc1983
