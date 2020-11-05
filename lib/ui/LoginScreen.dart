import 'package:flutter/material.dart';
import 'package:kabarnagari/Animation/FadeAnimation.dart';
import 'package:kabarnagari/ui/HomeScreen.dart';
import 'package:kabarnagari/ui/RegisterScreen.dart';
import 'package:kabarnagari/ui/Root.dart';
import 'package:kabarnagari/ui/TambahDataScreen.dart';
import 'package:kabarnagari/ui/sections/All.dart';
import 'package:kabarnagari/validator/validasi.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum statusLogin { signIn, notSignIn }
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  statusLogin _loginStatus = statusLogin.notSignIn;

  var cEmail = new TextEditingController();

  var cPassword = new TextEditingController();
  Validasi validasi = new Validasi();

  @override
  Widget build(BuildContext context) {

    switch (_loginStatus) {
      case statusLogin.notSignIn:
        return Scaffold(


            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/background.png'),
                              fit: BoxFit.fill
                          )
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 30,
                            width: 80,
                            height: 200,
                            child: FadeAnimation(1, Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-1.png')
                                  )
                              ),
                            )),
                          ),
                          Positioned(
                            left: 140,
                            width: 80,
                            height: 150,
                            child: FadeAnimation(1.3, Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-2.png')
                                  )
                              ),
                            )),
                          ),
                          Positioned(
                            right: 40,
                            top: 40,
                            width: 80,
                            height: 150,
                            child: FadeAnimation(1.5, Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/clock.png')
                                  )
                              ),
                            )),
                          ),
                          Positioned(
                            child: FadeAnimation(1.6, Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Center(
                                child: Text("Login", style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),),
                              ),
                            )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          FadeAnimation(1.8, Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10)
                                  )
                                ]
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(
                                          color: Colors.grey[100]))
                                  ),
                                  child: TextField(
                                    controller: cEmail,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Email",
                                        hintStyle: TextStyle(
                                            color: Colors.grey[400])
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    obscureText: true,
                                    controller: cPassword,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle: TextStyle(
                                            color: Colors.grey[400])
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                          SizedBox(height: 30,),
                          InkWell(
                            onTap: () {
//                          Navigator.of(context).push(MaterialPageRoute(
//                              builder: (context) =>HomeScreen()
//                          ));
                              validasi.valdasi_login(context, cEmail.text,
                                  cPassword.text);
                            },

                            child: FadeAnimation(2, Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      colors: [
                                        Color.fromRGBO(143, 148, 251, 1),
                                        Color.fromRGBO(143, 148, 251, .6),
                                      ]
                                  )
                              ),
                              child: Center(

                                child: Text("Login", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),),
                              ),
                            )),

                          ),

                          SizedBox(height: 30,),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RegisterScreen()
                              ));
                            },
                            child: FadeAnimation(6, Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      colors: [
                                        Color.fromRGBO(143, 148, 251, 1),
                                        Color.fromRGBO(143, 148, 251, .6),
                                      ]
                                  )
                              ),
                              child: Center(
                                child: Text("Register", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),),
                              ),
                            )),

                          ),

                          SizedBox(height: 70,),
                          FadeAnimation(1.5, Text(
                            "Forgot Password?", style: TextStyle(color: Color
                              .fromRGBO(143, 148, 251, 1)),)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
        );
        break;
      case statusLogin.signIn:
        return  HomeScreen();
        break;
    }
  }

  getDataPref() async {

    SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    setState(() {
      int nvalue = sharedPreferences.getInt("value");
      _loginStatus = nvalue == 1 ? statusLogin.signIn : statusLogin.notSignIn;
    });

  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getDataPref();
    });

  }

}
